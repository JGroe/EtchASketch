--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:16:33 11/20/2013
-- Design Name:   
-- Module Name:   C:/Users/Edward/Documents/Bradley University/ECE102/EtchASketch/CoordinateAddresser_tb.vhd
-- Project Name:  EtchASketch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CoordinateAddresser
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CoordinateAddresser_tb IS
END CoordinateAddresser_tb;
 
ARCHITECTURE behavior OF CoordinateAddresser_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CoordinateAddresser
    PORT(
         X : IN  std_logic_vector(8 downto 0);
         Y : IN  std_logic_vector(8 downto 0);
         Addr : OUT  std_logic_vector(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(8 downto 0) := (others => '0');
   signal Y : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal Addr : std_logic_vector(16 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CoordinateAddresser PORT MAP (
          X => X,
          Y => Y,
          Addr => Addr
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		X<="000111000";
		Y<="111000111";
		
		wait for 100 ns;
		
		X<="111000111";
		Y<="000111000";
		
      wait;
   end process;

END;
