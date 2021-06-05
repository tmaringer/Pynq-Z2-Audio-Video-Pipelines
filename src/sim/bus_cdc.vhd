library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity cdc_tb is
end;

architecture bench of cdc_tb is

  component cdc
  Port ( 
      src_clk : in std_logic;
      bus_in : in std_logic_vector(23 downto 0);
      dst_clk : in std_logic;
      bus_out : out std_logic_vector(23 downto 0);
      valid_out : out std_logic
  );
  end component;

  signal src_clk: std_logic;
  signal bus_in: std_logic_vector(23 downto 0);
  signal dst_clk: std_logic;
  signal bus_out: std_logic_vector(23 downto 0);
  signal valid_out: std_logic ;

  constant clock_period: time := 10 ns;
  constant clock_period1: time := 5 ns;
  signal stop_the_clock: boolean;

begin

  uut: cdc port map ( src_clk   => src_clk,
                      bus_in    => bus_in,
                      dst_clk   => dst_clk,
                      bus_out   => bus_out,
                      valid_out => valid_out );

  stimulus: process
  begin
    bus_in <= "000000000000000000000000";
    wait for 100 ns;
    bus_in <= "000000000000000000000100";
    wait for 100 ns;
    bus_in <= "000000000000000000000010";
    wait for 100 ns;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      src_clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;
  
  clocking1: process
  begin
    while not stop_the_clock loop
      dst_clk <= '0', '1' after clock_period1 / 2;
      wait for clock_period1;
    end loop;
    wait;
  end process;

end;