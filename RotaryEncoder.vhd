----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:15:58 11/19/2013 
-- Design Name: 
-- Module Name:    RotaryEncoder - Behavioral 
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

entity RotaryEncoder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           R_Tick : out  STD_LOGIC;
           L_Tick : out  STD_LOGIC);
end RotaryEncoder;

architecture Behavioral of RotaryEncoder is
signal R_Tick_Temp, L_Tick_Temp : STD_LOGIC := '0';
signal c_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
begin

		R_Tick <= R_Tick_Temp;
		L_Tick <= L_Tick_Temp;

process (A,B)
begin
	case c_state is
		when "00"
			=> if(A' event and A = '1')
				then
					c_state <= "01";
				elsif(B' event and B = '1')
				then
					c_state <= "10";
				end if;
		when "01"
			=> if(A' event and A = '0')
				then
					c_state <= "00";
					R_TICK_TEMP <= '0';
					L_TICK_TEMP <= '0';
				elsif(B' event and B = '1')
				then
					c_state <= "11";
					if(L_TICK_TEMP = '0')
					then
						R_TICK_TEMP <= '1';
					end if;
				end if;
		when "10"
			=> if(A' event and A = '1')
				then
					c_state <= "11";
					if(R_TICK_TEMP = '0')
					then
						L_TICK_TEMP <= '1';
					end if;
				elsif(B' event and B = '0')
				then
					c_state <= "00";
					R_TICK_TEMP <= '0';
					L_TICK_TEMP <= '0';
				end if;
		when "11"
			=> if(A' event and A = '0')
				then
					c_state <= "10";
				elsif(B' event and B = '0')
				then
					c_state <= "01";
				end if;
		when others
			=> c_state <= "00";
				R_TICK_TEMP <= '0';
				L_TICK_TEMP <= '0';
			
	end case;
end process;

--process (c_state)
--begin
--	if(c_state = "00")
--	then
--		L_TICK_TEMP <= '0';
--		R_TICK_TEMP <= '0';
--	end if;
--end process;

end Behavioral;

