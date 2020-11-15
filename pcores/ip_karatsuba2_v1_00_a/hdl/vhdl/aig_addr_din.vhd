library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity aig_addr_din is
 generic ( N    :integer:=32 ;
           m    :integer:=5);
  
  port   ( Clk  	      : in  std_logic;
			  Din       	: in  std_logic_vector(N-1 downto 0); -- données en entrées
           T       	   : in  std_logic_vector(N-1 downto 0);
			  AS  			: in  std_logic_vector(N-1 downto 0);
			  AS1		      : in  std_logic_vector(N-1 downto 0);			  
			  run_mmm    	: in  std_logic;

			  addr_w_ab 	: in  std_logic_vector(m downto 0); -- bus d'adresse en phase d'écritrure
			  addr_w_m   	: in  std_logic_vector(m downto 0); -- bus d'adresse en phase d'écritrure
			  
			  Addr_R_Op 	: in  std_logic_vector(m downto 0); -- bus d'adresse en phase de lecture  			  		     
			  addr_AM_R 	: in  std_logic_vector(m downto 0); -- bus d'adresse en phase de lecture de la mémoire A 			  
			  addr_BM_R 	: in  std_logic_vector(m downto 0); -- bus d'adresse en phase de lecture de la mémoire B			  
			  addr_R_M 		: in  std_logic_vector(m downto 0); -- bus d'adresse en phase de lecture de la mémoire M

			  Addr_WR_MMM    : in std_logic_vector(m downto 0);
			  Addr_WR_AS     : in std_logic_vector(m downto 0);

           Sel_Mem_A0     : in std_logic;
			  Sel_Mem_B0     : in std_logic;
			  
			  etat2		     : in std_logic;
			  etat3		     : in std_logic;
			  etat4		     : in std_logic;

			  Init_MMM 		  : in  std_logic; 
			  Init_AS 		  : in  std_logic;

           MMM_status     : in  std_logic;
			  AS_status      : in  std_logic;			  


  			  D_A0         : out std_logic_vector(N-1 downto 0); -- bus de donnée d'entrer de la mémoire A0 
           D_A1         : out std_logic_vector(N-1 downto 0);
			  D_B0         : out std_logic_vector(N-1 downto 0); 
           D_B1         : out std_logic_vector(N-1 downto 0); 			  
			  D_A00        : out std_logic_vector(N-1 downto 0);
			  D_A11        : out std_logic_vector(N-1 downto 0);
			  D_B00        : out std_logic_vector(N-1 downto 0);
			  D_B11        : out std_logic_vector(N-1 downto 0);
			  D_M          : out std_logic_vector(N-1 downto 0);
			   

			  addr_A0      : out std_logic_vector(m downto 0); -- bus d'adress de la mémoire A0
			  addr_A1      : out std_logic_vector(m downto 0);
			  addr_B0      : out std_logic_vector(m downto 0); 
			  addr_B1      : out std_logic_vector(m downto 0);
			  addr_A00     : out std_logic_vector(m downto 0); 
			  addr_A11     : out std_logic_vector(m downto 0);
			  addr_B00     : out std_logic_vector(m downto 0); 
			  addr_B11     : out std_logic_vector(m downto 0);
			  addr_M       : out std_logic_vector(m downto 0)

			 ); 
end aig_addr_din;

architecture Behavioral of aig_addr_din is


signal select_addr_A0 : std_logic_vector(6 downto 0);
signal select_addr_A00 : std_logic_vector(3 downto 0);
signal select_addr_B0 : std_logic_vector(3 downto 0);
signal select_D_A0 : std_logic_vector(2 downto 0);
signal select_D_A00 : std_logic_vector(1 downto 0);

SIGNAL N_T, N_AS, N_AS1 : std_logic_vector(N-1 downto 0);


begin


D_A1 <= Din;  
D_B1 <= Din;

D_A11 <= Din;
D_B00 <= Din;
D_B11 <= Din;

D_M  <= Din;         

process (Clk,MMM_status)
begin
   if MMM_status = '0' then 
	N_T<=( oTHERS => '0');

	elsif Clk'event and Clk='1' then  
         N_T <= T;

   end if;  
end process;

process (Clk,AS_status)
begin
   if AS_status = '0' then 
	N_AS  <= ( oTHERS => '0');
	N_AS1 <= ( oTHERS => '0');

	elsif Clk'event and Clk='1' then  
         N_AS  <= AS;
			N_AS1 <= AS1;

   end if;  
