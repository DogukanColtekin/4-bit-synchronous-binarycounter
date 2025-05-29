library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;


entity my_counter4 is
    Port (
        mvclock   : in  STD_LOGIC;
        CLR       : in  STD_LOGIC;
        clk_enable: in  STD_LOGIC;
        EN        : in  STD_LOGIC;
        Q         : out STD_LOGIC_VECTOR(3 downto 0);
        CO        : out STD_LOGIC
    );
end my_counter4;

architecture structural of my_counter4 is

    -- Internal signals for flip-flop outputs
    signal Q0_int, Q1_int, Q2_int, Q3_int : STD_LOGIC;

    -- Signals for AND gate outputs (Enable chain)
    signal EN1, EN2, EN3 : STD_LOGIC;

    -- Signals for XOR gate outputs (D inputs)
    signal D0, D1, D2, D3 : STD_LOGIC;
	 
	 signal CE1, CE2, CE3 : std_logic;

    -- Component declaration for D Flip-Flop with Clock Enable and Clear
    component FDCE
        Port (
            Q   : out STD_LOGIC;
            C   : in  STD_LOGIC;
            CE  : in  STD_LOGIC;
            CLR : in  STD_LOGIC;
            D   : in  STD_LOGIC
        );
    end component;

begin

    -- XOR gates (toggle logic)
    D0 <= not Q0_int;
    D1 <= Q1_int xor Q0_int;
    D2 <= Q2_int xor (Q1_int and Q0_int);
    D3 <= Q3_int xor (Q2_int and Q1_int and Q0_int);

    -- Enable chain for higher bits (AND gates)
    EN1 <= EN and Q0_int;
    EN2 <= EN and Q0_int and Q1_int;
    EN3 <= EN and Q0_int and Q1_int and Q2_int;
	 
	
	 
	 CE1 <= clk_enable and EN1;
    CE2 <= clk_enable and EN2;
    CE3 <= clk_enable and EN3;

    -- Flip-flop instances
    U0: FDCE port map (
        Q   => Q0_int,
        C   => mvclock,
        CE  => clk_enable,
        CLR => CLR,
        D   => D0
    );

    U1: FDCE port map (
        Q   => Q1_int,
        C   => mvclock,
        CE  => CE1,
        CLR => CLR,
        D   => D1
    );

    U2: FDCE port map (
        Q   => Q2_int,
        C   => mvclock,
        CE  => CE2,
        CLR => CLR,
        D   => D2
    );

    U3: FDCE port map (
        Q   => Q3_int,
        C   => mvclock,
        CE  => CE3,
        CLR => CLR,
        D   => D3
    );

    -- Output assignments
    Q <= Q3_int & Q2_int & Q1_int & Q0_int;
    CO <= Q0_int and Q1_int and Q2_int and Q3_int;

end structural;