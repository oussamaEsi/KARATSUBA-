--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : sch2vhdl
--  /   /         Filename : add_sous_cell.vhf
-- /___/   /\     Timestamp : 10/09/2011 11:34:48
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx91i\bin\nt\sch2vhdl.exe -intstyle ise -family virtex2 -flat -suppress -w D:/my_project_FPGA_EDK/modular_add_sous/ise_project/add_sub_modulaire/add_sous_mod/add_sous_cell.sch add_sous_cell.vhf
--Design Name: add_sous_cell
--Device: virtex2
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity add_sous_cell is
   port ( ADD_SUB : in    std_logic; 
          a0      : in    std_logic; 
          a1      : in    std_logic; 
          b0      : in    std_logic; 
          b1      : in    std_logic; 
          ci      : in    std_logic; 
          clk     : in    std_logic; 
          GRS     : in    std_logic; 
          co      : out   std_logic; 
          s0      : out   std_logic; 
          s1      : out   std_logic);
end add_sous_cell;

architecture BEHAVIORAL of add_sous_cell is
   attribute BOX_TYPE   : string ;
   attribute INIT       : string ;
   signal c       : std_logic;
   signal I0      : std_logic;
   signal I1      : std_logic;
   signal SUB0    : std_logic;
   signal XLXN_44 : std_logic;
   signal XLXN_46 : std_logic;
   signal XLXN_52 : std_logic;
   signal XLXN_56 : std_logic;
   component XOR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR3 : component is "BLACK_BOX";
   
   component XORCY
      port ( CI : in    std_logic; 
             LI : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XORCY : component is "BLACK_BOX";
   
   component MUXCY_L
      port ( CI : in    std_logic; 
             DI : in    std_logic; 
             S  : in    std_logic; 
             LO : out   std_logic);
   end component;
   attribute BOX_TYPE of MUXCY_L : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component FDC
      -- synopsys translate_off
      generic( INIT : bit :=  '0');
      -- synopsys translate_on
      port ( C   : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute INIT of FDC : component is "0";
   attribute BOX_TYPE of FDC : component is "BLACK_BOX";
   
begin
   I_36_50 : XOR3
      port map (I0=>a0,
                I1=>b0,
                I2=>SUB0,
                O=>I0);
   
   I_36_73 : XORCY
      port map (CI=>ci,
                LI=>I0,
                O=>XLXN_44);
   
   I_36_111 : MUXCY_L
      port map (CI=>ci,
                DI=>a0,
                S=>I0,
                LO=>c);
   
   I_36_112 : INV
      port map (I=>ADD_SUB,
                O=>SUB0);
   
   XLXI_26 : MUXCY_L
      port map (CI=>c,
                DI=>a1,
                S=>I1,
                LO=>co);
   
   XLXI_27 : XOR3
      port map (I0=>a1,
                I1=>b1,
                I2=>XLXN_46,
                O=>I1);
   
   XLXI_28 : XORCY
      port map (CI=>c,
                LI=>I1,
                O=>XLXN_52);
   
   XLXI_29 : INV
      port map (I=>ADD_SUB,
                O=>XLXN_46);
   
   XLXI_35 : INV
      port map (I=>GRS,
                O=>XLXN_56);
   
   XLXI_37 : FDC
      port map (C=>clk,
                CLR=>XLXN_56,
                D=>XLXN_44,
                Q=>s0);
   
   XLXI_38 : FDC
      port map (C=>clk,
                CLR=>XLXN_56,
                D=>XLXN_52,
                Q=>s1);
   
end BEHAVIORAL;


