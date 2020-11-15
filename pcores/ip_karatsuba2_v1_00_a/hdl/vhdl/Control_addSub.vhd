----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:19 11/24/2014 
-- Design Name: 
-- Module Name:    Control_addSub - Behavioral 
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
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity Control_addSub is
    generic (m    : integer:=3 ;    -- change with the data size        
             e    : integer:=8;
             N: integer :=32				); 
	 port(
	      reset_write_modulo     : IN STD_LOGIC;
	      reset_write_A_B        : IN STD_LOGIC;
	      Rd_ack                 : IN STD_LOGIC;
	 
	     CLK,RESET: in std_logic;
         Addr_R_Op : out std_logic_vector(m downto 0);
			Addr_WR : out std_logic_vector(m downto 0);
			addr_R_R      : out std_logic_vector(m downto 0);
			sel1 : OUT std_logic;
			sel2 : OUT std_logic;
			sel3 : OUT std_logic;
			we_R_W : OUT std_logic_vector(0 downto 0);
			Addr_w_m : OUT std_logic_vector(m downto 0);
			addr_w_AB      : out std_logic_vector(m downto 0);
			Sel_modulo :OUT std_logic;
			Sel_A        : out std_logic;
			Sel_B        : out std_logic
			);
end Control_addSub;

architecture archi of Control_addSub is
   
Signal N_q : INTEGER;
Signal counter1 : integer;

signal stock_Z1Z2 :std_logic;
 

signal counter_2              : integer;
signal counter_3              : integer;
signal N_counter_3            :  std_logic_vector (31 downto 0); -- utilisé pour les selection des signaux de selection des mémoires
signal NT_Addr_w_m            :  std_logic_vector (m downto 0);
--signal N_sel_Mc               :  std_logic; 
signal counter_4              : integer;
signal counter_5              : integer;
signal counter_6              : integer;
signal N_counter_5            :  std_logic_vector (31 downto 0); -- utilisé pour les selection des signaux de selection des mémoires
signal NT_Addr_w_AB            :  std_logic_vector (m downto 0);
signal sel                     :  std_logic;
signal N_we_R_W                :  std_logic;

begin
    write_modulo_mc_PROCESS:process (clk,counter_2,counter_3,Rd_ack,reset_write_modulo)

begin  
 
  if reset_write_modulo = '0' then
		counter_2 <= 0;
		counter_3 <= 0;
		--N_sel_Mc <=  '0';
		elsif Clk'event and Clk = '1' then
		if Rd_ack='1' then
         counter_2 <= counter_2 + 1;
			if counter_2=e+1 then 
				   counter_2 <= 1;
               counter_3 <= counter_3 +1 ;					
         end if;
			IF counter_2    =  0 THEN 
			      counter_3 <=  counter_3 +1 ; 			
         END IF;
         --if counter_3    =  1 then
			--N_sel_Mc <=  '1' ;
			--  else N_sel_Mc <=  '0' ;
         --   END IF; 	   		
		end if;			
  end if; 
end process write_modulo_mc_PROCESS;

NT_Addr_w_m  <= conv_std_logic_vector(counter_2,m+1);
N_counter_3  <= conv_std_logic_vector(counter_3,32);           
--sel_Mc<=N_sel_Mc;

process (Clk,reset_write_modulo)
begin
  if reset_write_modulo = '0' then 
	Addr_w_m<=( oTHERS => '1');
	elsif Clk'event and Clk='1' then  
         Addr_w_m <= NT_Addr_w_m;
   end if;  
end process;

-- control chip select memory modulo-------------------------- 
sel_memory_M_proc : process(Clk,reset_write_modulo,N_counter_3 ) 
 begin    
  if reset_write_modulo = '0' then
         Sel_modulo <= '0';
		  elsif Clk'event and Clk = '1' then 
		  case N_counter_3 is
          when "00000000000000000000000000000001" =>
			        Sel_modulo <= '1';                					 
           when "00000000000000000000000000000010" =>
                 Sel_modulo <= '0';							 
			when others => null;
        end case;
	end if;	  
end process sel_memory_M_proc;


