----------------------------------------------------------------------------------
-- Company: ECAM
-- Student: Thibaut Maringer
-- 
-- Create Date: 04/28/2021 02:43:17 PM
-- Project Name: I2S_Transceiver
-- Target Devices: Pynq Z2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity AXI_Echo is
  generic (
    data_width    : integer := 24; --! width of data
    ram_length    : integer := 96000; --! size of echo array
    default_delay : integer := 96000; --! default echo delay
    default_gain  : integer := 512 -- 0.5 * 2^10 --! default gain
  );
  port (
    clk : in std_logic; --! clock
    rst : in std_logic; --! active-low reset

    led_enable : out std_logic; --! effect is enable
    enable     : in std_logic; --! effect enable
    switch     : in std_logic; --! switch
    led_g1     : out std_logic; --! flanger effect down
    led_g2     : out std_logic; --! flanger effect up
    -- AXI-STREAM receive
    s_axis_tdata  : in std_logic_vector(data_width - 1 downto 0); --! data received 
    s_axis_tvalid : in std_logic; --! valid data
    s_axis_tlast  : in std_logic; --! left right data
    s_axis_tready : out std_logic; --! ready to receive
    -- AXI-STREAM send
    m_axis_tdata  : out std_logic_vector(data_width - 1 downto 0); --! data to send
    m_axis_tvalid : out std_logic; --! valid data
    m_axis_tlast  : out std_logic; --! left right data
    m_axis_tready : in std_logic; --! ready to send
    
    m_axis1_tdata  : out std_logic_vector(data_width - 1 downto 0); --! data to send
    src_send :  out std_logic;
    
    -- APB
    s_apb_paddr   : in std_logic_vector(31 downto 0); --! apb address
    s_apb_psel    : in std_logic; --! apb select
    s_apb_penable : in std_logic; --! apb enable
    s_apb_pwrite  : in std_logic; --! apb write or read
    s_apb_pwdata  : in std_logic_vector(31 downto 0); --! apb write data
    s_apb_pready  : out std_logic; --! apb ready to communicate
    s_apb_prdata  : out std_logic_vector(31 downto 0); --! apb read data
    s_apb_pslverr : out std_logic --! communication locked
  );
  attribute X_INTERFACE_INFO : string;
end AXI_Echo;

architecture Behavioral of AXI_Echo is
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of m_axis_tlast  : signal is "xilinx.com:interface:axis:1.0 m_axis TLAST";
  attribute X_INTERFACE_INFO of m_axis_tdata  : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";
  
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_INFO of s_axis_tlast  : signal is "xilinx.com:interface:axis:1.0 s_axis TLAST";
  attribute X_INTERFACE_INFO of s_axis_tdata  : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";

  attribute X_INTERFACE_INFO of s_apb_paddr   : signal is "xilinx.com:interface:apb:1.0 s_apb PADDR";
  attribute X_INTERFACE_INFO of s_apb_psel    : signal is "xilinx.com:interface:apb:1.0 s_apb PSEL";
  attribute X_INTERFACE_INFO of s_apb_penable : signal is "xilinx.com:interface:apb:1.0 s_apb PENABLE";
  attribute X_INTERFACE_INFO of s_apb_pwrite  : signal is "xilinx.com:interface:apb:1.0 s_apb PWRITE";
  attribute X_INTERFACE_INFO of s_apb_pwdata  : signal is "xilinx.com:interface:apb:1.0 s_apb PWDATA";
  attribute X_INTERFACE_INFO of s_apb_pready  : signal is "xilinx.com:interface:apb:1.0 s_apb PREADY";
  attribute X_INTERFACE_INFO of s_apb_prdata  : signal is "xilinx.com:interface:apb:1.0 s_apb PRDATA";
  attribute X_INTERFACE_INFO of s_apb_pslverr : signal is "xilinx.com:interface:apb:1.0 s_apb PSLVERR";

  type STATE_TYPE is (idle, transfert, edit);
  signal state : STATE_TYPE := idle;

  type t_ram is array (ram_length - 2 downto 0) of std_logic_vector(data_width - 1 downto 0);
  signal m_ram                 : t_ram; --! store data
  attribute ram_style          : string;
  attribute ram_style of m_ram : signal is "block";
  signal gain                  : std_logic_vector(9 downto 0) := std_logic_vector(to_unsigned(default_gain, 10)); --! gain
  signal delay                 : integer                      := default_delay; --! delay echo
  signal r_addr_wr             : integer range 0 to ram_length - 2; --! write address
  signal r_addr_rd             : integer range 0 to ram_length - 2; --! read address
  signal r_enable_read         : std_logic; --! read enable
  signal prevdelay             : integer; --! previous delay
  signal ready                 : std_logic := '0'; --! ready to receive
  signal data                  : std_logic_vector(data_width - 1 downto 0); --! received data
  signal dataf                 : std_logic_vector(data_width - 1 downto 0); --! data to send
  signal tlast                 : std_logic; --! received tlast
  signal en                    : std_logic; --! effect enable
  signal product               : signed(data_width + 9 downto 0); --! product with gain
  signal flanger               : std_logic := '0'; --! flanger effect bonus
  signal prevswitch            : std_logic := '0'; --! previous switch value
  signal previous              : integer; --! previous delay for flanger
  signal count1                : integer; --! counter 1 flanger
  signal count2                : integer; --! counter 2 flanger
  signal treshold              : integer; --! treshold flanger
