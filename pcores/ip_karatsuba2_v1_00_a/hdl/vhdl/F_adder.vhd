--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:    14:33:40 04/26/08
-- Design Name:    
-- Module Name:    add_sou_gen - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity F_adder is
generic (N:integer:=32 );
   Port ( GRS	:	IN	STD_LOGIC;
	       AS : in std_logic;
			sel : in std_logic;
					clk: in std_logic;
	            A  : in std_logic_vector  (N-1 downto 0);
               B  : in std_logic_vector  (N-1 downto 0);  
					c_in : in std_logic;
               S  : out std_logic_vector (N-1 downto 0);
					c_out : out std_logic
					);
         

end F_adder;

architecture Behavioral of F_adder is

COMPONENT add_sous_cell
   
	PORT ( GRS	:	IN	STD_LOGIC;
	       ADD_SUB	:IN	STD_LOGIC; 
          clk	   :IN	STD_LOGIC; 
			 ci	   :IN	STD_LOGIC;
          a0	   :IN	STD_LOGIC;
			 b0	   :IN	STD_LOGIC; 
          a1	   :IN	STD_LOGIC; 
          b1	   :IN	STD_LOGIC;        
			 s0	   :OUT	STD_LOGIC;
			 s1	   :OUT	STD_LOGIC;   
          co	   :OUT	STD_LOGIC);
   END COMPONENT;



signal Cint: std_logic_vector (N/2-1 downto 1);
signal N_add_sub: std_logic;


begin



N_add_sub <= not AS when sel='0'
						  else c_in;



U0:for j in 0 to 0 generate
           
 U1: add_sous_cell  port map(
     
	  GRS=> GRS,
	  ADD_SUB=>AS, 
	  clk=>clk,
	  ci => N_add_sub, 
	  b0 =>B(0) , 
	  a0 =>A(0), 
	  s0 =>S(0),  
	  a1 =>A (1), 
	  b1 =>B (1), 
	  s1 =>S (1), 
	  co =>Cint(1)); 		
   
	end generate U0;

U2:for i in 1 to N/2-2 generate
           
 U3: add_sous_cell  port map(
     
	  GRS=>GRS,
	  ADD_SUB=>AS,
	  clk=>clk,
	  ci => Cint(i), 
	  b0 =>B(2*i) , 
	  a0 =>A(2*i), 
	  s0 =>S(2*i), 	 
	  a1 =>A (2*i+1), 
	  b1 =>B (2*i+1), 
	  s1 =>S (2*i+1), 
	  co =>Cint(i+1)); 
		
   end generate U2;


U4: for i in N/2-1 to N/2-1 generate
 
 U5: add_sous_cell  port map(
     
	  GRS=>GRS,
	  ADD_SUB=>AS,
	  clk=>clk,
	  ci => Cint(i), 
	  b0 =>B(2*i) , 
	  a0 =>A(2*i), 
	  s0 =>S(2*i), 	 
	  a1 =>A (2*i+1), 
	  b1 =>B (2*i+1), 
	  s1 =>S (2*i+1), 
	  co =>c_out); 
	  
	  end generate U4;


end Behavioral;
