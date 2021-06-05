-- author: Furkan Cayci, 2018
-- description: video pattern generator based on the active areas
--   displays color spectrum

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pattern_generator is
    generic (        
        constant Hoffset : integer := 50;
        constant Voffset : integer := 500;
        constant pixelsize : integer := 2;
        constant frame_width : integer := 1279;
        constant frame_height : integer := 719
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
end pattern_generator;

architecture rtl of pattern_generator is
    type state_type is (s0, s1);
    signal Hcounter : integer := 0;
    signal Hcounter1 : integer := 0;
    signal Hcounter2 : integer := 0;
    signal Vcounter : integer := 0;
    signal Vcounter1 : integer := 0;
    signal Vcounter2 : integer := 0;
    signal Vcounter3 : integer := 0;
    signal Vcounter4 : integer := 0;
    signal Vcounter5 : integer := 0;
    signal Vcounter6 : integer := 0;
    signal Vcounter7 : integer := 0;
    signal Vcounter8 : integer := 0;
    signal Vcounter9 : integer := 0;
    signal Vcounter10 : integer := 0;
    constant Hside : integer := 7;
    constant row : integer := 4;
    constant space : integer := 3;
    constant Vside : integer := (space+Hside)*row-space;
    constant size : integer := 5;
    signal audio : integer := 0;
    signal r : unsigned(7 downto 0) := x"E0";
    signal b : unsigned(7 downto 0) := x"E0";
    signal g : unsigned(7 downto 0) := x"E0";
    
    type title_type is array (0 to Vside-1) of std_logic_vector(0 to (size*Hside)-1);
    type value_type is array (0 to Hside-1) of std_logic_vector(0 to (3*Hside)-1);

    constant title_ROM: title_type := (
        "01110000111000111110010001000000000", --  ***    ***   *****  *   *        
        "10001001000100001000010001000010000", -- *   *  *   *    *    *   *    *
        "10000001000100001000010001000000000", -- *      *   *    *    *   *   
        "01110001000100001000010001000000000", --  ***   *   *    *    *   *
        "00001001111100001000010001000000000", --     *  *****    *    *   *
        "10001001000100001000010001000010000", -- *   *  *   *    *    *   *    *
        "01110001000100001000001110000000000", --  ***   *   *    *     *** 
        "00000000000000000000000000000000000",
        "00000000000000000000000000000000000",
        "00000000000000000000000000000000000",
        "11110001111100011100011111000000000", -- ****   *****   ***   *****         
        "10001001000000100010000100000010000", -- *   *  *      *   *    *      *
        "10001001000000100000000100000000000", -- *   *  *      *        *
        "10001001111000100000000100000000000", -- *   *  ****   *        *
        "11110001000000100000000100000000000", -- ****   *      *        *
        "10001001000000100010000100000010000", -- *   *  *      *   *    *      *
        "10001001111100011100000100000000000", -- *   *  *****   ***     *
        "00000000000000000000000000000000000",
        "00000000000000000000000000000000000",
        "00000000000000000000000000000000000",
        "00000001111100011100011110000000000", --        *****   ***    *** 
        "00000001000000001000010001000010000", --        *        *    *   *    *
        "00000001000000001000010001000000000", --        *        *    *   *
        "00000001111000001000010001000000000", --        ****     *    *   *
        "00000001000000001000011110000000000", --        *        *    ****
        "00000001000000001000010001000010000", --        *        *    *   *    *
        "00000001000000011100010001000000000", --        *       ***   *   *
        "00000000000000000000000000000000000",
        "00000000000000000000000000000000000",
        "00000000000000000000000000000000000",
        "11111000111000100010001110000000000", -- *****   ***   *   *   ***
        "10000001000100100010010001000010000", -- *      *   *  *   *  *   *    *     
        "10000001000000100010010001000000000", -- *      *      *   *  *   *
        "11110001000000111110010001000000000", -- ****   *      *****  *   *
        "10000001000000100010010001000000000", -- *      *      *   *  *   *
        "10000001000100100010010001000010000", -- *      *   *  *   *  *   *    *
        "11111000111000100010001110000000000"  -- *****   ***   *   *   ***
    );
    
    constant off_ROM: value_type := (
        "011100011111001111100", --  ***   *****  *****
        "100010010000001000000", -- *   *  *      *     
        "100010010000001000000", -- *   *  *      *   
        "100010011110001111000", -- *   *  ****   ****
        "100010010000001000000", -- *   *  *      *
        "100010010000001000000", -- *   *  *      *
        "011100010000001000000"  --  ***   *      *
    );
    
    constant on_ROM: value_type := (
        "011100010001000000000", --  ***   *   *
        "100010010001000000000", -- *   *  *   *
        "100010011001000000000", -- *   *  **  *
        "100010010101000000000", -- *   *  * * *
        "100010010011000000000", -- *   *  *  **
        "100010010001000000000", -- *   *  *   *
        "011100010001000000000"  --  ***   *   *
    );
    
begin

    rgb <= std_logic_vector(r & g & b);
    video_active_out <= video_active_in;
    hsync_out <= hsync_in;
    vsync_out <= vsync_in;
    -- color spectrum process
    process(clk) is
    begin
        if rising_edge(clk) then
            if video_active_in = '1' then
                -- Bar
                if (Hcounter >= frame_width - Hoffset*2) and (Hcounter < frame_width - Hoffset) and (Vcounter >= 160) and (Vcounter < 560) then
                    if (Vcounter > 560 - audio) then
                        if (Vcounter < 176) then
                            r <= x"FF";
                            b <= x"00";
                            g <= x"00";
                        elsif (Vcounter < 304) then
                            r <= x"FF";
                            b <= to_unsigned((Vcounter-176)*2, 8);
                            g <= x"00";
                        elsif (Vcounter < 432) then
                            r <= to_unsigned((255 - (Vcounter-304)*2), 8);
                            b <= x"FF";
                            g <= x"00";
                        else
                            r <= x"00";
                            b <= x"FF";
                            g <= x"00";
                        end if;
                    else
                        r <= unsigned(video_in(23 downto 16));
                        g <= unsigned(video_in(15 downto 8));
                        b <= unsigned(video_in(7 downto 0));
                    end if;
                -- Title
                elsif (Hcounter >= Hoffset) and (Hcounter < (Hoffset + size*Hside*pixelsize)) and (Vcounter >= Voffset) and (Vcounter < (Voffset + Vside*pixelsize)) then
                    if title_ROM(Vcounter2)(Hcounter2) = '1' then
                        r <= x"E0";
                        g <= x"E0";
                        b <= x"E0";
                    else
                        r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                        g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                        b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                    end if;
                    if (Hcounter1 = (pixelsize-1)) and (Hcounter2 = (Hside*size-1)) then
                        if Vcounter1 = (pixelsize-1) then
                            Vcounter1 <= 0;
                            Vcounter2 <= Vcounter2 + 1;
                        else
                            Vcounter1 <= Vcounter1 + 1;
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) then
                        Hcounter1 <= 0;
                        Hcounter2 <= Hcounter2 + 1;
                    else
                        Hcounter1 <= Hcounter1 + 1;
                    end if;
                -- SW
                elsif (Hcounter >= (Hoffset + size*Hside*pixelsize) + Hside) and (Hcounter < ((Hoffset + size*Hside*pixelsize) + Hside*pixelsize*3 + Hside)) and (Vcounter >= Voffset) and (Vcounter < (Voffset + Hside*pixelsize)) then
                    if sw(0) = '1' then
                        if on_ROM(Vcounter4)(Hcounter2) = '1' then
                            r <= x"E0";
                            g <= x"E0";
                            b <= x"E0";
                        else
                            r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                            g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                            b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                        end if;
                    else
                        if off_ROM(Vcounter4)(Hcounter2) = '1' then
                            r <= x"E0";
                            g <= x"E0";
                            b <= x"E0";
                        else
                            r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                            g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                            b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) and (Hcounter2 = 20) then
                        if Vcounter3 = (pixelsize-1) then
                            Vcounter3 <= 0;
                            Vcounter4 <= Vcounter4 + 1;
                        else
                            Vcounter3 <= Vcounter3 + 1;
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) then
                        Hcounter1 <= 0;
                        Hcounter2 <= Hcounter2 + 1;
                    else
                        Hcounter1 <= Hcounter1 + 1;
                    end if;
                -- SW1    
                elsif (Hcounter >= (Hoffset + size*Hside*pixelsize) + Hside) and (Hcounter < ((Hoffset + size*Hside*pixelsize) + Hside*pixelsize*3 + Hside)) and (Vcounter >= Voffset + (Hside+3)*pixelsize*1) and (Vcounter < (Voffset + ((Hside+3)*pixelsize*1 + Hside*pixelsize))) then
                    if sw(1) = '1' then
                        if on_ROM(Vcounter6)(Hcounter2) = '1' then
                            r <= x"E0";
                            g <= x"E0";
                            b <= x"E0";
                        else
                            if shift_right((unsigned(video_in(23 downto 16)) + x"30"),1) > x"FF" then
                                r <= x"FF";
                            elsif shift_right((unsigned(video_in(23 downto 16)) + x"30"),1) < x"00" then
                                r <= x"00";
                            else
                                r <= shift_right((unsigned(video_in(23 downto 16)) + x"30"),1);
                            end if;
                            if shift_right((unsigned(video_in(15 downto 8)) + x"30"),1) > x"FF" then
                                g <= x"FF";
                            elsif shift_right((unsigned(video_in(15 downto 8)) + x"30"),1) < x"00" then
                                g <= x"00";
                            else
                                g <= shift_right((unsigned(video_in(15 downto 8)) + x"30"),1);
                            end if;
                            if shift_right((unsigned(video_in(7 downto 0)) + x"30"),1) > x"FF" then
                                b <= x"FF";
                            elsif shift_right((unsigned(video_in(7 downto 0)) + x"30"),1) < x"00" then
                                b <= x"00";
                            else
                                b <= shift_right((unsigned(video_in(7 downto 0)) + x"30"),1);
                            end if;
                        end if;
                    else
                        if off_ROM(Vcounter6)(Hcounter2) = '1' then
                            r <= x"E0";
                            g <= x"E0";
                            b <= x"E0";
                        else
                            r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                            g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                            b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) and (Hcounter2 = 20) then
                        if Vcounter5 = (pixelsize-1) then
                            Vcounter5 <= 0;
                            Vcounter6 <= Vcounter6 + 1;
                        else
                            Vcounter5 <= Vcounter5 + 1;
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) then
                        Hcounter1 <= 0;
                        Hcounter2 <= Hcounter2 + 1;
                    else
                        Hcounter1 <= Hcounter1 + 1;
                    end if;
                -- SW2
                elsif (Hcounter >= (Hoffset + size*Hside*pixelsize) + Hside) and (Hcounter < ((Hoffset + size*Hside*pixelsize) + Hside*pixelsize*3 + Hside)) and (Vcounter >= Voffset + (Hside+3)*pixelsize*2) and (Vcounter < (Voffset + ((Hside+3)*pixelsize*2 + Hside*pixelsize))) then
                    if sw(2) = '1' then
                        if on_ROM(Vcounter8)(Hcounter2) = '1' then
                            r <= x"E0";
                            g <= x"E0";
                            b <= x"E0";
                        else
                            r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                            g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                            b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                        end if;
                    else
                        if off_ROM(Vcounter8)(Hcounter2) = '1' then
                            r <= x"E0";
                            g <= x"E0";
                            b <= x"E0";
                        else
                            r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                            g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                            b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) and (Hcounter2 = 20) then
                        if Vcounter7 = (pixelsize-1) then
                            Vcounter7 <= 0;
                            Vcounter8 <= Vcounter8 + 1;
                        else
                            Vcounter7 <= Vcounter7 + 1;
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) then
                        Hcounter1 <= 0;
                        Hcounter2 <= Hcounter2 + 1;
                    else
                        Hcounter1 <= Hcounter1 + 1;
                    end if;
                -- SW3
                elsif (Hcounter >= (Hoffset + size*Hside*pixelsize) + Hside) and (Hcounter < ((Hoffset + size*Hside*pixelsize) + Hside*pixelsize*3 + Hside)) and (Vcounter >= Voffset + (Hside+3)*pixelsize*3) and (Vcounter < (Voffset + (Hside+3)*pixelsize*3 + Hside*pixelsize)) then
                    if sw(3) = '1' then
                        if on_ROM(Vcounter10)(Hcounter2) = '1' then
                            r <= x"E0";
                            g <= x"E0";
                            b <= x"E0";
                        else
                            r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                            g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                            b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                        end if;
                    else
                        if off_ROM(Vcounter10)(Hcounter2) = '1' then
                            r <= x"E0";
                            g <= x"E0";
                            b <= x"E0";
                        else
                            r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                            g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                            b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) and (Hcounter2 = 20) then
                        if Vcounter9 = (pixelsize-1) then
                            Vcounter9 <= 0;
                            Vcounter10 <= Vcounter10 + 1;
                        else
                            Vcounter9 <= Vcounter9 + 1;
                        end if;
                    end if;
                    if (Hcounter1 = (pixelsize-1)) then
                        Hcounter1 <= 0;
                        Hcounter2 <= Hcounter2 + 1;
                    else
                        Hcounter1 <= Hcounter1 + 1;
                    end if; 
                    
                else
                    Hcounter1 <= 0;
                    Hcounter2 <= 0;
                    if (Hcounter >= Hoffset - 5) and Hcounter < (((Hoffset + size*Hside*pixelsize) + Hside*pixelsize*3 + Hside) + 5) and Vcounter >= Voffset - 5 and (Vcounter < ((Voffset + Vside*pixelsize) + 5)) then
                        r <= (shift_right(unsigned(video_in(23 downto 16)),1) + shift_right(x"30",1));
                        g <= (shift_right(unsigned(video_in(15 downto 8)),1) + shift_right(x"30",1));
                        b <= (shift_right(unsigned(video_in(7 downto 0)),1) + shift_right(x"30",1));
                    else
                        r <= unsigned(video_in(23 downto 16));
                        g <= unsigned(video_in(15 downto 8));
                        b <= unsigned(video_in(7 downto 0));
                    end if;
                end if;
                if Hcounter = frame_width then
                    Hcounter <= 0;
                    if Vcounter = frame_height then
                        Vcounter <= 0;
                        Vcounter1 <= 0;
                        Vcounter2 <= 0;
                        Vcounter3 <= 0;
                        Vcounter4 <= 0;
                        Vcounter5 <= 0;
                        Vcounter6 <= 0;
                        Vcounter7 <= 0;
                        Vcounter8 <= 0;
                        Vcounter9 <= 0;
                        Vcounter10 <= 0;
                    else
                        Vcounter <= Vcounter + 1;
                    end if;
                else
                    Hcounter <= Hcounter + 1;
                end if;
            else
                if hsync_in = '1' and vsync_in = '1' then
                    Hcounter <= 0; 
                    Vcounter <= 0;
                end if;
                r <= x"30";
                g <= x"30";
                b <= x"30";
            end if;
        end if;
    end process;
    
    process(clk, Hcounter, Vcounter) is
    begin
        if (Hcounter = frame_width) and (Vcounter = frame_height) then
            if to_integer(signed(soundinput)) >= 0 then
                if to_integer(unsigned(soundinput)) > 819200 then
                    audio <= to_integer(shift_right(to_unsigned(819200,20), 11));
                else
                    audio <= to_integer(shift_right(unsigned(soundinput),11));
                end if;
            else
                if (- (to_integer(signed(soundinput)))) > 819200 then
                    audio <= to_integer(shift_right(to_unsigned(819200,20), 11));
                else
                    audio <= to_integer(shift_right(to_signed(- to_integer(signed(soundinput)),20), 11));
                end if;
            end if;
            
        end if;
    end process;
end rtl;