end process;

-----Selection des bus de donnée vers la mémoire A0--------------------
--D_A0 <= Din WHEN AS_status='0'
	--			ELSE N_AS;
	
select_D_A0 <= etat3 & MMM_status & AS_status;

process (select_D_A0,Din,N_AS,N_T)
begin
   case select_D_A0 is
      when "000"  => D_A0 <= Din; 
      when "001"  => D_A0 <= N_AS; 
		when "110"  => D_A0 <= N_T; 
      when others => null;
   end case;
end process;


	
-----Selection des bus de donnée vers la mémoire A00--------------------
D_A00 <= Din WHEN MMM_status='0' 
            ELSE N_T;		
				
-----Selection des bus de donnée vers la mémoire B0--------------------				
D_B0 <= Din WHEN AS_status='0' 
            ELSE N_AS1;			
				
--------------------------------------------------------------//
   
addr_A1 <=  addr_w_ab WHEN Init_AS ='0' 
            ELSE Addr_R_Op;			
				
addr_B00 <= addr_w_ab WHEN Init_MMM ='0' 
            ELSE addr_BM_R;	


addr_A11 <= addr_w_ab WHEN run_mmm ='0' 
            ELSE addr_AM_R;
addr_B11 <= addr_w_ab WHEN run_mmm ='0' 
            ELSE addr_BM_R;


addr_B1 <=  addr_w_ab WHEN run_mmm ='0' 
            ELSE Addr_R_Op;

				
addr_M <=  addr_w_m WHEN run_mmm ='0' 
           ELSE addr_R_M;



				
-----Selection des bus d'adresses vers la mémoire A0--------------------
--addr_A0 <=  addr_w_ab WHEN Init_AS ='0' 
--            ELSE Addr_R_Op;

select_addr_A0 <= etat4 & etat3 & Sel_Mem_A0 & Init_MMM & Init_AS & AS_status & MMM_status;

process (select_addr_A0,addr_w_ab,Addr_R_Op,Addr_WR_AS,addr_AM_R,Addr_WR_MMM)
begin
   case select_addr_A0 is
      when "0010000"  => addr_A0 <= addr_w_ab; 
      when "0000100"  => addr_A0 <= Addr_R_Op; 
		when "0000110"  => addr_A0 <= Addr_WR_AS;
		when "0101000"  => addr_A0 <= addr_AM_R;
		when "0101001"  => addr_A0 <= Addr_WR_MMM;
		when "1000100"  => addr_A0 <= Addr_R_Op;
		when "1000110"  => addr_A0 <= Addr_WR_AS;
		when "0000000"  => addr_A0 <= "0000";
      when others => null;
   end case;
end process;


-----Selection des bus d'adresses vers la mémoire A00--------------------
--addr_A00 <= addr_w_ab WHEN run_mmm ='0' 
--            ELSE addr_AM_R;

select_addr_A00 <= etat4 & Sel_Mem_A0 & Init_MMM & MMM_status;

process (select_addr_A00,addr_w_ab,addr_AM_R,Addr_WR_MMM,Addr_R_Op)
begin
   case select_addr_A00 is
      when "0100"  => addr_A00 <= addr_w_ab;
      when "0010"  => addr_A00 <= addr_AM_R;
		when "0011"  => addr_A00 <= Addr_WR_MMM;
		when "1000"  => addr_A00 <= Addr_R_Op; --
		when "0000"  => addr_A00 <= "0000";
      when others => null;
   end case;
end process;

-----Selection des bus d'adresses vers la mémoire B0--------------------
--addr_B0 <=  addr_w_ab WHEN run_mmm ='0' 
--            ELSE Addr_R_Op;

select_addr_B0 <= etat3 & etat2 & Sel_Mem_B0 & AS_status;

process (select_addr_B0,addr_w_ab,Addr_R_Op,Addr_WR_AS,addr_BM_R)
begin
   case select_addr_B0 is
      when "0010"  => addr_B0 <= addr_w_ab; 
      when "0100"  => addr_B0 <= Addr_R_Op; 
		when "0101"  => addr_B0 <= Addr_WR_AS;
		when "1000"  => addr_B0 <= addr_BM_R;
		when "0000"  => addr_B0 <= "0000";
      when others => null;
   end case;
end process;



			  
end Behavioral;

