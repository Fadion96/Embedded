--  Hello world program.
--library IEEE;
--use IEEE.std_logic_1164.all;
--use ieee.numeric_std.all;
use std.textio.all; -- Imports the standard textio package.

--  Defines a design entity, without any ports.
entity hello_world is
end hello_world;

architecture behaviour of hello_world is
signal a : bit := '1';
begin
   process
      variable l : line;
      variable z : line;
   begin
      write (l, String'("Hello world!"));
      writeline (output, l);
      a <= '0';
      wait for 1 ns;
      write (l, a);
      writeline(output, l);
      readline (input, z);
      writeline (output, z);
      wait;
   end process;
end behaviour;
