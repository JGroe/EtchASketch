----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:12:37 11/17/2013 
-- Design Name: 
-- Module Name:    CoordinateAddresser - Behavioral 
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
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CoordinateAddresser is
    Port ( X : in  STD_LOGIC_VECTOR (8 downto 0);
           Y : in  STD_LOGIC_VECTOR (8 downto 0);
           Addr : out  STD_LOGIC_VECTOR (16 downto 0));
end CoordinateAddresser;

architecture Behavioral of CoordinateAddresser is
begin

process(X,Y)
Variable iX, iY, iAddr : Integer;
begin
iX := TO_INTEGER(unsigned(X));
iY := TO_INTEGER(unsigned(Y));
iAddr := ((iX * 377) + iY);
Addr <= std_Logic_vector(TO_UNSIGNED(iAddr, 17));
end process;

end Behavioral;