--------*************************************************************************----------
--------procedure de l'ecriture des opérandes-------------------------- 
--------************************************------------------------------
write_AB_PROCESS:process (clk,counter_4,counter_5,Rd_ack,reset_write_A_B)
      
begin  
 
  if reset_write_A_B = '1' then
 --   if N_rst_w = '1' then
		counter_4 <= 0;
		counter_5 <= 0;
		elsif Clk'event and Clk = '1' then
		if Rd_ack='1' then
         counter_4 <= counter_4 + 1;
			if counter_4=e+1 then 
				   counter_4 <= 1;
               counter_5 <= counter_5 +1 ;					
         end if;
			IF counter_4    =  0 THEN 
			      counter_5 <=  counter_5 +1 ; 			
         END IF;   		
		end if;
	
  end if; 
end process write_AB_PROCESS;

NT_Addr_w_AB  <= conv_std_logic_vector(counter_4,m+1);
N_counter_5  <= conv_std_logic_vector(counter_5,32);

process (Clk,reset_write_A_B)
begin
  if reset_write_A_B = '1' then 
	Addr_w_AB<=( oTHERS => '1');
	elsif Clk'event and Clk='1' then  
         Addr_w_AB <= NT_Addr_w_AB;
   end if;  
end process;
	 

-- control chip slect memory A B -------------------------- 
sel_memory_AB_proc : process(Clk,reset_write_A_B,N_counter_5 ) 
 begin    
  if reset_write_A_B = '1' then
        Sel_A <= '0';
        Sel_B <='0';
		  Sel <='0';
		  elsif Clk'event and Clk = '1' then 
		  case N_counter_5 is
          when "00000000000000000000000000000001" =>
			       Sel_A <= '1';
                Sel_B <='0';
		          Sel   <='0';
		         					 
          when "00000000000000000000000000000010" =>
                Sel_A <= '0';
                Sel_B <='1';
		          Sel <='0';
		   	
			 when "00000000000000000000000000000011" =>
                Sel_A <= '0';
                Sel_B <='0';
		          Sel <='0';								 
			when others => null;
        end case;
	end if;	  
end process sel_memory_AB_proc;


	 
	 --- procedure d'execution--------------
	 process (CLK,RESET)
    begin
        if (RESET='0') then	
		    N_q <= 0;sel1 <= '0';sel2 <= '0';sel3 <= '0'; stock_Z1Z2 <='0';
		      elsif (CLK'event and CLK='1') then 
					N_q <= N_q + 1;	
					if(N_q = 2) then sel1 <= '1'; stock_Z1Z2 <='1' ; end if;
					if(N_q = 3) then sel2 <= '1';  end if;
					if(N_q = 3+e) then sel3 <= '1'; 
					else sel3 <= '0'; 
					end if;
			end if;					
 end process;

Addr_R_Op <= conv_std_logic_vector(N_q,m+1);
	
	process (CLK,stock_Z1Z2)
    begin
        if (stock_Z1Z2='0') then	
		    counter1 <= 0;
			 N_we_R_W <= '1';
		      elsif (CLK'event and CLK='1') then 
					counter1 <= counter1 + 1;
					if(counter1 = 9) 
					then N_we_R_W <= '0'; 
					  counter1<=0;
					end if;				
	 end if;
end process;

Addr_WR <= conv_std_logic_vector(counter1,m+1);


we_R_W(0)<=N_we_R_W;
----------------procedure pour le transfere des données---------------------------------

timer_PROCESS:process (clk,Rd_ack,N_we_R_W  )
begin  
  if N_we_R_W = '1' then  
		counter_6<= 0;
		--valid_result<='0';
		elsif Clk'event and Clk = '1' then
		if Rd_ack='1' then
			counter_6<=counter_6+1;					
		end if;
	  -- if   N_rst_w='1' then  
	    -- valid_result<='1'; 
       -- counter_6<=0;		  
      --end if;
		--if counter_6=e+2 then	  		
     --   valid_result<='0';
	  -- end if;	
  end if; 
end process timer_PROCESS;

Addr_R_R  <= conv_std_logic_vector(counter_6,m+1);

----------------------------------controle_write-----------------


end archi;




