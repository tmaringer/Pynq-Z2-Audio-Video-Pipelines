library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity I2S_Receiver_tb is
end;

architecture bench of I2S_Receiver_tb is

  component I2S_Receiver
    generic (
      DATA_WIDTH : integer := 24
    );
    port (
      bclk  : in std_logic;
      lrclk : in std_logic;
      sdata : in std_logic;
      m_axis_aclk    : in std_logic;
      m_axis_aresetn : in std_logic;
      m_axis_tvalid  : out std_logic;
      m_axis_tdata   : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      m_axis_tlast   : out std_logic;
      m_axis_tready  : in std_logic
    );
  end component;

  signal bclk: std_logic;
  signal lrclk: std_logic;
  signal sdata: std_logic;
  signal m_axis_aclk: std_logic;
  signal m_axis_aresetn: std_logic;
  signal m_axis_tvalid: std_logic;
  signal m_axis_tdata: std_logic_vector(23 downto 0);
  signal m_axis_tlast: std_logic;
  signal m_axis_tready: std_logic ;

  constant clock_period: time := 20 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: I2S_Receiver generic map ( DATA_WIDTH     =>  24)
                       port map ( bclk           => bclk,
                                  lrclk          => lrclk,
                                  sdata          => sdata,
                                  m_axis_aclk    => m_axis_aclk,
                                  m_axis_aresetn => m_axis_aresetn,
                                  m_axis_tvalid  => m_axis_tvalid,
                                  m_axis_tdata   => m_axis_tdata,
                                  m_axis_tlast   => m_axis_tlast,
                                  m_axis_tready  => m_axis_tready );

  stimulus: process
  begin
  
    -- Put initialisation code here
    
    m_axis_aresetn <= '1';
    m_axis_tready <= '1';
    lrclk <= '1';
    bclk <= '0';
    sdata <= '0';
    wait for 100 ns;
    lrclk <= '0';
    wait for 167 ns;
    bclk <= '1'; -- 1
    wait for 167 ns;
    bclk <= '0'; -- 2
    wait for 167 ns;
    bclk <= '1'; -- 3
    wait for 167 ns;
    bclk <= '0'; -- 4
    wait for 167 ns;
    bclk <= '1'; -- 5 
    wait for 125 ns;
    bclk <= '0'; -- 6
    wait for 167 ns;
    bclk <= '1'; -- 7
    wait for 167 ns;
    bclk <= '0'; -- 8
    wait for 167 ns;
    bclk <= '1'; -- 9
    wait for 167 ns;
    bclk <= '0'; -- 10
    wait for 167 ns;
    bclk <= '1'; -- 11
    wait for 167 ns;
    bclk <= '0'; -- 12
    wait for 167 ns;
    bclk <= '1'; -- 13
    wait for 167 ns;
    bclk <= '0'; -- 14
    wait for 167 ns;
    bclk <= '1'; -- 15
    wait for 125 ns;
    bclk <= '0'; -- 16
    wait for 167 ns;
    bclk <= '1'; -- 17
    wait for 167 ns;
    bclk <= '0'; -- 18
    wait for 42 ns;
    sdata <= '1';
    wait for 125 ns;
    bclk <= '1'; -- 19
    wait for 167 ns;
    bclk <= '0'; -- 20
    wait for 167 ns;
    bclk <= '1'; -- 21
    wait for 167 ns;
    bclk <= '0'; -- 22
    wait for 167 ns;
    bclk <= '1'; -- 23
    wait for 167 ns;
    bclk <= '0'; -- 24
    wait for 167 ns;
    bclk <= '1'; -- 25
    wait for 167 ns;
    bclk <= '0'; -- 26
    wait for 167 ns;
    bclk <= '1'; -- 27
    wait for 167 ns;
    bclk <= '0'; -- 28
    wait for 167 ns;
    bclk <= '1'; -- 29
    wait for 167 ns;
    bclk <= '0'; -- 30
    wait for 167 ns;
    bclk <= '1'; -- 31
    wait for 167 ns;
    bclk <= '0'; -- 32
    wait for 167 ns;
    bclk <= '1'; -- 33
    wait for 167 ns;
    bclk <= '0'; -- 34
    sdata <= '0';
    wait for 167 ns;
    bclk <= '1'; -- 35
    wait for 167 ns;
    bclk <= '0'; -- 36
    wait for 167 ns;
    bclk <= '1'; -- 37
    wait for 125 ns;
    bclk <= '0'; -- 38
    wait for 167 ns;
    bclk <= '1'; -- 39
    wait for 167 ns;
    bclk <= '0'; -- 40
    wait for 167 ns;
    bclk <= '1'; -- 41
    wait for 167 ns;
    bclk <= '0'; -- 42
    wait for 167 ns;
    bclk <= '1'; -- 43
    wait for 167 ns;
    bclk <= '0'; -- 44
    wait for 167 ns;
    bclk <= '1'; -- 45
    wait for 167 ns;
    bclk <= '0'; -- 46
    sdata <= '1';
    wait for 167 ns;
    bclk <= '1'; -- 47
    wait for 167 ns;
    bclk <= '0'; -- 48
    sdata <= '0';
    wait for 2583 ns;
    lrclk <= '1';
    wait for 167 ns;
    bclk <= '0';
    wait for 167 ns;
    bclk <= '1';
    wait for 167 ns;
    bclk <= '0';
    wait for 167 ns;
    bclk <= '1';
    wait for 167 ns;
    bclk <= '0';
    wait for 167 ns;
    
    
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      m_axis_aclk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;