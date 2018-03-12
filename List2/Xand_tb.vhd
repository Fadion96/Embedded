LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- jesli mozliwe, nie uzywac std_logic_unsigned -- nie wspiera standardow
-- USE ieee.std_logic_unsigned.ALL;
-- numeric_std i owszem
use ieee.numeric_std.all;

ENTITY Xand_tb IS
END Xand_tb;

ARCHITECTURE behavior OF Xand_tb IS
    component Xand is
        generic (width : integer);
        port ( 
            A,B : in std_logic_vector(width-1 downto 0);
            C : out std_logic_vector(width-1 downto 0)
            );
    end component;

    signal A,B : std_logic_vector(3 downto 0) := (others => '0');
    signal C :  std_logic_vector(3 downto 0) := (others => '0');
    begin


    UUT : Xand generic map (width => 4)
    port map (
        A => A,
        B => B,
        C => C
     );
     stim_proc: process
     begin
         wait for 100 ns;
         for i in 0 to 15 loop
             for j in 0 to 15 loop
                 B <= std_logic_vector( unsigned(B) + 1 );
                 wait for 10 ns;
            end loop;
            A <= std_logic_vector( unsigned(A) + 1 );
        END loop;
            wait;
     end process;
 end;
