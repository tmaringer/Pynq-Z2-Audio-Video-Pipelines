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

entity AXI_Saturation is
  generic (
    DATA_WIDTH : integer := 24; --! width of audio data
    DATA_HIGH  : integer := 500000; --! high-saturation
    DATA_LOW   : integer := - 500000 --! low-saturation
  );
  port (
    clk        : in std_logic; --! clock
    rst        : in std_logic; --! active-low reset
    led_enable : out std_logic; --! effect enabled
    led_top_l  : out std_logic; --! saturation-high left
    led_bot_l  : out std_logic; --! saturation-low left
    led_top_r  : out std_logic;  --! saturation-high right
    led_bot_r  : out std_logic;  --! saturation-low left
    enable     : in std_logic;  --! enable effect
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
end AXI_Saturation;

architecture Effects of AXI_Saturation is
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

  signal ready      : std_logic := '0'; --! axi ready
  signal data       : std_logic_vector(DATA_WIDTH - 1 downto 0); --! received data
  signal dataf      : std_logic_vector(DATA_WIDTH - 1 downto 0); --! data to send
  signal tlast      : std_logic; --! store tlast
  signal en         : std_logic; --! effect enable
  signal led0       : std_logic; --! saturation 1
  signal led1       : std_logic; --! saturation 2
  signal led2       : std_logic; --! saturation 3
  signal led3       : std_logic; --! saturation 4
  signal statushigh : std_logic_vector(19 downto 0) := std_logic_vector(to_signed(DATA_HIGH, 20));
  signal statuslow  : std_logic_vector(19 downto 0) := std_logic_vector(to_signed(DATA_LOW, 20));

begin
  saturation_process : process (clk, rst) is
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
          data          <= s_axis_tdata;
          tlast         <= s_axis_tlast;
          led_top_l     <= led0;
          led_bot_l     <= led1;
          led_top_r     <= led2;
          led_bot_r     <= led3;
          state         <= edit;
        when edit =>
          m_axis_tvalid <= '0';
          if (en = '1') and (TO_INTEGER(SIGNED(data)) > TO_INTEGER(SIGNED(statushigh))) then
            dataf <= std_logic_vector(TO_SIGNED(TO_INTEGER(SIGNED(statushigh)), DATA_WIDTH));
            if tlast = '1' then
              led0 <= '1';
              led1 <= '0';
              led2 <= '0';
              led3 <= '0';
            else
              led0 <= '0';
              led1 <= '0';
              led2 <= '1';
              led3 <= '0';
            end if;
          elsif (en = '1') and (TO_INTEGER(SIGNED(data)) < TO_INTEGER(SIGNED(statuslow))) then
            dataf <= std_logic_vector(TO_SIGNED(TO_INTEGER(SIGNED(statuslow)), DATA_WIDTH));
            if tlast = '1' then
              led0 <= '0';
              led1 <= '1';
              led2 <= '0';
              led3 <= '0';
            else
              led0 <= '0';
              led1 <= '0';
              led2 <= '0';
              led3 <= '1';
            end if;
          else
            dataf <= data;
            led0  <= '0';
            led1  <= '0';
            led2  <= '0';
            led3  <= '0';
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
      led_enable <= en;
    end if;
  end process;

  apb_process : process (clk) is
  begin
    if rising_edge(clk) then
      if (s_apb_pwrite = '1') and (s_apb_psel = '1') and (s_apb_penable = '1') then
        statushigh              <= (others => '0');
        statuslow               <= (others => '0');
        statushigh(19 downto 4) <= s_apb_pwdata(31 downto 16);
        statuslow(19 downto 4)  <= s_apb_pwdata(15 downto 0);
      end if;
    end if;
  end process;

  s_apb_pready               <= '1';
  s_apb_prdata(31 downto 16) <= statushigh(19 downto 4);
  s_apb_prdata(15 downto 0)  <= statuslow(19 downto 4);
  s_apb_pslverr              <= '0';
  ready                          <= m_axis_tready or not s_axis_tvalid;
  s_axis_tready                  <= ready;
end Effects;