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

entity AXI_Gain is
  generic (
    data_width : integer := 24; --! width of the audio data
    gain       : integer := 1 --! default gain: x1
  );
  port (
    clk : in std_logic; --! clock
    rst : in std_logic; --! active-low reset
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
end AXI_Gain;

architecture Effects of Axi_Gain is

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

  type STATE_TYPE is (idle, transfert, edit); --! states of the effect
  signal state     : STATE_TYPE := idle; --! state of the FSM
  signal ready     : std_logic  := '0'; --! computed s_axis_tready
  signal data      : std_logic_vector(data_width - 1 downto 0); --! received data
  signal dataf     : std_logic_vector(data_width - 1 downto 0) := (others => '0'); --! data to send
  signal tlast     : std_logic; --! received tlast
  signal gainvalue : integer := gain; --! gain

begin

  --! gain effect process with the FSM
  gain_effect : process (clk, rst) is
  begin
    if rst = '0' then -- if reset
      state <= idle;
    elsif rising_edge(clk) then
      --! FSM of the effect with state
      case state is
        when idle => -- nothing to do
          if (s_axis_tvalid = '1') and (ready = '1') then -- ready to communicate
            state <= transfert; -- lets transfert data
          end if;
        when transfert => -- communication receive and send
          m_axis_tvalid <= '1';
          m_axis_tdata  <= dataf;
          m_axis_tlast  <= tlast;
          data          <= s_axis_tdata;
          tlast         <= s_axis_tlast;
          state         <= edit; -- when received -> modify the gain
        when edit => -- apply gain
          m_axis_tvalid <= '0';
          dataf         <= std_logic_vector(to_signed(to_integer(signed(data)) * gainvalue, data_width));
          state         <= idle; -- return to idle
        when others =>
          state <= idle;
      end case;
    end if;
  end process;

  --! apb management process to change the gain
  apb_manag : process (clk) is
  begin
    if rising_edge(clk) then
      if (s_apb_pwrite = '1') and (s_apb_psel = '1') and (s_apb_penable = '1') then -- conditions for receiving data
        gainvalue <= to_integer(unsigned(s_apb_pwdata));
      end if;
    end if;
  end process;

  s_apb_pready  <= '1';
  s_apb_prdata  <= std_logic_vector(to_unsigned(gainvalue, 32));
  s_apb_pslverr <= '0';
  ready         <= m_axis_tready or not s_axis_tvalid;
  s_axis_tready <= ready;
end Effects;