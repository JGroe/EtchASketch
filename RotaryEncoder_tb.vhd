--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:53:36 11/20/2013
-- Design Name:   
-- Module Name:   C:/Users/Edward/Documents/Bradley University/ECE102/EtchASketch/RotaryEncoder_tb.vhd
-- Project Name:  EtchASketch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RotaryEncoder
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
 
ENTITY RotaryEncoder_tb IS
END RotaryEncoder_tb;
 
ARCHITECTURE behavior OF RotaryEncoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RotaryEncoder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         R_Tick : OUT  std_logic;
         L_Tick : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal R_Tick : std_logic;
   signal L_Tick : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RotaryEncoder PORT MAP (
          A => A,
          B => B,
          R_Tick => R_Tick,
          L_Tick => L_Tick
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		wait for 5 ns;
		A<='1';
		wait for 5 ns;
		B<='1';
		wait for 5 ns;
		A<='0';
		wait for 5 ns;
		B<='0';
		
		
      wait for 25 ns;	

		wait for 5 ns;
		B<='1';
		wait for 5 ns;
		A<='1';
		wait for 5 ns;
		B<='0';
		wait for 5 ns;
		A<='0';
		
		
		
      wait for 25 ns;	

		wait for 5 ns;
		B<='1';
		A<='1';
		wait for 5 ns;
		B<='0';
		wait for 5 ns;
		A<='0';
		
		
		
		
		
      wait for 25 ns;	

		A<='1';
		wait for 5 ns;
		A<='0';
		wait for 5 ns;
		B<='1';
		wait for 5 ns;
		A<='1';
		wait for 5 ns;
		A<='0';
		wait for 5 ns;
		A<='1';
		wait for 5 ns;
		B<='0';
		wait for 5 ns;
		A<='0';
		
		
		
      wait for 25 ns;	

		wait for 5 ns;
		B<='1';
		wait for 5 ns;
		B<='0';
		A<='1';
		wait for 5 ns;
		B<='0';
		wait for 5 ns;
		A<='0';
		
		
		
		
      wait for 500 ns;
   end process;

END;
