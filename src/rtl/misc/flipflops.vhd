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

entity FlipFlops is
  port (
    clk    : in std_logic; --! clock 
    rst : in std_logic; --! active-low reset

    in1           : in std_logic; --! input 1
    out1          : out std_logic; --! output 1
    in2           : in std_logic; --! input 2
    out2          : out std_logic; --! output 2
    in3           : in std_logic; --! input 3
    out3          : out std_logic; --! output 3
    in4           : in std_logic; --! input 4
    out4          : out std_logic; --! output 4
    -- APB
    s_apb_paddr   : in std_logic_vector(31 downto 0); --! apb address
    s_apb_psel    : in std_logic; --! apb select
    s_apb_penable : in std_logic; --! apb enable
    s_apb_pwrite  : in std_logic; --! apb write or read
    s_apb_pwdata  : in std_logic_vector(31 downto 0); --! apb write data
    s_apb_pready  : out std_logic; --! apb ready to communicate
    s_apb_prdata  : out std_logic_vector(31 downto 0); --! apb read data
    s_apb_pslverr : out std_logic --! communication locked
  );
  attribute X_INTERFACE_INFO : string;
end FlipFlops;

architecture Behavioral of FlipFlops is

  attribute X_INTERFACE_INFO of s_apb_paddr   : signal is "xilinx.com:interface:apb:1.0 s_apb PADDR";
  attribute X_INTERFACE_INFO of s_apb_psel    : signal is "xilinx.com:interface:apb:1.0 s_apb PSEL";
  attribute X_INTERFACE_INFO of s_apb_penable : signal is "xilinx.com:interface:apb:1.0 s_apb PENABLE";
  attribute X_INTERFACE_INFO of s_apb_pwrite  : signal is "xilinx.com:interface:apb:1.0 s_apb PWRITE";
  attribute X_INTERFACE_INFO of s_apb_pwdata  : signal is "xilinx.com:interface:apb:1.0 s_apb PWDATA";
  attribute X_INTERFACE_INFO of s_apb_pready  : signal is "xilinx.com:interface:apb:1.0 s_apb PREADY";
  attribute X_INTERFACE_INFO of s_apb_prdata  : signal is "xilinx.com:interface:apb:1.0 s_apb PRDATA";
  attribute X_INTERFACE_INFO of s_apb_pslverr : signal is "xilinx.com:interface:apb:1.0 s_apb PSLVERR";

  signal prev1  : std_logic                    := '0'; --! store value of input 1
  signal outp1  : std_logic                    := '0'; --! output 1
  signal prev2  : std_logic                    := '0'; --! store value of input 2
  signal outp2  : std_logic                    := '0'; --! output 2
  signal prev3  : std_logic                    := '0'; --! store value of input 3
  signal outp3  : std_logic                    := '0'; --! output 3
  signal prev4  : std_logic                    := '0'; --! store value of input 4
  signal outp4  : std_logic                    := '0'; --! output 4
  signal status : std_logic_vector(4 downto 0) := "00000"; --! activation
begin

  out_1 : process (clk) is
  begin
    if rising_edge(clk) then
      if (rst = '0') then
        outp1 <= '0';
        prev1 <= '0';
      elsif (status(4) = '0') then
        if (prev1 = '0') and (in1 = '1') then
          outp1 <= not(outp1);
          out1  <= outp1;
        end if;
        prev1 <= in1;
      elsif (status(4) = '1') then
        out1 <= status(0);
      end if;
    end if;
  end process;

  out_2 : process (clk) is
  begin
    if rising_edge(clk) then
      if (rst = '0') then
        outp2 <= '0';
        prev2 <= '0';
      elsif (status(4) = '0') then
        if (prev2 = '0') and (in2 = '1') then
          outp2 <= not(outp2);
          out2  <= outp2;
        end if;
        prev2 <= in2;
      elsif (status(4) = '1') then
        out2 <= status(1);
      end if;
    end if;
  end process;

  out_3 : process (clk) is
  begin
    if rising_edge(clk) then
      if (rst = '0') then
        outp3 <= '0';
        prev3 <= '0';
      elsif (status(4) = '0') then
        if (prev3 = '0') and (in3 = '1') then
          outp3 <= not(outp3);
          out3  <= outp3;
        end if;
        prev3 <= in3;
      elsif (status(4) = '1') then
        out3 <= status(2);
      end if;
    end if;
  end process;

  out_4 : process (clk) is
  begin
    if rising_edge(clk) then
      if (rst = '0') then
        outp4 <= '0';
        prev4 <= '0';
      elsif (status(4) = '0') then
        if (prev4 = '0') and (in4 = '1') then
          outp4 <= not(outp4);
          out4  <= outp4;
        end if;
        prev4 <= in4;
      elsif (status(4) = '1') then
        out4 <= status(3);
      end if;
    end if;
  end process;

  apb_activation : process (clk) is
  begin
    if rising_edge(clk) then
      if (s_apb_pwrite = '1') and (s_apb_psel = '1') and (s_apb_penable = '1') then
        status <= s_apb_pwdata(4 downto 0);
      end if;
    end if;
  end process;
  s_apb_pready             <= '1';
  s_apb_prdata(4 downto 0) <= status;
  s_apb_pslverr            <= '0';

end Behavioral;