library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity AXI_EchoFSM_tb is
end;

architecture bench of AXI_Echo_tb is

  component AXI_Echo
  generic (
      DATA_WIDTH : integer := 24;
      RAM_LENGTH : integer := 96000;
      DELAY : integer := 96000;
      GAIN : integer := 512
  );
  Port ( 
      clk             : in  std_logic;
      rst      : in  std_logic;
      led_enable : out std_logic;
      enable : in std_logic;
      switch : in std_logic;
      led_g1 : out std_logic;
      led_g2 : out std_logic;
      s_axis_tdata : in std_logic_vector(DATA_WIDTH-1 downto 0);
      s_axis_tvalid : in std_logic;
      s_axis_tlast : in std_logic;
      s_axis_tready : out std_logic;
      m_axis_tdata : out std_logic_vector(DATA_WIDTH-1 downto 0);
      m_axis_tvalid : out std_logic;
      m_axis_tlast : out std_logic;
      m_axis_tready : in std_logic;
      s_apb_gp0_paddr :in  std_logic_vector(31 downto 0);   
      s_apb_gp0_psel :in  std_logic;                       
      s_apb_gp0_penable :in  std_logic;                       
      s_apb_gp0_pwrite :in  std_logic;                       
      s_apb_gp0_pwdata :in  std_logic_vector(31 downto 0);   
      s_apb_gp0_pready :out std_logic;                       
      s_apb_gp0_prdata :out std_logic_vector(31 downto 0);   
      s_apb_gp0_pslverr :out std_logic
  );
  end component;

  signal clk: std_logic;
  signal rst: std_logic;
  signal led_enable: std_logic;
  signal enable: std_logic;
  signal switch: std_logic;
  signal led_g1: std_logic;
  signal led_g2: std_logic;
  signal s_axis_tdata: std_logic_vector(23 downto 0);
  signal s_axis_tvalid: std_logic;
  signal s_axis_tlast: std_logic;
  signal s_axis_tready: std_logic;
  signal m_axis_tdata: std_logic_vector(23 downto 0);
  signal m_axis_tvalid: std_logic;
  signal m_axis_tlast: std_logic;
  signal m_axis_tready: std_logic;
  signal s_apb_gp0_paddr: std_logic_vector(31 downto 0);
  signal s_apb_gp0_psel: std_logic;
  signal s_apb_gp0_penable: std_logic;
  signal s_apb_gp0_pwrite: std_logic;
  signal s_apb_gp0_pwdata: std_logic_vector(31 downto 0);
  signal s_apb_gp0_pready: std_logic;
  signal s_apb_gp0_prdata: std_logic_vector(31 downto 0);
  signal s_apb_gp0_pslverr: std_logic ;

  constant clock_period: time := 20 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: AXI_Echo generic map ( DATA_WIDTH        => 24,
                                 RAM_LENGTH        => 1000,
                                 DELAY             => 1000,
                                 GAIN              =>  512)
                      port map ( clk               => clk,
                                 rst               => rst,
                                 led_enable        => led_enable,
                                 enable            => enable,
                                 switch            => switch,
                                 led_g1            => led_g1,
                                 led_g2            => led_g2,
                                 s_axis_tdata      => s_axis_tdata,
                                 s_axis_tvalid     => s_axis_tvalid,
                                 s_axis_tlast      => s_axis_tlast,
                                 s_axis_tready     => s_axis_tready,
                                 m_axis_tdata      => m_axis_tdata,
                                 m_axis_tvalid     => m_axis_tvalid,
                                 m_axis_tlast      => m_axis_tlast,
                                 m_axis_tready     => m_axis_tready,
                                 s_apb_gp0_paddr   => s_apb_gp0_paddr,
                                 s_apb_gp0_psel    => s_apb_gp0_psel,
                                 s_apb_gp0_penable => s_apb_gp0_penable,
                                 s_apb_gp0_pwrite  => s_apb_gp0_pwrite,
                                 s_apb_gp0_pwdata  => s_apb_gp0_pwdata,
                                 s_apb_gp0_pready  => s_apb_gp0_pready,
                                 s_apb_gp0_prdata  => s_apb_gp0_prdata,
                                 s_apb_gp0_pslverr => s_apb_gp0_pslverr );

  stimulus: process
  begin
  
    -- Put initialisation code here

    rst <= '0';
    wait for 10 ns;
    rst <= '1';
    wait for 10 ns;

    enable <= '0';
    wait for 40 ns;
    enable <= '1';
    switch <= '0';
    wait for 50 ns;
    switch <= '1';
    wait for 2000 ms;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;