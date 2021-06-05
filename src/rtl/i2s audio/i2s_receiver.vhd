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

entity I2S_Receiver is
  generic (
    DATA_WIDTH : integer := 32 --! width of data
  );
  port (
    -- I2S
    bclk  : in std_logic; --! bit clock
    lrclk : in std_logic; --! left right clock
    sdata : in std_logic; --! data
    -- AXI-STREAM
    m_axis_aclk    : in std_logic; --! clock
    m_axis_aresetn : in std_logic; --! active-low reset
    m_axis_tvalid  : out std_logic; --! valid data
    m_axis_tdata   : out std_logic_vector(DATA_WIDTH - 1 downto 0); --! data to send
    m_axis_tlast   : out std_logic; --! left right data
    m_axis_tready  : in std_logic --! ready to receive
  );
  attribute X_INTERFACE_INFO : string;
end I2S_Receiver;

architecture Behavioral of I2S_Receiver is

  attribute X_INTERFACE_INFO of m_axis_aclk    : signal is "xilinx.com:interface:axis:1.0 m_axis ACLK";
  attribute X_INTERFACE_INFO of m_axis_aresetn : signal is "xilinx.com:interface:axis:1.0 m_axis ARESETN";
  attribute X_INTERFACE_INFO of m_axis_tvalid  : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of m_axis_tlast   : signal is "xilinx.com:interface:axis:1.0 m_axis TLAST";
  attribute X_INTERFACE_INFO of m_axis_tdata   : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_INFO of m_axis_tready  : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";

  signal bclk_sync : std_logic_vector(1 downto 0); --! sync of blck
  signal bclk_rise : std_logic; --! bclk rise time
  signal bclk_fall : std_logic; --! bclk fall time
  signal lrclkd    : std_logic := '0'; --! lrclk FF
  signal lrclkdd   : std_logic; --! lrclk FF of FF
  signal lrclkp    : std_logic; --! xor between lrclk FF of FF and lrclk FF
  signal counter   : integer; --! counter of bits
  signal shift     : std_logic_vector(DATA_WIDTH - 1 downto 0); --! shift array

begin

  bclk_process : process (m_axis_aclk) is
  begin
    if rising_edge(m_axis_aclk) then
      bclk_sync(1) <= bclk_sync(0);
      bclk_sync(0) <= bclk;
      if (bclk_sync = "01") then
        bclk_rise <= '1';
      else
        bclk_rise <= '0';
      end if;
      if (bclk_sync = "10") then
        bclk_fall <= '1';
      else
        bclk_fall <= '0';
      end if;
    end if;
  end process;

  lrclkd_process : process (m_axis_aclk) is
  begin
    if rising_edge(m_axis_aclk) then
      if (bclk_rise = '1') then
        lrclkd <= lrclk;
      end if;
    end if;
  end process;

  lrclkdd_process : process (m_axis_aclk) is
  begin
    if rising_edge(m_axis_aclk) then
      lrclkp <= lrclkd xor lrclkdd;
      if (bclk_rise = '1') then
        lrclkdd <= lrclkd;
      end if;
    end if;
  end process;

  counter_process : process (m_axis_aclk) is
  begin
    if rising_edge(m_axis_aclk) then
      if (bclk_fall = '1') then
        if (lrclkp = '1') then
          counter <= 0;
        elsif (counter < DATA_WIDTH) then
          counter <= counter + 1;
        end if;
      end if;
    end if;
  end process;

  read_sdata_process : process (m_axis_aclk) is
  begin
    if rising_edge(m_axis_aclk) then
      if (bclk_rise = '1') then
        if (lrclkp = '1') then
          shift <= (others => '0');
        elsif (counter < DATA_WIDTH) then
          shift((DATA_WIDTH - counter)) <= sdata;
        end if;
      end if;
    end if;
  end process;

  tdata_process : process (m_axis_aclk) is
  begin
    if rising_edge(m_axis_aclk) then
      if ((lrclkp and bclk_rise) = '1') then
        m_axis_tdata <= shift;
      end if;
    end if;
  end process;

  tvalid_process : process (m_axis_aclk) is
  begin
    if rising_edge(m_axis_aclk) then
      if (m_axis_aresetn = '0') then
        m_axis_tvalid <= '0';
      elsif ((lrclkp and bclk_rise) = '1') then
        m_axis_tvalid <= '1';
      elsif (m_axis_tready = '1') then
        m_axis_tvalid <= '0';
      end if;
    end if;
  end process;

  lrclk_process : process (m_axis_aclk) is
  begin
    if rising_edge(m_axis_aclk) then
      if ((lrclkp and bclk_rise) = '1') then
        m_axis_tlast <= not(lrclkd);
      end if;
    end if;
  end process;
end Behavioral;