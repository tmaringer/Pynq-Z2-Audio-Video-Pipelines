library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity AXI_FirFSM_tb is
end;

architecture bench of AXI_Fir_tb is

  component AXI_Fir
  Generic (
    taps  : INTEGER := 3;
    norder : INTEGER := 3;
    data_width  : INTEGER := 24;
    coef_width : INTEGER := 32
  );
  Port ( 
      clk : in std_logic;
      rst : in std_logic;
      enable : in std_logic;
      led_enable : out std_logic;
      s_axis_tdata : in std_logic_vector(data_width-1 downto 0);
      s_axis_tvalid : in std_logic;
      s_axis_tlast : in std_logic;
      s_axis_tready : out std_logic;
      m_axis_tdata : out std_logic_vector(data_width-1 downto 0);
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
  signal enable: std_logic;
  signal led_enable: std_logic;
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
  uut: AXI_Fir generic map ( taps              => 3,
                                norder            => 3,
                                data_width        => 24,
                                coef_width        =>  32)
                     port map ( clk               => clk,
                                rst               => rst,
                                enable            => enable,
                                led_enable        => led_enable,
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
  
    rst <= '0';
    wait for 10 ns;
    rst <= '1';
    wait for 100 ns;
    enable <= '0';
    wait for 1 ms;
    enable <= '1';
    wait for 100 ns;
    s_apb_gp0_pwdata <= x"00000000";
    wait for 1 us;
    s_apb_gp0_paddr <= x"43C20010";
    s_apb_gp0_psel <= '1';
    s_apb_gp0_penable <= '0';
    s_apb_gp0_pwrite <= '1';
    s_apb_gp0_pwdata <= x"00000003";
    wait for 20 ns;
    s_apb_gp0_penable <= '1';
    wait for 20 ns;
    s_apb_gp0_pwdata <= x"00000000";
    s_apb_gp0_penable <= '0';
    s_apb_gp0_psel <= '0';
    wait for 1 us;
    
    s_apb_gp0_paddr <= x"43C20010";
    s_apb_gp0_psel <= '1';
    s_apb_gp0_penable <= '0';
    s_apb_gp0_pwrite <= '1';
    s_apb_gp0_pwdata <= x"10000000";
    wait for 20 ns;
    s_apb_gp0_penable <= '1';
    wait for 20 ns;
    s_apb_gp0_pwdata <= x"00000000";
    s_apb_gp0_penable <= '0';
    s_apb_gp0_psel <= '0';
    wait for 1 us;
    
    s_apb_gp0_paddr <= x"43C20010";
    s_apb_gp0_psel <= '1';
    s_apb_gp0_penable <= '0';
    s_apb_gp0_pwrite <= '1';
    s_apb_gp0_pwdata <= x"20000000";
    wait for 20 ns;
    s_apb_gp0_penable <= '1';
    wait for 20 ns;
    s_apb_gp0_pwdata <= x"00000000";
    s_apb_gp0_penable <= '0';
    s_apb_gp0_psel <= '0';
    wait for 1 us;
    
    s_apb_gp0_paddr <= x"43C20010";
    s_apb_gp0_psel <= '1';
    s_apb_gp0_penable <= '0';
    s_apb_gp0_pwrite <= '1';
    s_apb_gp0_pwdata <= x"10000000";
    wait for 20 ns;
    s_apb_gp0_penable <= '1';
    wait for 20 ns;
    s_apb_gp0_pwdata <= x"00000000";
    s_apb_gp0_penable <= '0';
    s_apb_gp0_psel <= '0';
    wait for 1 us;
    
    -- Put test bench stimulus code here
    m_axis_tready <= '1';
    s_axis_tvalid <= '0';
    s_axis_tlast <= '1';
    s_axis_tdata <= "101010000000000000000000";
    wait for  10010 ns;
    s_axis_tvalid <= '1';
    wait for 20 ns;
    s_axis_tvalid <= '0';
    s_axis_tlast <= '0';
    s_axis_tdata <= "001011111000000000000000";
    wait for  10010 ns;
    s_axis_tvalid <= '1';
    wait for 20 ns;
    s_axis_tvalid <= '0';
    s_axis_tlast <= '1';
    s_axis_tdata <= "101011111000000000000000";
    
    wait for  10010 ns;
    s_axis_tvalid <= '1';
    wait for 20 ns;
    s_axis_tvalid <= '0';
    s_axis_tlast <= '0';
    s_axis_tdata <= "001011111000000010000000";
    wait for  10010 ns;
    s_axis_tvalid <= '1';
    wait for 20 ns;
    s_axis_tvalid <= '0';
    s_axis_tlast <= '1';
    s_axis_tdata <= "001011111001000000000000";
    wait for  10010 ns;
    s_axis_tvalid <= '1';
    wait for 20 ns;
    s_axis_tvalid <= '0';
    s_axis_tlast <= '0';
    s_axis_tdata <= "001011111000100010000000";
    wait for  10010 ns;
    s_axis_tvalid <= '1';
    wait for 20 ns;
    s_axis_tvalid <= '0';
    s_axis_tlast <= '1';
    s_axis_tdata <= "101011111000100010000000";
    wait for  10010 ns;
    s_axis_tvalid <= '1';
    wait for 20 ns;
    s_axis_tvalid <= '0';
    wait for 2 ms;

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