begin
  echo_process : process (clk, rst) is
  begin
    if rst = '0' then
      state <= idle;
    elsif rising_edge(clk) then
      case state is
        when idle =>
          if (s_axis_tvalid = '1') and (ready = '1') then
            state <= transfert;
          end if;
        when transfert =>
          m_axis_tvalid <= '1';
          m_axis_tdata  <= dataf;
          m_axis_tlast  <= tlast;
          m_axis1_tdata  <= dataf;
          src_send <= '1';
          data          <= s_axis_tdata;
          tlast         <= s_axis_tlast;
          state         <= edit;
        when edit =>
          m_axis_tvalid <= '0';
          src_send <= '0';
          if (en = '1') then
            if (delay /= prevdelay) then
              r_addr_wr     <= 0;
              r_enable_read <= '0';
              r_addr_rd     <= 0;
              prevdelay     <= delay;
              dataf         <= data;
              state         <= idle;
            else
              if (r_enable_read = '1') and (flanger = '1') then
                product <= signed(m_ram(r_addr_rd)) * to_signed(to_integer(unsigned(gain)), 10);
                dataf   <= std_logic_vector(signed(data) + product(data_width + 9 downto 10));
                if (r_addr_rd < (count2 - 2)) then
                  r_addr_rd <= r_addr_rd + 1;
                else
                  r_addr_rd <= 0;
                end if;
              elsif (r_enable_read = '1') and (flanger = '0') then
                product <= signed(m_ram(r_addr_rd)) * to_signed(to_integer(unsigned(gain)), 10);
                dataf   <= std_logic_vector(signed(data) + product(data_width + 9 downto 10));
                if (r_addr_rd < delay - 2) then
                  r_addr_rd <= r_addr_rd + 1;
                else
                  r_addr_rd <= 0;
                end if;
              else
                dataf <= data;
              end if;
              m_ram(r_addr_wr) <= dataf;
              if (r_addr_wr < delay - 2) then
                r_addr_wr <= r_addr_wr + 1;
              else
                r_addr_wr     <= 0;
                r_enable_read <= '1';
              end if;
            end if;
          else
            r_addr_wr     <= 0;
            r_addr_rd     <= 0;
            r_enable_read <= '0';
            dataf         <= data;
          end if;
          state <= idle;
        when others =>
          state <= idle;
      end case;
    end if;
  end process;

  led_process : process (clk) is
  begin
    if rising_edge(clk) then
      en         <= enable;
      led_enable <= r_enable_read;
    end if;
  end process;

  flanger_and_apb_process : process (clk) is
  begin
    if rising_edge(clk) then
      if (s_apb_pwrite = '1') and (s_apb_psel = '1') and (s_apb_penable = '1') then
        delay <= to_integer(unsigned(s_apb_pwdata(27 downto 10)));
        gain  <= s_apb_pwdata(9 downto 0);
      else
        if en = '1' then
          if switch = '1' and prevswitch = '0' then
            prevswitch <= '1';
            previous   <= delay;
            delay      <= 250;
            count2     <= 125;
            count1     <= 0;
            flanger    <= '1';
            treshold   <= 0;
          elsif (switch = '1') then
            prevswitch <= '1';
            if (count2 < 450) and (count2 > 50) then
              if count1 < 125000 then
                count1 <= count1 + 1;
              else
                count1 <= 0;
                if (treshold = 1) then
                  count2 <= count2 - 1;
                  led_g1 <= '1';
                  led_g2 <= '0';
                else
                  count2 <= count2 + 1;
                  led_g1 <= '0';
                  led_g2 <= '1';
                end if;
              end if;
            elsif count2 = 450 then
              treshold <= 1;
              count1   <= 0;
              count2   <= 449;
            elsif count2 = 50 then
              treshold <= 0;
              count1   <= 0;
              count2   <= 51;
            end if;
          elsif switch = '0' then
            prevswitch <= '0';
            flanger    <= '0';
            if previous /= 0 then
              delay <= previous;
            end if;
            led_g1 <= '0';
            led_g2 <= '0';
          end if;
        else
          led_g1 <= '0';
          led_g2 <= '0';
        end if;
      end if;
    end if;
  end process;
  s_apb_pready               <= '1';
  s_apb_prdata(27 downto 10) <= std_logic_vector(to_unsigned(delay, 18));
  s_apb_prdata(9 downto 0)   <= gain;
  s_apb_pslverr              <= '0';
  ready                      <= m_axis_tready or not s_axis_tvalid;
  s_axis_tready              <= ready;
end Behavioral;