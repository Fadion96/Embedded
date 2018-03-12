library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity zad5 is
port (
  a,b,c,d : in std_logic;
  x,y,z   : out std_logic
);
end zad5;

architecture behavior of zad5 is
  component gateXOR
    port (X,Y: in std_logic;
          Z:  out std_logic);
  end component;
  component gateNXOR
    port (X,Y: in std_logic;
          Z:  out std_logic);
  end component;
  component gateAND
    port (X,Y: in std_logic;
          Z:  out std_logic);
  end component;
  component gateNAND
    port (X,Y: in std_logic;
          Z:  out std_logic);
  end component;
 component gateNOT
   port (X: in std_logic;
	      Z: out std_logic);
 end component;
 component gateANDN
   port (X,Y: in std_logic;
	        Z: out std_logic);
 end component;
 signal XOR_NAND,
        NXOR_G,
		  AND_ANDN : std_logic;
begin
 G1: gateXOR port map (a,b,XOR_NAND);
 G2: gateNXOR  port map (b,c,NXOR_G);
 G3: gateAND port map (c,d,AND_ANDN);
 G4: gateNAND port map (XOR_NAND,NXOR_G, x);
 G5: gateNOT port map  (NXOR_G,y);
 G6: gateANDN port map (NXOR_G,AND_ANDN,z);
end behavior;
