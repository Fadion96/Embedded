library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity gateNXOR is
port (
	X: in std_logic;
	Y: in std_logic;
	Z: out std_logic
);
end gateNXOR;

architecture Behavioral of gateNXOR is
begin
 Z <= not (X xor Y) after 1 ns;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity gateNAND is
port (
	X: in std_logic;
	Y: in std_logic;
	Z: out std_logic
);
end gateNAND;

architecture Behavioral of gateNAND is
begin
 Z <= not (X and Y) after 1 ns;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity gateANDN is
port (
	X: in std_logic;
	Y: in std_logic;
	Z: out std_logic
);
end gateANDN;

architecture Behavioral of gateANDN is
begin
 Z <= (not X) and Y after 1 ns;
end Behavioral;
