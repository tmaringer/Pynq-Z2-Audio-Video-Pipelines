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

entity Buffers is
  port (
    in1  : in std_logic; --! input 1
    in2  : in std_logic; --! input 2
    in3  : in std_logic; --! input 3
    in4  : in std_logic; --! input 4
    out1 : out std_logic; --! output 1
    out2 : out std_logic; --! output 2
    out3 : out std_logic; --! output 3
    out4 : out std_logic; --! output 4
    out5 : out std_logic --! output 5
  );
end Buffers;

architecture Behavioral of Buffers is

begin

  out1 <= in1; -- input 1 -> output 1
  out2 <= in2; -- input 2 -> output 2
  out3 <= in3; -- input 3 -> output 3
  out4 <= in4; -- input 4 -> output 4
  out5 <= in4; -- input 4 -> output 5

end Behavioral;