library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Karatsuba2 is
	generic ( 
			m : integer:=5 ;
			N : integer:=32 ;				 
			e : integer:=32 
	); 
	port(
			run_mmm         : IN STD_LOGIC;
			RESET_IP        : IN STD_LOGIC;
			Load_Cts        : IN STD_LOGIC;
			Load_A_B        : IN STD_LOGIC;
			Wr_ack          : IN STD_LOGIC;
			CLK             : IN STD_LOGIC;
			Din             : in std_logic_VECTOR (N-1 downto 0)
);			

end Karatsuba2;

architecture Behavioral of Karatsuba2 is

component control_MMM 
     
	  generic (m: integer:=5 ;
              N: integer:=32;
              e: integer:=32				  ); -- fixe	  
	  port  (
	         RESET_IP        : IN STD_LOGIC;			
				Load_Cts        : IN STD_LOGIC;
				Load_A_B        : IN STD_LOGIC;
	         Wr_ack          : IN STD_LOGIC;
--	         read_ack        : IN STD_LOGIC;
	         op_in           : IN STD_LOGIC;
	         CLK             : IN STD_LOGIC;
--				--Din             : in std_logic_vector(0 to 31 );
--          valid_result1    : OUT std_logic;
				Addr_W_M        : out std_logic_vector(m downto 0);
				Addr_W_AB       : OUT std_logic_vector(m downto 0);
--				addr_w_i        : out std_logic_vector(m downto 0);
				Addr_R_AM       : out std_logic_vector(m downto 0);
				Addr_R_BM       : out std_logic_vector(m downto 0);
				Addr_R_M        : out std_logic_vector(m downto 0);
--				addr_R_Exp1     : out std_logic_vector(m downto 0);
				En_qi           : out std_logic;
				sel_Z0          : out std_logic;
				Reset_cy12      : out std_logic;
				Reset_cy34      : out std_logic;
				wr_en_fifo      : out std_logic;

            sel_Reg_Nc      : out std_logic;
				Sel_Mem_M       : out std_logic;
				Sel_Mem_A0      : out std_logic;
				Sel_Mem_A1      : out std_logic;
				Sel_Mem_B0      : out std_logic;
				Sel_Mem_B1      : out std_logic;

		      Addr_R_Op 		 : out std_logic_vector(m downto 0);
			   Addr_WR_AS      : out std_logic_vector(m downto 0);
				Addr_WR_MMM     : out std_logic_vector(m downto 0);
			   sel1 				 : OUT std_logic;
				sel2 				 : OUT std_logic;
				sel3 				 : OUT std_logic;
				
				ADD_SUB	       : OUT std_logic;			
				
				MMM_Status      : out std_logic;
				AS_Status       : out std_logic;
				
				etat1			  	 : out std_logic;
				etat2				 : out std_logic;
				etat3 			 : out std_logic;
				etat4 			 : out std_logic;
				etat5 			 : out std_logic;
				
				Init_MMM 		 : out std_logic;
				Init_AS 			 : out std_logic
        );
				
end component;

