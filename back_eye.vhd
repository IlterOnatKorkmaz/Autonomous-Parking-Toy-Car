library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity back_eye is
Port ( CLK2 : in STD_LOGIC;
TRIGGER2 : out STD_LOGIC;
EYESAW2: OUT STD_LOGIC;

ECHO2 : in STD_LOGIC
);

end back_eye;
architecture Behavioral of back_eye is

signal counter : unsigned(16 downto 0) := (others => '0');
signal distance : integer := 0;
signal delay3 : std_logic := '0';
signal delay2: std_logic := '0';
signal delay1 : std_logic := '0';
signal waitt : std_logic := '0';
begin
process(CLK2)
begin
if rising_edge(CLK2) then
if waitt = '0' then
if counter = 1000 then -- 10 microseconds pulse is created 
TRIGGER2 <= '0';
waitt <= '1';
counter <= (others => '0');
else
TRIGGER2 <= '1';
counter <= counter+1;
end if;
elsif delay3 = '0' and delay2 = '1' then
counter <= (others => '0');
distance <= 0;
elsif delay3 = '1' and delay2 = '0' then
if (distance >= 1 and distance <= 10 )
   then
EYESAW2 <='1';
else
EYESAW2 <='0';
end if;
elsif counter = 5799 then -- 5799 clock cycles are equivalent to 1 CM
distance <= distance + 1; -- the distance is increased every 5799 clock cycles
counter <= (others => '0');
if distance = 0532 then --532 is the total range of the system, ?f the distance reaches this boundary then the system doesn't continue calculating.
waitt <= '0';
end if;
else
counter <= counter + 1;
end if;
delay3 <= delay2;
delay2 <= delay1;
delay1 <= ECHO2;
end if;
end process;
end Behavioral;