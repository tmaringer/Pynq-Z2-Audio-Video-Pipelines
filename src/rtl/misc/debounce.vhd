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

entity Debounce is
  generic (
    clk_freq    : integer := 50000000; --! system clock frequency in Hz
    stable_time : integer := 10); --time! button must remain stable in ms
  port (
    clk     : in std_logic; --! input clock
    rst     : in std_logic; --! asynchronous active low reset
    button1 : in std_logic; --! input signal to be debounced
    button2 : in std_logic; --! input signal to be debounced
    button3 : in std_logic; --! input signal to be debounced
    button4 : in std_logic; --! input signal to be debounced
    result1 : out std_logic; --! debounced signal
    result2 : out std_logic; --! debounced signal
    result3 : out std_logic; --! debounced signal
    result4 : out std_logic --! debounced signal
  );
end Debounce;

architecture rtl of Debounce is
  signal flipflops1   : std_logic_vector(1 downto 0); --! input flip flops
  signal flipflops2   : std_logic_vector(1 downto 0); --! input flip flops
  signal flipflops3   : std_logic_vector(1 downto 0); --! input flip flops
  signal flipflops4   : std_logic_vector(1 downto 0); --! input flip flops
  signal counter_set1 : std_logic; --! sync reset to zero
  signal counter_set2 : std_logic; --! sync reset to zero
  signal counter_set3 : std_logic; --! sync reset to zero
  signal counter_set4 : std_logic; --! sync reset to zero
begin

  counter_set1 <= flipflops1(0) xor flipflops1(1); -- determine when to start/reset counter
  counter_set2 <= flipflops2(0) xor flipflops2(1); -- determine when to start/reset counter
  counter_set3 <= flipflops3(0) xor flipflops3(1); -- determine when to start/reset counter
  counter_set4 <= flipflops4(0) xor flipflops4(1); -- determine when to start/reset counter
  count1 : process (clk, rst)
    variable count1 : integer range 0 to clk_freq * stable_time/1000; -- counter for timing
  begin
    if (rst = '0') then -- reset
      flipflops1(1 downto 0) <= "00"; -- clear input flipflops
      result1                <= '0'; -- clear result register
    elsif (clk'EVENT and clk = '1') then -- rising clock edge
      flipflops1(0) <= button1; -- store button value in 1st flipflop
      flipflops1(1) <= flipflops1(0); -- store 1st flipflop value in 2nd flipflop
      if (counter_set1 = '1') then -- reset counter because input is changing
        count1 := 0; -- clear the counter
      elsif (count1 < clk_freq * stable_time/1000) then -- stable input time is not yet met
        count1 := count1 + 1; -- increment counter
      else -- stable input time is met
        result1 <= flipflops1(1); -- output the stable value
      end if;
    end if;
  end process;

  count2 : process (clk, rst)
    variable count2 : integer range 0 to clk_freq * stable_time/1000; -- counter for timing
  begin
    if (rst = '0') then -- reset
      flipflops2(1 downto 0) <= "00"; -- clear input flipflops
      result2                <= '0'; -- clear result register
    elsif (clk'EVENT and clk = '1') then -- rising clock edge
      flipflops2(0) <= button2; -- store button value in 1st flipflop
      flipflops2(1) <= flipflops2(0); -- store 1st flipflop value in 2nd flipflop
      if (counter_set2 = '1') then -- reset counter because input is changing
        count2 := 0; -- clear the counter
      elsif (count2 < clk_freq * stable_time/1000) then -- stable input time is not yet met
        count2 := count2 + 1; -- increment counter
      else -- stable input time is met
        result2 <= flipflops2(1); -- output the stable value
      end if;
    end if;
  end process;

  count3 : process (clk, rst)
    variable count3 : integer range 0 to clk_freq * stable_time/1000; -- counter for timing
  begin
    if (rst = '0') then -- reset
      flipflops3(1 downto 0) <= "00"; -- clear input flipflops
      result3                <= '0'; -- clear result register
    elsif (clk'EVENT and clk = '1') then -- rising clock edge
      flipflops3(0) <= button3; -- store button value in 1st flipflop
      flipflops3(1) <= flipflops3(0); -- store 1st flipflop value in 2nd flipflop
      if (counter_set3 = '1') then -- reset counter because input is changing
        count3 := 0; -- clear the counter
      elsif (count3 < clk_freq * stable_time/1000) then -- stable input time is not yet met
        count3 := count3 + 1; -- increment counter
      else -- stable input time is met
        result3 <= flipflops3(1); -- output the stable value
      end if;
    end if;
  end process;

  count4 : process (clk, rst)
    variable count4 : integer range 0 to clk_freq * stable_time/1000; -- counter for timing
  begin
    if (rst = '0') then -- reset
      flipflops4(1 downto 0) <= "00"; -- clear input flipflops
      result4                <= '0'; -- clear result register
    elsif (clk'EVENT and clk = '1') then -- rising clock edge
      flipflops4(0) <= button4; -- store button value in 1st flipflop
      flipflops4(1) <= flipflops4(0); -- store 1st flipflop value in 2nd flipflop
      if (counter_set4 = '1') then -- reset counter because input is changing
        count4 := 0; -- clear the counter
      elsif (count4 < clk_freq * stable_time/1000) then -- stable input time is not yet met
        count4 := count4 + 1; -- increment counter
      else -- stable input time is met
        result4 <= flipflops4(1); -- output the stable value
      end if;
    end if;
  end process;
end rtl;