component aig_addr_din 
 generic ( N    :integer:=32 ;
           m	 :integer:=5); 
			  
  port   ( Clk  	      : in  std_logic;
			  Din       	: in  std_logic_vector(N-1 downto 0); -- données en entrées
           T       	   : in  std_logic_vector(N-1 downto 0);
			  AS				: in  std_logic_vector(N-1 downto 0);	
			  AS1				: in  std_logic_vector(N-1 downto 0);			  
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
end component;

component stockage_unite 
    generic (m          : integer:=5 ;-- change with the data size           
             N          : integer:=32 ); -- fixe
				 
    port    (clk        :in std_logic; 
    
				 A0         :in std_logic_vector(N-1 downto 0);
	          A1         :in std_logic_vector(N-1 downto 0);
	          A00        :in std_logic_vector(N-1 downto 0);	
             B00        :in std_logic_vector(N-1 downto 0);	
	          A11        :in std_logic_vector(N-1 downto 0);	
             B11        :in std_logic_vector(N-1 downto 0);
	          B0         :in std_logic_vector(N-1 downto 0);	
             B1         :in std_logic_vector(N-1 downto 0);					 
				 M_in       :in std_logic_vector(N-1 downto 0);           			 			 	 			 
				 
				 addr_A0    :in std_logic_vector(m downto 0);
				 addr_A1    :in std_logic_vector(m downto 0);
	          addr_A00   :in std_logic_vector(m downto 0);
				 addr_B00   :in std_logic_vector(m downto 0);
				 addr_A11   :in std_logic_vector(m downto 0);	
             addr_B11   :in std_logic_vector(m downto 0);
	          addr_B0    :in std_logic_vector(m downto 0);	
             addr_B1    :in std_logic_vector(m downto 0);
				 addr_M     :in std_logic_vector(m downto 0);
				 
             wr_en_A0   :in std_logic;
				 wr_en_A1   :in std_logic;	
             wr_en_A00  :in std_logic;
				 wr_en_B00  :in std_logic;	
				 wr_en_A11  :in std_logic;	
             wr_en_B11  :in std_logic;
	          wr_en_B0   :in std_logic;	
             wr_en_B1   :in std_logic;	
   			 wr_en_m    :in std_logic;				
				
				 En_A0      :in std_logic;
				 En_A1      :in std_logic;
				 En_A00     :in std_logic;
				 En_B00     :in std_logic;
	          En_A11     :in std_logic;	
             En_B11     :in std_logic;
	          En_B0      :in std_logic;	
             En_B1      :in std_logic;
				 En_M       :in std_logic;

	          Out_A0     :out std_logic_vector(N-1 downto 0);
	          Out_A1     :out std_logic_vector(N-1 downto 0);	
	          Out_A00    :out std_logic_vector(N-1 downto 0);
	          Out_B00    :out std_logic_vector(N-1 downto 0);
	          Out_A11    :out std_logic_vector(N-1 downto 0);
	          Out_B11    :out std_logic_vector(N-1 downto 0);	
	          Out_B0     :out std_logic_vector(N-1 downto 0);
	          Out_B1     :out std_logic_vector(N-1 downto 0);				 
	          Out_M      :out std_logic_vector(N-1 downto 0)
				 );
end component;


component montgomery_multiplication
    generic ( 
	          m: integer:=5 ;
             N: integer:=32 ;				 
             e: integer:=32 ); 
	 port(
				run_mmm        : IN STD_LOGIC;
            control_carry  : IN STD_LOGIC;
            control_carry2 : IN STD_LOGIC;
            ce_qi 			: IN STD_LOGIC;
            sel_Z0   		: IN STD_LOGIC;  
            wr_en_fifo    	: IN std_logic;
            A					: IN std_logic_vector(N-1 downto 0);
            B					: IN std_logic_vector(N-1 downto 0);
            M1 				: IN std_logic_vector(N-1 downto 0);
            Mc 				: IN std_logic_vector(N-1 downto 0);
	         CLK            : IN STD_LOGIC;

            T      			: out std_logic_vector(N-1 downto 0)
		  );			
end component;


component AddSub_Mod  
       generic (m : integer:=2 ;			 
					 N : integer:=32 ;
					 e : integer:=5 	); 
		 PORT(
					op_in 			: IN std_logic;
					CLK 				: IN std_logic;
					A					: IN std_logic_vector(N-1 downto 0);
					B					: IN std_logic_vector(N-1 downto 0);
					M1 				: IN std_logic_vector(N-1 downto 0);
					ADD_SUB 			: IN std_logic;       	
					sel1 				: in std_logic;
					sel2 				: in std_logic;
					sel3 				: in std_logic;     

					AS_out 			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)

					);
end component;


signal N1_D                        : std_logic_vector(0 to N-1);
signal N2_D                        : std_logic_vector(0 to N-1); 
 
signal N_addr_AM_R                  : std_logic_vector(m downto 0);  
signal N_addr_BM_R                  : std_logic_vector(m downto 0);  

signal N_addr_R_M                  : std_logic_vector(m downto 0);

signal N1_En_M, N1_En_A0, N1_En_B0,N1_En_A1, N1_En_B1 : std_logic;

signal N2_En_M : std_logic;

signal N2_En_A0, N2_En_A1, N2_En_A00, N2_En_B00 : std_logic;
signal N2_En_A11, N2_En_B11, N2_En_B0, N2_En_B1 : std_logic;  
 
signal W_En_A0, W_En_A1, W_En_A00, W_En_B00 : std_logic;
signal W_En_A11, W_En_B11, W_En_B0, W_En_B1 : std_logic;

    
signal N_sel_Reg_Nc                :  std_logic;  
signal Net_DA0, Net_DA00, Net_DA1, Net_DA11 :  std_logic_vector(N-1 downto 0);  
signal Net_DB0, Net_DB00, Net_DB1, Net_DB11 :  std_logic_vector(N-1 downto 0);
signal N_Mc :  std_logic_vector(N-1 downto 0);



