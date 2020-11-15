library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity stockage_unite is

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
end stockage_unite;

architecture Behavioral of stockage_unite is

component single_port_m
       port (           
			    addra      : IN std_logic_VECTOR(m downto 0);
             clka       : IN std_logic;
             dina       : IN std_logic_VECTOR(N-1 downto 0);
             douta      : OUT std_logic_VECTOR(N-1 downto 0);
             ena        : IN std_logic;
				 wea        : IN std_logic_VECTOR(0 downto 0));
end component;


begin

---- mémoire A0
U1: single_port_m port map(addra => addr_A0,
                           clka  => clk,
                           dina  => A0,
                           douta => Out_A0,
									ena   => En_A0,
                           wea(0)   => wr_en_A0
								  );

U2: single_port_m port map(addra => addr_A1,
                           clka  => clk,
                           dina  => A1,
                           douta => Out_A1,
									ena   => En_A1,
                           wea(0)   => wr_en_A1
								  );

U3: single_port_m port map(addra => addr_A00,
                           clka  => clk,
                           dina  => A00,
                           douta => Out_A00,
									ena   => En_A00,
                           wea(0)   => wr_en_A00
								   );
								
U4: single_port_m port map(addra => addr_B00,
                           clka  => clk,
                           dina  => B00,
                           douta => Out_B00,
									ena   => En_B00,
                           wea(0)   => wr_en_B00
								   );
--------------------------------------------------------------									
U5:  single_port_m port map (addra => addr_M,
                             clka  => clk,
									  dina  => M_in,
                             douta => Out_M,
									  ena   => En_M,
									  wea(0)   => wr_en_m
				                 );
--------------------------------------------------------------
U6: single_port_m port map(addra => addr_A11,
                           clka  => clk,
                           dina  => A11,
                           douta => Out_A11,
									ena   => En_A11,
                           wea(0)   => wr_en_A11
								  );

U7: single_port_m port map(addra => addr_B11,
                           clka  => clk,
                           dina  => B11,
                           douta => Out_B11,
									ena   => En_B11,
                           wea(0)   => wr_en_B11
								  );

U8: single_port_m port map(addra => addr_B0,
                           clka  => clk,
                           dina  => B0,
                           douta => Out_B0,
									ena   => En_B0,
                           wea(0)   => wr_en_B0
								   );
								
U9: single_port_m port map(addra => addr_B1,
                           clka  => clk,
                           dina  => B1,
                           douta => Out_B1,
									ena   => En_B1,
                           wea(0)   => wr_en_B1
								   );
					

					
end Behavioral;
