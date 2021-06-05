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

entity AXI_Rectification is
  generic (
    DATA_WIDTH : integer := 24 --! width of audio data
  );
  port (
    clk        : in std_logic; --! clock
    rst        : in std_logic; --! active-low clock
    led_enable : out std_logic; --! effect enabled
    switch     : in std_logic; --! half -> full rectification
    enable     : in std_logic; --! enable effect

    -- AXI-STREAM receive
    s_axis_tdata  : in std_logic_vector(data_width - 1 downto 0); --! data received 
    s_axis_tvalid : in std_logic; --! valid data
    s_axis_tlast  : in std_logic; --! left right data
    s_axis_tready : out std_logic; --! ready to receive
    -- AXI-STREAM send
    m_axis_tdata  : out std_logic_vector(data_width - 1 downto 0); --! data to send
    m_axis_tvalid : out std_logic; --! valid data
    m_axis_tlast  : out std_logic; --! left right data
    m_axis_tready : in std_logic --! ready to send
  );
  attribute X_INTERFACE_INFO : string;
end AXI_Rectification;

architecture Effects of AXI_Rectification is
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of m_axis_tlast  : signal is "xilinx.com:interface:axis:1.0 m_axis TLAST";
  attribute X_INTERFACE_INFO of m_axis_tdata  : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";

  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_INFO of s_axis_tlast  : signal is "xilinx.com:interface:axis:1.0 s_axis TLAST";
  attribute X_INTERFACE_INFO of s_axis_tdata  : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";

  type STATE_TYPE is (idle, transfert, edit);
  signal state : STATE_TYPE := idle; --! state fsm
  signal ready : std_logic  := '0'; --! axi ready
  signal data  : std_logic_vector(DATA_WIDTH - 1 downto 0); --! data received
  signal dataf : std_logic_vector(DATA_WIDTH - 1 downto 0); --! data to send
  signal tlast : std_logic; --! store tlast
  signal en    : std_logic; --! effect enable
  signal sw    : std_logic; --! switch half -> full rectification

begin
  rectification_process : process (clk, rst) is
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
          state         <= edit;
        when edit =>
          m_axis_tvalid <= '0';
          if (en = '1') and (sw = '1') and (TO_INTEGER(SIGNED(data)) < 0) then
            dataf <= std_logic_vector(TO_SIGNED(-TO_INTEGER(SIGNED(data)), DATA_WIDTH));
          elsif (en = '1') and (sw = '0') and (TO_INTEGER(SIGNED(data)) < 0) then
            dataf <= std_logic_vector(TO_SIGNED(0, DATA_WIDTH));
          else
            dataf <= data;
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
      sw         <= switch;
    end if;
  end process;

  ready         <= m_axis_tready or not s_axis_tvalid;
  s_axis_tready <= ready;
end Effects;