signal Net_M   :  std_logic_vector(N-1 downto 0);
signal Net_addr_w_m :  std_logic_vector(m downto 0);
signal Net_addr_w_ab :  std_logic_vector(m downto 0);
signal Net_addr_A0 :  std_logic_vector(m downto 0);
signal Net_addr_A1 :  std_logic_vector(m downto 0);
signal Net_addr_B0 :  std_logic_vector(m downto 0);
signal Net_addr_B1 :  std_logic_vector(m downto 0);
signal Net_addr_A00 :  std_logic_vector(m downto 0);
signal Net_addr_A11 :  std_logic_vector(m downto 0);
signal Net_addr_B00 :  std_logic_vector(m downto 0);
signal Net_addr_B11 :  std_logic_vector(m downto 0);
signal N_Addr_WR_AS, N_Addr_WR_MMM :  std_logic_vector(m downto 0); 


signal Net_addr_M       : std_logic_vector(m downto 0);
SIGNAL N_control_carry  : std_logic;
SIGNAL N_control_carry2 : std_logic;
SIGNAL N_ce_qi,N_sel_Z0 : std_logic;
SIGNAL N_wr_en_fifo     : std_logic;

SIGNAL N_A0, N_A1, N_A00, N_B00, N_M : std_logic_vector(N-1 downto 0);
SIGNAL N_B0, N_B1, N_A11, N_B11 : std_logic_vector(N-1 downto 0);
SIGNAL N_MMM_A, N_MMM_B	:std_logic_vector(N-1 downto 0);
SIGNAL N_AS_A, N_AS_B :std_logic_vector(N-1 downto 0);
SIGNAL N_T, N_T1 : std_logic_vector(N-1 downto 0);
signal N_AS, N_AS1 :  std_logic_vector(N-1 downto 0);


SIGNAL N_sel1, N_sel2,N_sel3 :std_logic ;


signal N_Addr_R_Op 	:  std_logic_vector(m downto 0);


signal N_etat1, N_etat2, N_etat3, N_etat4, N_etat5 : std_logic;
signal N_Init_MMM, N_Init_AS 		: std_logic;
signal N_MMM_Status, N_AS_Status : std_logic;
signal N_ADD_SUB 						: std_logic;




begin

process (Clk,RESET_IP)
begin
   if RESET_IP = '1' then 
	N1_D<=( oTHERS => '0');
	elsif Clk'event and Clk='1' then  
         N1_D <= Din;
   end if;
end process;

process (Clk,RESET_IP)
begin
  if RESET_IP = '1' then 
	N2_D<=( oTHERS => '0');
	elsif Clk'event and Clk='1' then  
         N2_D <= N1_D;
   end if;
end process;

U1: control_MMM
             generic map(m,N,e)  
                     port map( 
							            RESET_IP     =>  RESET_IP,							
                                 Load_Cts     =>  Load_Cts,
											Load_A_B     =>  Load_A_B,											
							            clk          =>  clk,
											Wr_ack       =>  Wr_ack,

										   op_in        =>  run_mmm,

                                 Addr_W_M     =>  Net_addr_w_m,
											Addr_W_AB    =>  Net_addr_w_ab,										

                                 Addr_R_AM    =>  N_addr_AM_R,
                                 Addr_R_BM    =>  N_addr_BM_R,
											Addr_R_M     =>  N_addr_R_M,

                                 En_qi        =>  N_ce_qi,
											sel_Z0       =>  N_sel_Z0, 
                                 Reset_cy12   =>  N_control_carry,
				                     Reset_cy34   =>  N_control_carry2,
                                 wr_en_fifo   =>  N_wr_en_fifo, 

                                 sel_Reg_Nc   =>  N_sel_Reg_Nc,
											Sel_Mem_M    =>  N1_En_M,
											Sel_Mem_A0   =>  N1_En_A0,  
				                     Sel_Mem_A1   =>  N1_En_A1,
                                 Sel_Mem_B0   =>  N1_En_B0,
											Sel_Mem_B1   =>  N1_En_B1,                       
                                 Addr_R_Op 	 =>  N_Addr_R_Op, 

			                        Addr_WR_AS   => N_Addr_WR_AS,
											Addr_WR_MMM  => N_Addr_WR_MMM ,
											
											sel1 			 =>  N_sel1, 
			                        sel2 			 =>  N_sel2, 	
											sel3 			 =>  N_sel3,
											ADD_SUB	    =>  N_ADD_SUB,	
											
											MMM_Status   =>  N_MMM_Status,
											AS_Status  	 =>  N_AS_Status,
											
											etat1 		 =>  N_etat1,
											etat2 		 =>  N_etat2,
											etat3 		 =>  N_etat3,
											etat4 		 =>  N_etat4,
											etat5 		 =>  N_etat5,
											
 										   Init_MMM		 =>  N_Init_MMM,
											Init_AS 		 =>  N_Init_AS
);


