library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity cdc is
Port ( 
    src_clk : in std_logic;
    bus_in : in std_logic_vector(23 downto 0);
    dst_clk : in std_logic;
    bus_out : out std_logic_vector(23 downto 0)
);
end cdc;

architecture rtl of cdc is
    signal event_toggle : std_logic := '0';
    signal signal_meta : std_logic_vector(23 downto 0) := (others => '0');
    attribute ASYNC_REG : string;
    attribute ASYNC_REG of signal_meta : signal is "TRUE";
    signal data1 : std_logic_vector(23 downto 0) := (others => '0');
    signal data2 : std_logic_vector(23 downto 0) := (others => '0');
begin
    process(src_clk) is
    begin
        if rising_edge(src_clk) then
            signal_meta <= bus_in;
        end if;
    end process;
    
    process(dst_clk) is
    begin
        if rising_edge(dst_clk) then
            data1 <= signal_meta;
            data2 <= data1;
            bus_out <= data2;
        end if;
    end process;
end rtl;
