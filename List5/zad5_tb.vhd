LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
-- include also the local library for 'str' call
USE work.txt_util.ALL;



ENTITY zad5_tb IS
END zad5_tb;

ARCHITECTURE behavior OF zad5_tb IS
    COMPONENT zad5
    PORT(
         clk : IN  std_logic;
         driver : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal driver : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: zad5 PORT MAP (
          clk => clk,
          driver => driver
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      wait;
   end process;
END;
