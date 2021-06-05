----------------------------------------------------------------------------------
-- Company: ECAM
-- Student: Thibaut Maringer
-- 
-- Create Date: 04/28/2021 02:43:17 PM
-- Project Name: I2S_Transceiver
-- Target Devices: Pynq Z2
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity AXI_Fir is
  generic (
    taps       : integer := 1024; --! number of taps for the fir
    norder     : integer := 4; --! parallel fir computation
    data_width : integer := 24; --! width of the audio data
    coef_width : integer := 32 --! width of the coefficients
  );
  port (
    clk        : in std_logic; --! clock
    rst        : in std_logic; --! active-low reset
    enable     : in std_logic; --! effect enable
    led_enable : out std_logic; --! effect is active
    -- AXI-STREAM received
    s_axis_tdata  : in std_logic_vector(data_width - 1 downto 0); --! received data
    s_axis_tvalid : in std_logic; --! received data valid
    s_axis_tlast  : in std_logic; --! received left right
    s_axis_tready : out std_logic; --! ready to receive
    -- AXI-STREAM sent
    m_axis_tdata  : out std_logic_vector(data_width - 1 downto 0); --! sent data
    m_axis_tvalid : out std_logic; --! sent data valid
    m_axis_tlast  : out std_logic; --! sent left right
    m_axis_tready : in std_logic; --! ready to send
    -- APB-SLAVE
    s_apb_paddr   : in std_logic_vector(31 downto 0); --! apb address
    s_apb_psel    : in std_logic; --! apb selection
    s_apb_penable : in std_logic; --! apb enable
    s_apb_pwrite  : in std_logic; --! apb write or read
    s_apb_pwdata  : in std_logic_vector(31 downto 0); --! apb write data
    s_apb_pready  : out std_logic; --! apb ready to communicate
    s_apb_prdata  : out std_logic_vector(31 downto 0); --! apb read data
    s_apb_pslverr : out std_logic --! apb communication locked
  );
  attribute X_INTERFACE_INFO : string;
end entity AXI_Fir;

architecture Effects of AXI_Fir is
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

  attribute ram_style : string;
  type RAM_data is array(0 to taps - 1) of std_logic_vector(data_width - 1 downto 0); --! data received
  type RAM_coef is array(0 to taps - 1) of std_logic_vector(coef_width - 1 downto 0); --! coef received
  type coefficient_array is array (0 to norder - 1) of signed(coef_width - 1 downto 0); --! coef for parallel
  type data_array is array (0 to norder - 1) of signed(data_width - 1 downto 0); --! data for parallel
  type product_array is array (0 to norder - 1) of signed((data_width + coef_width) - 1 downto 0); --! result of parallel
  type state_type is (idle, transfert, compute, result); --! state of the effect
  signal ram                  : RAM_data; --! data received
  attribute ram_style of ram  : signal is "block";
  signal coef                 : RAM_coef; --! coef received
  attribute ram_style of coef : signal is "block";
  signal coeff_int            : coefficient_array; --! coef for parallel
  signal data_pipeline        : data_array; --! data for parallel
  signal products             : product_array; --! result of parallel
  signal state                : state_type := idle; --! state of the fsm
  signal rave                 : integer range 0 to taps/norder; --! fir iteration per data
  signal data_number          : integer := 0; --! counter for data
  signal coef_number          : integer := 0; --! counter for coef
  signal dataf                : std_logic_vector(data_width - 1 downto 0); --! data to send
  signal data                 : std_logic_vector(data_width - 1 downto 0); --! received data
  signal size                 : integer   := taps; -- number of taps for apb
  signal coef_done            : std_logic := '0'; --! coef array full
  signal en                   : std_logic := '0'; --! effect enabled
  signal ready                : std_logic; --! ready signal
  signal tlast                : std_logic; --! received tlast
  signal ledcount             : integer; --! blinking led when waiting
  signal data_done            : std_logic; --! data array full
  signal count                : integer; --! fir adder

