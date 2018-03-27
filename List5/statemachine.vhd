
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity statemachine is
  port(
	clk:     in std_logic;
	pusher:  in std_logic;
  rst : in std_logic;
	driver : out std_logic_vector(1 downto 0) := "00"
  );

end statemachine;

architecture Flow of statemachine is
  type stan is (S0, S1, S2, S3);
  signal stan_teraz : stan := S0;
  signal stan_potem : stan := S0;
  signal counter : integer := 0;
begin

state_advance: process(clk, rst)
begin
  if (rst = '1') then
    stan_teraz <= S0;
	else
    if rising_edge(clk) then
			if pusher = '1' then
				stan_teraz <= stan_potem;
        if stan_teraz = S2 then
          counter <= counter + 1;
        elsif stan_teraz = S3 then
          counter <= 0;
        end if;
			end if;
		end if;
	end if;

end process;

next_state: process(stan_teraz,counter)
begin
   case stan_teraz is
     when S0 =>
				stan_potem <= S1;
				driver <= "00";
	  when S1 =>
				stan_potem <= S2;
				driver <= "01";
	  when S2 =>
        driver <= "10";
        if counter = 2 then
          stan_potem <= S3;
        end if;
	  when S3 =>
				stan_potem <= S0;
				driver <= "11";
   end case;
end process;

end Flow;
