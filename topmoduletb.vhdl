library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_topmodule is
end tb_topmodule;

architecture behavior of tb_topmodule is

    -- Component under test
    component topmodule
        Port (
            boardclktop : in  STD_LOGIC;
            enableouter : in  STD_LOGIC;
            clrouter    : in  STD_LOGIC;
            Qout        : out STD_LOGIC_VECTOR(3 downto 0);
            COut        : out STD_LOGIC
        );
    end component;

    -- Signals for driving DUT
    signal boardclktop : STD_LOGIC := '0';
    signal enableouter : STD_LOGIC := '1';
    signal clrouter    : STD_LOGIC := '0';
    signal Qout        : STD_LOGIC_VECTOR(3 downto 0);
    signal COut        : STD_LOGIC;

    -- Clock period constant
    constant CLK_PERIOD : time := 1000 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: topmodule
        port map (
            boardclktop => boardclktop,
            enableouter => enableouter,
            clrouter    => clrouter,
            Qout        => Qout,
            COut        => COut
        );

    -- 100 MHz clock generation
    clk_process: process
    begin
        while true loop
            boardclktop <= '0';
            wait for CLK_PERIOD / 2;
            boardclktop <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Optional: Reset pulse at start (commented since clrouter is always '0')
    -- reset_process: process
    -- begin
    --     clrouter <= '1';
    --     wait for 50 ns;
    --     clrouter <= '0';
    --     wait;
    -- end process;

    -- Monitor outputs
    monitor_process: process
    begin
        wait for 10 us;  -- simulate for 10 microseconds
        report "Simulation finished." severity note;
        wait;
    end process;

end behavior;