U2: aig_addr_din 
   generic map (N,m)
   port map (Clk  		 => clk,     
             run_mmm     => run_mmm, 				 				 
			    Din         => N2_D,  
			    T           => N_T,
				 AS	 		 => N_AS,
				 AS1			 => N_AS1,		 
	
             addr_w_ab   => Net_addr_w_ab,
				 addr_w_m    => Net_addr_w_m,
	
			    Addr_R_Op   => N_Addr_R_Op,
			    addr_AM_R   => N_addr_AM_R,
			    addr_BM_R   => N_addr_BM_R, 
             addr_R_M    => N_addr_R_M, 
				 
				 Addr_WR_MMM => N_Addr_WR_MMM,
				 Addr_WR_AS  => N_Addr_WR_AS,				 	
				 
             Sel_Mem_A0 =>  N1_En_A0,
				 Sel_Mem_B0 =>  N1_En_B0,
			  
				 etat2		=>  N_etat2,
				 etat3 		=>  N_etat3,
				 etat4 		=>  N_etat4,
				 
			    Init_MMM 	=> N_Init_MMM,
			    Init_AS 	=> N_Init_AS,

             MMM_status =>  N_MMM_status,
				 AS_Status  =>  N_AS_Status,
			  

  			    D_A0       => Net_DA0,    
             D_A1       => Net_DA1, 
				 D_A00      => Net_DA00,				 
  			    D_B00      => Net_DB00,
				 D_A11      => Net_DA11,				 
  			    D_B11      => Net_DB11,
				 D_B0       => Net_DB0, 
             D_B1       => Net_DB1,   
			    D_M        => Net_M,
				 
			    addr_A0  	=> Net_addr_A0,   
			    addr_A1  	=> Net_addr_A1,   
			    addr_B0  	=> Net_addr_B0,    
			    addr_B1  	=> Net_addr_B1,    
			    addr_A00 	=> Net_addr_A00,     
			    addr_A11 	=> Net_addr_A11,     
			    addr_B00 	=> Net_addr_B00,    
			    addr_B11 	=> Net_addr_B11,     
			    addr_M     => Net_addr_M			  
);


N2_En_M    <= N1_En_M  or run_mmm;

N2_En_A0   <= N1_En_A0 or N_Init_AS or N_etat3 or N_etat4; 
W_En_A0    <= N1_En_A0 or N_AS_Status or (N_etat3 and N_MMM_Status);

N2_En_A1   <= N1_En_A1 or N_Init_AS;
W_En_A1    <= N1_En_A1 ;

N2_En_A00  <= N1_En_A0 or N_Init_MMM or N_etat4;
W_En_A00   <= (N1_En_A0 or N_MMM_Status) and (not N_etat3);

N2_En_B00  <= N1_En_B0 or N_Init_MMM;
W_En_B00   <= N1_En_B0 ;


N2_En_A11  <= N1_En_A1 or N_Init_MMM;
W_En_A11   <= N1_En_A1;

N2_En_B11  <= N1_En_B1 or N_Init_MMM;
W_En_B11   <= N1_En_B1;

N2_En_B0   <= N1_En_B0 or N_etat2 or N_etat3;
W_En_B0    <= N1_En_B0 or (N_AS_Status and N_etat2);

N2_En_B1   <= N1_En_B1 or N_Init_AS;
W_En_B1    <= N1_En_B1;



