----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:30 11/06/2014 
-- Design Name: 
-- Module Name:    BasculeD32 - Behavioral 
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

entity Bascule32 is port (
			clk ,RESET: in std_logic;
			d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
			);
end Bascule32;

architecture Behavioral of Bascule32 is

begin
process (CLK,RESET)
begin
 if (RESET='0') then q <= (others => '0');
 elsif (CLK'event and CLK='1') then q <= d;
 end if;
end process;

end Behavioral;

