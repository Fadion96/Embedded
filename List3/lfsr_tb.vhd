LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use std.textio.all;

ENTITY lfsr_tb IS
END lfsr_tb;

ARCHITECTURE behavior OF lfsr_tb IS

    -- UUT (Unit Under Test)
    COMPONENT lfsr
    PORT(
         clk : in  std_logic;
         q : inout  STD_LOGIC_VECTOR (15 downto 0)
        );
    END COMPONENT;

   -- input signals
   signal clk : std_logic := '0';

   -- input/output signal
   signal qq : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
   signal bits1 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');

   -- signal bits1




   -- set clock period
   constant clk_period : time := 20 ns;

BEGIN
	-- instantiate UUT
   uut: lfsr PORT MAP (
          clk => clk,
          q   => qq
        );

   -- clock management process
   -- no sensitivity list, but uses 'wait'
   clk_process :PROCESS
   BEGIN
		clk <= '0';
		WAIT FOR clk_period/2;
		clk <= '1';
		WAIT FOR clk_period/2;
   END PROCESS;


   -- stimulating process
   stim_proc: PROCESS
   BEGIN
   for k in 0 to 100000 loop
      for i in 0 to 7 loop
         bits1(i) <= qq(15);
      end loop;
      wait for clk_period;
   end loop;
      wait;
   END PROCESS;
END;
