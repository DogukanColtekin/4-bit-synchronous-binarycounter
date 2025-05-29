library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;


entity topmodule is
Port (
        boardclktop   : in  STD_LOGIC;
		  enableouter : in std_logic;
		  clrouter : in std_logic;
        Qout        : out STD_LOGIC_VECTOR(3 downto 0);
        COut        : out STD_LOGIC
    );
end topmodule;

architecture structural of topmodule is

component my_counter4 is
    Port (
        mvclock   : in  STD_LOGIC;
        CLR       : in  STD_LOGIC;
        clk_enable: in  STD_LOGIC;
        EN        : in  STD_LOGIC;
        Q         : out STD_LOGIC_VECTOR(3 downto 0);
        CO        : out STD_LOGIC
    );
end component;

component freqdivider is
    Port (
        boardclk     : in  STD_LOGIC;
        enablesignal : out STD_LOGIC
    );
end component;


signal slowclocksig : std_logic;
signal Qoutsig : std_logic_vector(3 downto 0);
signal Coutsig : std_logic;


begin

U1: freqdivider port map(boardclktop,slowclocksig);
U2: my_counter4 port map(boardclktop,clrouter,slowclocksig,enableouter,Qoutsig,Coutsig);



Qout<=Qoutsig;
Cout<=Coutsig;


end structural;

