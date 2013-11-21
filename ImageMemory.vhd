----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:21 11/17/2013 
-- Design Name: 
-- Module Name:    ImageMemory - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ImageMemory is
    Port ( R_X : in  STD_LOGIC_VECTOR (8 downto 0);
           R_Y : in  STD_LOGIC_VECTOR (8 downto 0);
           R_Clk : in  STD_LOGIC;
           R_Color : out  STD_LOGIC_VECTOR (2 downto 0);
           W_X : in  STD_LOGIC_VECTOR (8 downto 0);
           W_Y : in  STD_LOGIC_VECTOR (8 downto 0);
           W_Clk : in  STD_LOGIC;
           W_Color : in  STD_LOGIC_VECTOR (2 downto 0));
end ImageMemory;

architecture Behavioral of ImageMemory is

COMPONENT MemoryBlock
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END COMPONENT;
COMPONENT CoordinateAddresser
  PORT(
			  X : in  STD_LOGIC_VECTOR (8 downto 0);
           Y : in  STD_LOGIC_VECTOR (8 downto 0);
           Addr : out  STD_LOGIC_VECTOR (16 downto 0));
END COMPONENT;
Signal R_Addr, W_Addr : STD_LOGIC_VECTOR(16 downto 0);
begin

	RCA: CoordinateAddresser port map(R_X, R_Y, R_Addr);
	WCA: CoordinateAddresser port map(W_X, W_Y, W_Addr);
	MemBlock: MemoryBlock    port map(W_Clk, "1", W_Addr, W_Color, R_Clk, R_Addr, R_Color); 

end Behavioral;