U3: stockage_unite 
    generic map(m, N)
    port   map (
				 clk  =>  clk,
	          
				 A0 	=>  Net_DA0,     	
             A1 	=>  Net_DA1,	 
	          A00 	=>  Net_DA00,  	
             B00 	=>  Net_DB00,  
				 A11 	=>  Net_DA11,    	
             B11 	=>  Net_DB11,	 
	          B0 	=>  Net_DB0,  	
             B1 	=>  Net_DB1,  				 
				 M_in =>  Net_M,
				 
				 addr_A0 	=> Net_addr_A0,
				 addr_A1 	=> Net_addr_A1,
	          addr_A00 	=> Net_addr_A00,
				 addr_B00 	=> Net_addr_B00,
				 addr_A11 	=> Net_addr_A11,     	
             addr_B11 	=> Net_addr_B11,	 
	          addr_B0 	=> Net_addr_B0,  	
             addr_B1 	=> Net_addr_B1,				 
				 addr_M 		=> Net_addr_M,
				 
   			 wr_en_A0   => W_En_A0,   
				 wr_en_A1   => W_En_A1,  
             wr_en_A00  => W_En_A00,   
				 wr_en_B00  => W_En_B00,
				 wr_en_A11 	=> W_En_A11,     	
             wr_en_B11 	=> W_En_B11,	 
	          wr_en_B0 	=> W_En_B0,  	
             wr_en_B1 	=> W_En_B1,				 
				 wr_en_m    => N1_En_M,				 

				 En_A0   => N2_En_A0,    
				 En_A1   => N2_En_A1,
				 En_A00  => N2_En_A00,    
				 En_B00  => N2_En_B00,
				 En_A11 	=> N2_En_A11,     	
             En_B11 	=> N2_En_B11,	 
	          En_B0 	=> N2_En_B0,  	
             En_B1 	=> N2_En_B1,
				 En_M    => N2_En_M,    
   
	          Out_A0   => N_A0, 
	          Out_A1   => N_A1,
	          Out_A00  => N_A00, 
	          Out_B00  => N_B00,
				 Out_A11  => N_A11,     	
             Out_B11  => N_B11,	 
	          Out_B0 	 => N_B0,  	
             Out_B1 	 => N_B1,				 
	          Out_M    => N_M
);

process (Clk,N_sel_Reg_Nc)
begin
	   if Clk'event and Clk='1' then  
		  if n_sel_Reg_Nc ='1' then   
			  N_Mc <= N2_D;
        end if;
		end if;
end process;


N_MMM_A <= N_A00 WHEN N_etat3='0'
				ELSE N_A0;
N_MMM_B <= N_B00 WHEN N_etat3='0'
				ELSE N_B0;

U4: montgomery_multiplication 
    generic map ( m, N, e ) 
	 port  map (
				run_mmm 			=> N_Init_MMM,
            control_carry 	=> N_control_carry, 
            control_carry2 => N_control_carry2,
            ce_qi 			=> N_ce_qi,
            sel_Z0  			=> N_sel_Z0,  
            wr_en_fifo 		=> N_wr_en_fifo,

            A		=> N_MMM_A, --
            B 		=> N_MMM_B, -- N_B00,
            M1 	=> N_M,
            Mc 	=> N_Mc,
	         CLK 	=> clk,
            T 		=> N_T
);
			
N_AS_A <= N_A0 WHEN N_etat4='0'
		ELSE N_A00;

N_AS_B <= N_A1 WHEN N_etat4='0'
				ELSE N_A0;

			
U5: AddSub_Mod 
       generic map (m, N, e)  
       PORT MAP(
				op_in		=> N_Init_AS,
				CLK 		=> clk,
				A			=>	N_AS_A, --N_A0,
				B			=>	N_AS_B, --N_A1,
				M1 		=>	N_M,
				ADD_SUB 	=> N_ADD_SUB, ---  add=1 sous=0
				sel1 		=> N_sel1,
				sel2 		=> N_sel2,
				sel3 		=> N_sel3,     
				
				AS_out 	=> N_AS
);


U6: montgomery_multiplication 
    generic map ( m, N, e ) 
	 port  map (
				run_mmm 			=> N_Init_MMM,
            control_carry 	=> N_control_carry, 
            control_carry2 => N_control_carry2,
            ce_qi 			=> N_ce_qi,
            sel_Z0  			=> N_sel_Z0,  
            wr_en_fifo 		=> N_wr_en_fifo,

            A 		=> N_A11, 
            B 		=> N_B11,
            M1 	=> N_M,
            Mc 	=> N_Mc,
	         CLK 	=> clk,
            T 		=> N_T1
);

U7: AddSub_Mod 
       generic map (m, N, e)  
       PORT MAP(
				op_in		=> N_Init_AS,
				CLK 		=> clk,
				A			=>	N_B0,
				B			=>	N_B1,
				M1 		=>	N_M,
				ADD_SUB 	=> N_ADD_SUB, ---  add=1 sous=0
				sel1 		=> N_sel1,
				sel2 		=> N_sel2,
				sel3 		=> N_sel3,     
				
				AS_out 	=> N_AS1
);

end Behavioral;

