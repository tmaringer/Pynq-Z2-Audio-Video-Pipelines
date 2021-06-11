library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity pattern_generator_tb is
end;

architecture bench of pattern_generator_tb is

  component pattern_generator
      generic (        
          constant frame_width : integer := 1280;
          constant frame_height : integer := 720;
          constant audio_size : integer := 600
      );
      port(
          clk          : in  std_logic;
          video_in     : in  std_logic_vector(23 downto 0);
          video_active_in, hsync_in, vsync_in : in std_logic;
          video_active_out, hsync_out, vsync_out : out std_logic;
          rgb          : out std_logic_vector(23 downto 0);
          soundinput   : in std_logic_vector(23 downto 0);
          sw           : in std_logic_vector(3 downto 0)
      );
  end component;

  signal clk: std_logic;
  signal video_in: std_logic_vector(23 downto 0);
  signal video_active_in, hsync_in, vsync_in: std_logic;
  signal video_active_out, hsync_out, vsync_out: std_logic;
  signal rgb: std_logic_vector(23 downto 0);
  signal soundinput: std_logic_vector(23 downto 0);
  signal sw: std_logic_vector(3 downto 0) ;

  constant clock_period: time := 6.734 ns;
  signal stop_the_clock: boolean;
  signal counter : integer := 1;
  file file_RESULTS : text;

begin

  -- Insert values for generic parameters !!
  uut: pattern_generator generic map ( frame_width      => 1280,
                                       frame_height     =>  720,
                                       audio_size       =>  600)
                            port map ( clk              => clk,
                                       video_in         => video_in,
                                       video_active_in  => video_active_in,
                                       hsync_in         => hsync_in,
                                       vsync_in         => vsync_in,
                                       video_active_out => video_active_out,
                                       hsync_out        => hsync_out,
                                       vsync_out        => vsync_out,
                                       rgb              => rgb,
                                       soundinput       => soundinput,
                                       sw               => sw );

  stimulus: process
    variable v_OLINE     : line;
  begin
  
    -- Put initialisation code here
    file_open(file_RESULTS, "output_results.txt", write_mode);
    video_active_in <= '1';
    wait for clock_period/2;
    video_active_in <= '0';
    wait for clock_period/2;
    video_in <= x"FF0000";
    -- Put test bench stimulus code here
    wait for clock_period;
    for k in 0 to 1 loop
        for i in 0 to (750-1) loop
            for j in 0 to (1650-1) loop 
                if i < 20 then
                    video_active_in <= '0';
                    vsync_in <= '0';
                elsif i < 740 then
                    video_active_in <= '1';
                    vsync_in <= '0';
                elsif i < 745 then
                    video_active_in <= '0';
                    vsync_in <= '0';
                else
                    video_active_in <= '0';
                    vsync_in <= '1';
                end if;
                if j < 220 then
                    video_active_in <= '0';
                    hsync_in <= '0';
                elsif j < 1500 then
                    video_active_in <= '1';
                    hsync_in <= '0';
                elsif j < 1610 then
                    video_active_in <= '0';
                    hsync_in <= '0';
                else
                    video_active_in <= '0';
                    hsync_in <= '1';
                end if;
                wait for clock_period;
                write(v_OLINE, i, right, 10);
                write(v_OLINE, j, right, 10);
                write(v_OLINE, rgb, right, 30);
                writeline(file_RESULTS, v_OLINE);
            end loop;
        end loop;
    end loop;
    file_close(file_RESULTS);
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