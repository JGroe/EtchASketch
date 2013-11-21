--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:05:36 11/20/2013
-- Design Name:   
-- Module Name:   C:/Users/Edward/Documents/Bradley University/ECE102/EtchASketch/ImageMemory_tb.vhd
-- Project Name:  EtchASketch
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ImageMemory
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
 
ENTITY ImageMemory_tb IS
END ImageMemory_tb;
 
ARCHITECTURE behavior OF ImageMemory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ImageMemory
    PORT(
         R_X : IN  std_logic_vector(8 downto 0);
         R_Y : IN  std_logic_vector(8 downto 0);
         R_Clk : IN  std_logic;
         R_Color : OUT  std_logic_vector(2 downto 0);
         W_X : IN  std_logic_vector(8 downto 0);
         W_Y : IN  std_logic_vector(8 downto 0);
         W_Clk : IN  std_logic;
         W_Color : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal R_X : std_logic_vector(8 downto 0) := (others => '0');
   signal R_Y : std_logic_vector(8 downto 0) := (others => '0');
   signal R_Clk : std_logic := '0';
   signal W_X : std_logic_vector(8 downto 0) := (others => '0');
   signal W_Y : std_logic_vector(8 downto 0) := (others => '0');
   signal W_Clk : std_logic := '0';
   signal W_Color : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal R_Color : std_logic_vector(2 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ImageMemory PORT MAP (
          R_X => R_X,
          R_Y => R_Y,
          R_Clk => R_Clk,
          R_Color => R_Color,
          W_X => W_X,
          W_Y => W_Y,
          W_Clk => W_Clk,
          W_Color => W_Color
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		wait for 1 ns;
		R_Clk <= '1';
		wait for 5 ns;
		R_Clk <='0';
		wait for 5 ns; 
		
		R_X <= "000111000";
		R_Y <= "111000111";
		wait for 1 ns;
		R_Clk <= '1';
		wait for 5 ns;
		R_Clk <='0';
		
		
		W_X <= "000111000";
		W_Y <= "111000111";
		W_Color <="010";
		wait for 1 ns;
		W_Clk <= '1';
		wait for 5 ns;
		W_Clk <='0';
		
		wait for 5 ns;

		R_X <= "000111000";
		R_Y <= "111000111";
		wait for 1 ns;
		R_Clk <= '1';
		wait for 5 ns;
		R_Clk <='0';
      -- insert stimulus here 

      wait;
   end process;

END;
