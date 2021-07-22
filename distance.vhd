library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity distance is
Port ( CLK : in STD_LOGIC;
TRIGGER : out STD_LOGIC;
EYESAW: OUT STD_LOGIC;

ECHO : in STD_LOGIC
);

end distance;
architecture Behavioral of distance is

signal counter : unsigned(16 downto 0) := (others => '0');
signal distance : integer := 0;
signal delay3 : std_logic := '0';
signal delay2: std_logic := '0';
signal delay1 : std_logic := '0';
signal waitt : std_logic := '0';
begin
process(CLK)
begin
if rising_edge(CLK) then
if waitt = '0' then
if counter = 1000 then -- 10 microseconds pulse is created 
TRIGGER <= '0';
waitt <= '1';
counter <= (others => '0');
else
TRIGGER <= '1';
counter <= counter+1;
end if;
elsif delay3 = '0' and delay2 = '1' then
counter <= (others => '0');
distance <= 0;
elsif delay3 = '1' and delay2 = '0' then
if (distance >= 5 and distance <= 20 )
   then
EYESAW <='1';
else
EYESAW <='0';
end if;
elsif counter = 5799 then -- 5799 clock cycles are equivalent to 1 CM
distance <= distance + 1; -- the distance is increased every 5799 clock cycles
counter <= (others => '0');
if distance = 0532 then --3448 is the total range of the system, if the distance reaches this boundary then the system doesn't continue calculating.
waitt <= '0';
end if;
else
counter <= counter + 1;
end if;
delay3 <= delay2;
delay2 <= delay1;
delay1 <= ECHO;
end if;
end process;
end Behavioral;