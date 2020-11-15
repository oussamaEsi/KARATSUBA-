library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity AddSub_Mod is 
       generic (m : integer:=2 ;			 
					 N : integer:=32;
                e : integer:=5 ); 
		PORT(
				op_in 			 : IN std_logic;
				CLK 				 : IN std_logic;
				A					 : IN std_logic_vector(N-1 downto 0);
				B					 : IN std_logic_vector(N-1 downto 0);
				M1 				 : IN std_logic_vector(N-1 downto 0);
				ADD_SUB 			 : IN std_logic;       	
				sel1 			  	 : in std_logic;
				sel2 				 : in std_logic;
				sel3 				 : in std_logic;     

				AS_out		    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
				);
end AddSub_Mod;

architecture Behavioral of AddSub_Mod is

--signal N_Addr_R_op : std_logic_vector(m downto 0);


signal S1 : std_logic;
signal S2 : std_logic;

signal N_Z1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal N_Z2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal N_Z1_1,N_Z1_2,N_Z1_3,N_Z1_4,N_Z1_5,N_Z1_6,N_Z1_7,N_Z1_8,N_Z1_9  : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal N_Z2_1,N_Z2_2,N_Z2_3,N_Z2_4,N_Z2_5,N_Z2_6,N_Z2_7,N_Z2_8,N_Z2_9  : STD_LOGIC_VECTOR(31 DOWNTO 0);

signal N_ADD_SUB : std_logic;

signal sel : STD_LOGIC_VECTOR(2 DOWNTO 0);

signal we_R : STD_LOGIC_VECTOR(0 DOWNTO 0) := B"0";
signal we_W : STD_LOGIC_VECTOR(0 DOWNTO 0) := B"1";

signal N_din : STD_LOGIC_VECTOR(31 DOWNTO 0):= B"00000000000000000000000000000000";

signal N_M1 : STD_LOGIC_VECTOR(31 DOWNTO 0);

signal N_Z1out : STD_LOGIC_VECTOR(31 DOWNTO 0);

signal N_c   : std_logic:='0';
signal N_c1  : std_logic;
signal N2_c  : std_logic:='0';
signal N2_c1 : std_logic;



-----------EDK Signaux--------------

COMPONENT Control_addSub
	  generic (m: integer:=5 ;
              e: integer:=32;
              N: integer:=32				  ); -- fixe
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
			Sel_A      : out std_logic;
			Sel_B      : out std_logic
			);
END COMPONENT;
	
component aig_addr_din 
 generic ( N :integer:=32;
           m :integer:=5);  
  port   (
           clk      : IN std_logic;
			  Din      : in  std_logic_vector(N-1 downto 0); -- données en entrées
			  --T        : in  std_logic_vector(N-1 downto 0); -- données en entrées
			    
			  --  addr_R_A : in  std_logic_vector(m downto 0);
			  -- addr_R_B : in  std_logic_vector(m downto 0); 
           addr_W_AB   : in  std_logic_vector(m downto 0);           
			  addr_W_M : in  std_logic_vector(m downto 0); 
			  addr_R_M : in  std_logic_vector(m downto 0); 
			  -- addr_w_i  : in  std_logic_vector(m downto 0); -- bus d'adresse en phase d'écritrure
           addr_R_R    : in  std_logic_vector(m downto 0); 
			  Addr_WR     : in  std_logic_vector(m downto 0); -- bus d'adresse en phase d'écritrure
			  -- sel_A        : in std_logic;
			  wr_en    : in  std_logic;
           we_R_W       : in std_logic_vector(0 downto 0); 
			  --valid_result  : in std_logic;
                                -- signal pour le démarage de la multiplication de montgomery
			  
  			  D_A      : out std_logic_vector(N-1 downto 0); -- bus de donnée d'entrer de la mémoire A
           D_B      : out std_logic_vector(N-1 downto 0); -- bus de donnée d'entrer de la mémoire B
           
			  D_Modulo  : out std_logic_vector(N-1 downto 0); -- bus de donnée d'entrer de la mémoire M

			  addr_A    : out std_logic_vector(m downto 0); -- bus d'adress de la mémoire A
           addr_B    : out std_logic_vector(m downto 0); -- 
			  addr_M    : out std_logic_vector(m downto 0);
			  addr_R_Z  : out  std_logic_vector(m downto 0)
			 ); 
end component;
	