begin
  --! fir effect process with the fsm
  fir_effect : process (clk, rst) is
    variable data1 : std_logic_vector(data_width - 1 downto 0);
    variable adder : integer;
    variable sum   : SIGNED(data_width + coef_width - 1 downto 0);
  begin
    if rst = '0' then -- if reset
      data_done   <= '0';
      data_number <= 0;
      state       <= idle;
    elsif rising_edge(clk) then
      case state is
        when idle =>
          if (s_axis_tvalid = '1') and (ready = '1') then --ready to communicate
            state <= transfert; -- lets transfert data
          end if;
        when transfert => -- communication receive and send
          m_axis_tvalid    <= '1';
          m_axis_tdata     <= dataf;
          m_axis_tlast     <= tlast;
          tlast            <= s_axis_tlast;
          data             <= s_axis_tdata;
          ram(data_number) <= s_axis_tdata;
          if (data_number < (taps - 1)) then
            data_number <= data_number + 1;
          else
            data_number <= 0;
            data_done   <= '1';
          end if;
          rave  <= 0;
          count <= 0;
          state <= compute; -- when received -> modify the gain
        when compute => -- compute fir (x and +)
          m_axis_tvalid <= '0';
          if coef_done = '1' and data_done = '1' and en = '1' then
            for i in 0 to norder - 1 loop
              if (data_number - 1 - ((rave - 1) * norder + i)) < 0 then
                data_pipeline(i) <= signed(ram(data_number - 1 - (rave * norder + i) + taps));
              else
                data_pipeline(i) <= signed(ram(data_number - 1 - (rave * norder + i)));
              end if;
              coeff_int(i) <= signed(coef(rave * norder + i));
            end loop;
            sum := (others => '0');
            for i in 0 to norder - 1 loop -- sum the products
              sum := sum + products(i);
            end loop;
            count <= count + to_integer(shift_right(sum, 30)); -- remove 2**30
            if rave = taps/norder - 1 then
              state <= result; -- computation done
            else
              rave <= rave + 1;
            end if;
          else
            dataf <= data;
            state <= idle;
          end if;
        when result => -- return the result
          dataf <= std_logic_vector(to_signed(count, 24)); -- resize data for audio data 24 bits
          state <= idle; -- return to idle
      end case;
    end if;
  end process;

  --! multipliers
  product_calc : for i in 0 to norder - 1 generate
    products(i) <= data_pipeline(i) * coeff_int(i);
  end generate;

  --! led management (off-blinking-on)
  led : process (clk)
  begin
    if rising_edge(clk) then
      en <= enable;
      if (en = '1') then
        case coef_done is
          when '0' =>
            if ledcount < 25000000 then
              ledcount   <= ledcount + 1;
              led_enable <= '0';
            elsif ledcount < 50000000 then
              ledcount   <= ledcount + 1;
              led_enable <= '1';
            else
              ledcount <= 0;
            end if;
          when '1' =>
            if data_done = '1' then
              led_enable <= '1';
            else
              led_enable <= '0';
            end if;
          when others =>
            led_enable <= '0';
        end case;
      else
        led_enable <= '0';
      end if;
    end if;
  end process;

  --! receive coefficients with apb
  coef_process : process (clk, rst) is
  begin
    if rst = '0' then
      coef_done   <= '0';
      coef_number <= 0;
    elsif rising_edge(clk) then
      if (s_apb_pwrite = '1') and (s_apb_psel = '1') and (s_apb_penable = '1') then
        if (to_integer(unsigned(s_apb_pwdata)) = taps) then
          size        <= to_integer(unsigned(s_apb_pwdata));
          coef_done   <= '0';
          coef_number <= 0;
        else
          coef(coef_number) <= s_apb_pwdata;
          if (coef_number = taps - 1) then
            coef_done <= '1';
          else
            coef_number <= coef_number + 1;
          end if;
        end if;
      end if;
    end if;
  end process;
  s_apb_pready  <= '1';
  s_apb_prdata  <= std_logic_vector(to_unsigned(size, 32));
  s_apb_pslverr <= '0';
  ready         <= m_axis_tready or not s_axis_tvalid;
  s_axis_tready <= ready;

end architecture Effects;