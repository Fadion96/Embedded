
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE work.txt_util.ALL;

entity zad5 is
  port(
	clk:     in std_logic;
	driver : out std_logic_vector(1 downto 0) := "00"
  );

end zad5;

architecture Flow of zad5 is
  type stan is (S0, S1, S2);
  signal stan_teraz : stan := S0;
  signal stan_potem : stan := S0;
  signal stan_poprzedni : stan := S0;
begin

state_advance: process(clk)
begin
    if rising_edge(clk) then
        stan_poprzedni <= stan_teraz;
				stan_teraz <= stan_potem;
	end if;

end process;

next_state: process(stan_teraz,stan_poprzedni)
begin
   case stan_teraz is
     when S0 =>
        print("hop");
				stan_potem <= S2;
				driver <= "00";
	  when S1 =>
        print("tra");
				stan_potem <= S2;
				driver <= "01";
	  when S2 =>
        print("la");
        case stan_poprzedni is
          when S0 =>
            stan_potem <= S1;
          when S1 =>
            stan_potem <= S2;
          when S2 =>
            stan_potem <= S0;
        driver <= "10";
      end case;
   end case;
end process;

end Flow;
