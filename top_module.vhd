

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
port ( CLK : in STD_LOGIC;

TRIGGER : out STD_LOGIC;
EYESAW: inout STD_LOGIC := '1';
ECHO : in STD_LOGIC;
TRIGGER2 : out STD_LOGIC;
EYESAW2: inout STD_LOGIC := '1';
ECHO2 : in STD_LOGIC;
outt : out STD_LOGIC_VECTOR (1 downto 0):= "00";
outt2 : out STD_LOGIC_VECTOR (1 downto 0) := "00");
end top_module;

architecture Behavioral of top_module is
signal shiftcontrol : integer := 0;
signal internalcontrol : integer := 0;
signal pulse : std_logic :='1';
signal pulse2: std_logic := '1';
signal pulse3: std_logic := '1';
signal pulse4: std_logic := '1';
signal parameter : integer := 820000000;
signal parameter2 : integer := 780000000; 
signal counter : integer := 0;
signal counter2 : integer := 0;
signal counter3 : integer := 0;
signal state : STD_LOGIC_VECTOR(1 downto 0) := "00";
signal nextstate : STD_LOGIC_VECTOR(1 downto 0):= "00";
signal sensor: std_logic;

component distance is
Port ( CLK : in STD_LOGIC;
TRIGGER : out STD_LOGIC;
EYESAW: OUT STD_LOGIC;
ECHO : in STD_LOGIC);
end component;

component back_eye is
Port ( CLK2 : in STD_LOGIC;
TRIGGER2 : out STD_LOGIC;
EYESAW2: OUT STD_LOGIC;
ECHO2 : in STD_LOGIC);
end component;

component motor is
Port ( outt : out STD_LOGIC_VECTOR (1 downto 0):= "00";
    clk : in std_logic;
    outt2 : out STD_LOGIC_VECTOR (1 downto 0)
    );
end component;
begin
g0:  distance port map(CLK => CLK,
                    TRIGGER => TRIGGER,
                    EYESAW => EYESAW,
                    ECHO => ECHO 
                    );
g1: motor port map(outt => outt,
                    clk => CLK,
                    outt2 => outt2);
     
g2: back_eye port map(CLK2 => CLK,
                    TRIGGER2 => TRIGGER2,
                    EYESAW2 => EYESAW2,
                    ECHO2 => ECHO2
                    );
        
process(clk)
begin
if rising_edge(clk) then
if internalcontrol <= 0 then
counter <= counter +1;
end if;
 counter2 <= counter2 +1;
 
if counter2 < 46000 then pulse <= '1' ; elsif counter2 < 60000 then pulse <= '0' ; 
elsif counter2 = 60000 then counter2 <= 0;  pulse <= '0' ; pulse2 <= '0'; pulse3 <= '0'; pulse4 <= '0';
end if;
if counter2 < 49000 then pulse2 <= '1' ; elsif counter2 < 60000 then pulse2 <= '0' ;
end if;

if counter2 < 25000 then pulse3 <= '1' ; elsif counter2 < 60000 then pulse3 <= '0' ;
end if;
if counter2 < 35000 then pulse4 <= '1' ; elsif counter2 < 60000 then pulse4 <= '0' ;
end if;
state <= nextstate;
if state = "00" then
if (EYESAW = '0') then shiftcontrol <= shiftcontrol +1; 
end if;
if (counter > 100000000) and shiftcontrol > 100 then nextstate <= "01"; counter <= 0; shiftcontrol <= 0;

end if;
if counter < 35000000 then outt(0) <= pulse; outt(1) <= '0';
else outt(0) <= pulse; outt(1) <= '0';
end if;
end if;
if state = "01" then  
if (EYESAW = '1') then shiftcontrol <= shiftcontrol +1; 
if (counter > 100000000) and (shiftcontrol > 100) then nextstate <= "10"; counter <= 0; shiftcontrol <= 0;
end if;
end if;
outt(0) <= pulse3; outt(1) <= '0'; -- yava?latma denemesi
end if;
if state = "10" then

if (counter  < 50000000  ) then 
 outt(0) <= pulse ; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1'; 
elsif (counter < 100000000 )  then 
 outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1';
elsif (counter < 150000000 ) then 
 outt(0) <= '0'; outt(1) <= pulse2; outt2(0) <= '1'; outt2(1) <= '0';
elsif (counter < 200000000 ) then 
 outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '1'; outt2(1) <= '0';
 elsif (counter  < 250000000) then 
 outt(0) <= pulse ; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1'; 
elsif (counter < 300000000   )  then 
 outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1';
elsif (counter < 350000000  ) then 
 outt(0) <= '0'; outt(1) <= pulse2; outt2(0) <= '1'; outt2(1) <= '0';
elsif (counter < 400000000  ) then 
 outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '1'; outt2(1) <= '0';
 elsif (counter  < 450000000  ) then 
 outt(0) <= pulse ; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1';
elsif (counter < 500000000  )  then 
 outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1';
elsif (counter < 550000000  ) then 
 outt(0) <= '0'; outt(1) <= pulse2; outt2(0) <= '1'; outt2(1) <= '0';
elsif (counter < 600000000 ) then 
 outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '1'; outt2(1) <= '0';
 elsif (counter  < 650000000 ) then 
 outt(0) <= pulse ; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1'; 
elsif (counter < 700000000 )  then 
 outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1';
elsif (counter < 750000000  ) then 
 outt(0) <= '0'; outt(1) <= pulse2; outt2(0) <= '1'; outt2(1) <= '0'; 

elsif counter >= 750000000 and counter < parameter2 then  outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '1'; 
elsif ( counter >= parameter2 and counter < parameter) then  outt(0) <= '0'; outt(1) <= pulse2 ;outt2(0) <= '0'; outt2(1) <= '0';
elsif (counter > parameter  and EYESAW2 = '0' and counter < 890000000) then outt(0) <= '0'; outt(1) <= pulse4; outt2(0) <= '0'; outt2(1) <= '1';internalcontrol <= 1;

elsif EYESAW2 <= '1' then counter3 <= counter3 +1 ;
if counter3 > 100 then  outt(0) <= '0'; outt(1) <= '0'; outt2(0) <= '0'; outt2(1) <= '0'; counter <= parameter; 
end if;

end if;





end if;

end if; 
end process;                    

end Behavioral;