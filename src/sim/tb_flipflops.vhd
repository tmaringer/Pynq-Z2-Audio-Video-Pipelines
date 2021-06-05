-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Activation_tb is
end;

architecture bench of FlipFlops_tb is

  component FlipFlops
  Port ( 
      aclk : in std_logic;
      aresetn : in std_logic;
      IN1 : in std_logic;
      OUT1 : out std_logic
  );
  end component;

  signal aclk: std_logic;
  signal aresetn: std_logic;
  signal IN1: std_logic;
  signal OUT1: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: FlipFlops port map ( aclk    => aclk,
                             aresetn => aresetn,
                             IN1     => IN1,
                             OUT1    => OUT1 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    aresetn <= '0';
    wait for 10ns;
    aresetn <= '1';
    IN1 <= '0';
    wait for 10us;
    IN1 <= '1';
    wait for 10us;
    IN1 <= '0';
    wait for 10us;
    IN1 <= '1';
    wait for 10us;
    IN1 <= '0';
    wait for 10us;
    IN1 <= '1';
    wait for 10us;
    IN1 <= '0';
    wait for 10us;
    IN1 <= '1';
    wait for 10us;
    IN1 <= '0';
    wait for 10us;
    IN1 <= '1';
    wait for 10us;
    IN1 <= '0';
    wait for 10us;
    IN1 <= '1';
    wait for 10us;

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      aclk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;