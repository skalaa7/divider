----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2022 04:33:19 PM
-- Design Name: 
-- Module Name: dopivoting_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
entity dopivoting_tb is
--  Port ( );
end dopivoting_tb;

architecture Behavioral of dopivoting_tb is
component divider_32 is
   Port (   dividend_tdata : in STD_LOGIC_VECTOR (31 downto 0);
           dividend_tvalid: in STD_LOGIC;
           divisor_tdata : in STD_LOGIC_VECTOR (31 downto 0);
           divisor_tvalid: in STD_LOGIC;
           clk : in STD_LOGIC;
           dout_tdata : out STD_LOGIC_VECTOR (31 downto 0);
           dout_tvalid: out STD_LOGIC );
end component divider_32;

signal a_in_s, b_in_s:  STD_LOGIC_VECTOR (31 downto 0);
signal c_out_s: STD_LOGIC_VECTOR (31 downto 0);--ovde
signal clk: std_logic;
signal valid_a, valid_b: std_logic;
signal valid_out: std_logic;
begin
    duv: divider_32
        port map(
            dividend_tdata => a_in_s,
            divisor_tdata => b_in_s,
            clk => clk,
            dout_tdata => c_out_s,
            dividend_tvalid => valid_a,
            divisor_tvalid => valid_b,
            dout_tvalid => valid_out
        );
    
    
    clk_gen: process
    begin
        clk <= '0', '1' after 5ns;
        wait for 10ns;
    end process;
   
    stim_gen: process
    begin
        valid_a <= '1';
        valid_b<= '1';
        a_in_s <=x"ffed70a3",x"00100000" after 10ns,x"fff851eb" after 20ns,x"ffeb851e" after 30ns,x"fff947ae" after 40ns,x"fff0a3d7" after 50ns,x"ffeb851e" after 60ns,x"00175c29" after 70ns,
        x"fff147ae" after 80ns, x"ffe947ae" after 90ns,x"fff147ae" after 100ns, x"0018a3d7" after 110ns,x"0012e147" after 120ns, x"00199999" after 130ns,x"0018f5c2" after 200ns;
        --                                                                  
        b_in_s <=x"0016b851";--,x"ff800000" after 20ns,x"ffc00000" after 30ns,x"0016b851" after 40ns ;
        --                                            
    wait;
    end process;
end Behavioral;
