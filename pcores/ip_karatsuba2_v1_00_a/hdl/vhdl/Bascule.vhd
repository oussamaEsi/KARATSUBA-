----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:21 11/06/2014 
-- Design Name: 
-- Module Name:    basculeD - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bascule is port(
			clk ,RESET: in std_logic;
			d : in std_logic;
			q : out std_logic
			);
end bascule;

architecture Behavioral of bascule is

begin
process (CLK,RESET)
begin
  if (RESET='0') then q <= '0';
  elsif (CLK'event and CLK='1') then q <= d;
 end if;
 
end process;

end Behavioral;

