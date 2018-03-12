library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


entity zad5_tb is
end zad5_tb;

architecture behavior of zad5_tb is
  component zad5 is
    port (
        a,b,c,d : in std_logic;
        x,y,z   : out std_logic
    );
  end component;
  signal a : std_logic := '0';
  signal b : std_logic := '0';
  signal c : std_logic := '0';
  signal d : std_logic := '0';

  signal abcd : std_logic_vector(3 downto 0) := (others => '0');

  signal x : std_logic;
  signal y : std_logic;
  signal z : std_logic;

  constant period : time := 10 ns;

begin

  UUT: zad5 port map (a,b,c,d,x,y,z);
  --       a => a,
  --       b => b,
  --       c => c,
  --       d => d,
  --       x => x,
  --       y => y,
  --       z => z
  -- );

  stim_proc: process
  begin
    wait for 100 ns;
    for i in 0 to 15 loop
      abcd <= std_logic_vector( unsigned(abcd) + 1 );
      a <= abcd(3);
      b <= abcd(2);
      c <= abcd(1);
      d <= abcd(0);
      wait for period;
    end loop;
    wait;
  end process;

end architecture;
