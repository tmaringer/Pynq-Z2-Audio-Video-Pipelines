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

entity I2S_Transmitter is
  generic (
    DATA_WIDTH : integer := 32 --! width of data
  );
  port (
    -- I2S
    bclk  : in std_logic; --! bit clock
    lrclk : in std_logic; --! left right clock
    sdata : out std_logic; --! data
    -- AXI-STREAM
    s_axis_aclk    : in std_logic; --! clock
    s_axis_aresetn : in std_logic; --! active-low reset
    s_axis_tvalid  : in std_logic; --! valid data
    s_axis_tdata   : in std_logic_vector(DATA_WIDTH - 1 downto 0); --! data to send
    s_axis_tlast   : in std_logic; --! left right data
    s_axis_tready  : out std_logic --! ready to receive
  );
  attribute X_INTERFACE_INFO : string;
end I2S_Transmitter;

architecture Behavioral of I2S_Transmitter is
  attribute X_INTERFACE_INFO of s_axis_aclk    : signal is "xilinx.com:interface:axis:1.0 s_axis ACLK";
  attribute X_INTERFACE_INFO of s_axis_aresetn : signal is "xilinx.com:interface:axis:1.0 s_axis ARESETN";
  attribute X_INTERFACE_INFO of s_axis_tvalid  : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_INFO of s_axis_tlast   : signal is "xilinx.com:interface:axis:1.0 s_axis TLAST";
  attribute X_INTERFACE_INFO of s_axis_tdata   : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
  attribute X_INTERFACE_INFO of s_axis_tready  : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";

  signal tready     : std_logic; --! tready value
  signal bclk_sync  : std_logic_vector(1 downto 0); --! sync of blck
  signal bclk_rise  : std_logic; --! bclk rise time
  signal bclk_fall  : std_logic; --! bclk fall time
  signal lrclkd     : std_logic := '0'; --! lrclk FF
  signal lrclkdd    : std_logic; --! lrclk FF of FF
  signal lrclkp     : std_logic; --! xor between lrclk FF of FF and lrclk FF
  signal counter    : integer; --! counter of bits
  signal shift      : std_logic_vector(DATA_WIDTH - 1 downto 0); --! shift array
  signal data_left  : std_logic_vector(DATA_WIDTH - 1 downto 0); --! data left
  signal data_right : std_logic_vector(DATA_WIDTH - 1 downto 0); --! data right

begin
  bclk_process : process (s_axis_aclk) is
  begin
    if rising_edge(s_axis_aclk) then
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

  lrclkd_process : process (s_axis_aclk) is
  begin
    if rising_edge(s_axis_aclk) then
      if (bclk_rise = '1') then
        lrclkd <= lrclk;
      end if;
    end if;
  end process;

  lrclkdd_process : process (s_axis_aclk) is
  begin
    if rising_edge(s_axis_aclk) then
      if (bclk_rise = '1') then
        lrclkdd <= lrclkd;
      end if;
    end if;
  end process;

  data_rl : process (s_axis_aclk) is
  begin
    if rising_edge(s_axis_aclk) then
      lrclkp <= lrclkd xor lrclkdd;
      if (s_axis_aresetn = '0') then
        shift <= (others => '0');
      elsif (lrclkp = '1') then
        if (lrclkd = '1') then
          shift <= data_right;
        else
          shift <= data_left;
        end if;
      elsif (bclk_rise = '1') then
        shift(DATA_WIDTH - 1 downto 1) <= shift(DATA_WIDTH - 2 downto 0);
        shift(0)                       <= '0';
      end if;
    end if;
  end process;

  send_data : process (bclk) is
  begin
    if falling_edge(bclk) then
      sdata <= shift(DATA_WIDTH - 1);
    end if;
  end process;

  tready_process : process (s_axis_aclk) is
  begin
    if rising_edge(s_axis_aclk) then
      if (s_axis_aresetn = '0') then
        s_axis_tready <= '0';
        tready        <= '0';
      elsif ((tready and s_axis_tvalid) = '1') then
        s_axis_tready <= '0';
        tready        <= '0';
      elsif ((lrclkp and s_axis_tlast) = lrclkd) then
        s_axis_tready <= '1';
        tready        <= '1';
      end if;
    end if;
  end process;

  data_left_process : process (s_axis_aclk) is
  begin
    if rising_edge(s_axis_aclk) then
      if ((tready and s_axis_tvalid and not(s_axis_tlast)) = '1') then
        data_left <= s_axis_tdata;
      end if;
    end if;
  end process;

  data_right_process : process (s_axis_aclk) is
  begin
    if rising_edge(s_axis_aclk) then
      if ((tready and s_axis_tvalid and s_axis_tlast) = '1') then
        data_right <= s_axis_tdata;
      end if;
    end if;
  end process;

end Behavioral;