COMPONENT mem_bloc
  PORT (
    clka  : IN STD_LOGIC;
    ena 	 : IN STD_LOGIC;
    wea 	 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(m DOWNTO 0);
    dina  : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

COMPONENT F_adder
	generic (N:integer:=32 );
	Port ( 
			GRS	: IN STD_LOGIC;
	      AS 	: in std_logic;
			sel 	: in std_logic;
			clk	: in std_logic;
	      A  	: in std_logic_vector  (N-1 downto 0);
         B  	: in std_logic_vector  (N-1 downto 0);							
			c_in 	: in std_logic;
         S  	: out std_logic_vector (N-1 downto 0);
			c_out : out std_logic
			);
END COMPONENT;

COMPONENT bascule
	PORT(
		clk 	: IN std_logic;
		RESET : IN std_logic;
		d 		: IN std_logic;          
		q 		: OUT std_logic
		);
END COMPONENT;

COMPONENT Bascule32
	PORT(
		clk 	: IN std_logic;
		RESET : IN std_logic;
		d 		: IN std_logic_vector(31 downto 0);          
		q 		: OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;






begin

--N_reset <= not op_in;
N_ADD_SUB <= not ADD_SUB;


-- Retarder M 1 top d'horloge
U4: Bascule32 PORT MAP(
		clk => clk,
		RESET => op_in,
		d => M1,
		q => N_M1
	);

-- Retarder la retenue de l'additionneur du 1er (+/-)
U5: bascule PORT MAP(
		clk => clk,
		RESET => op_in,
		d => N_c,
		q => N_c1
	);
	
-- 1ere opr (+/-) sur 32 bit + un bit de retenue
U7: F_adder 
generic map (N)
PORT MAP(
		GRS => op_in,
		AS => ADD_SUB,
--		sel => N_sel1,
		sel => sel1,
		clk => clk,
		--A => N2_A,
		--B => N2_B,
		A => A,
		B => B,
		c_in => N_c1,
		--S => N_doutsz1,
		S => N_Z1,
		c_out => N_c
	);


U8: Bascule32 PORT MAP(
		clk => clk,
		RESET => op_in,
		d => N_Z1,
		q => N_Z1out
	);

-- Retarder la retenue de l'additionneur du 2eme (+/-)
U9: bascule PORT MAP(
		clk => clk,
		RESET => op_in,
		d => N2_c,
		q => N2_c1
	);
	

-- 2eme opr (+/-) sur 32 bit + un bit de retenue
U11: F_adder 
generic map (N)
PORT MAP(
		GRS => op_in,
		AS => N_ADD_SUB,
		--sel => N_sel2,
		sel => sel2,
		clk => clk,
		--A => N_doutsz1,
		A => N_Z1,
		B => N_M1,
		c_in => N2_c1,
		--S => N_doutsz2,
		S => N_Z2,
		c_out => N2_c
	);
	



--save SZ1 -----------------------------------------------------------
process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_1 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_1 <= N_Z1out;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_2 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_2 <= N_Z1_1;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_3 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_3 <= N_Z1_2;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_4 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_4 <= N_Z1_3;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_5 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_5 <= N_Z1_4;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_6 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_6 <= N_Z1_5;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_7 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_7 <= N_Z1_6;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_8 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_8 <= N_Z1_7;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z1_9 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z1_9 <= N_Z1_8;
   end if;
end process;

--save SZ2 
process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_1 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_1 <= N_Z2;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_2 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_2 <= N_Z2_1;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_3 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_3 <= N_Z2_2;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_4 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_4 <= N_Z2_3;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_5 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_5 <= N_Z2_4;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_6 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_6 <= N_Z2_5;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_7 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_7 <= N_Z2_6;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_8 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_8 <= N_Z2_7;
   end if;
end process;

process (Clk,op_in)
begin
   if op_in = '0' then 
	N_Z2_9 <= ( others => '0');
	elsif Clk'event and Clk='1' then  
         N_Z2_9 <= N_Z2_8;
   end if;
end process;




 
process (CLK,op_in,sel3)
begin
  if (op_in='0') then S1 <= '0';
  elsif (CLK'event and CLK='1') then 
  if(sel3='1') then S1 <= N_Z2(1); 
 end if;
 end if;
end process;

process (CLK,op_in,sel3)
begin
  if (op_in='0') then S2 <= '0';
  elsif (CLK'event and CLK='1') then 
  if(sel3='1') then S2 <= N_Z1out(0); 
 end if;
 end if;
end process;


---------Selection du résulat------------------------------------
sel <=  ADD_SUB &  S2 & S1;
	
-----------------------------------------------------------------

process (sel,N_Z1_9,N_Z2_9)--eguillage des bus d'addresse vers la mémoire A
begin
   case sel is
		
		when "000"  => AS_out <= N_Z1_9;
      when "001"  => AS_out <= N_Z1_9;
	   when "010"  => AS_out <= N_Z2_9;
      when "011"  => AS_out <= N_Z2_9;
		when "100"  => AS_out <= N_Z2_9;
      when "101"  => AS_out <= N_Z1_9;
	   when "110"  => AS_out <= N_Z2_9;
      when "111"  => AS_out <= N_Z1_9;
	   when others => null;
   end case;
end process;

--
--process (Clk,op_in)
--begin
--   if (op_in='0') then   
--		  AS_out <=  ( oTHERS => '0');
--	elsif Clk'event and Clk='1' then  
--	     AS_out <= N_R;
--   end if;
--end process;



end Behavioral;



