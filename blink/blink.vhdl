-- Yosys GHDL Plugin Examples
-- Copyright (C) 2013 GHDL Authors

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

architecture blink of leds is
    signal clk_4hz: std_logic;
  begin
    process (clk)
      --  3_000_000 is 0x2dc6c0
      variable counter : unsigned (23 downto 0);
    begin
      if rising_edge(clk) then
        if counter = 2_999_999 then
          counter := x"000000";
          clk_4hz <= not clk_4hz;
        else
          counter := counter + 1;
        end if;
      end if;
    end process;
  
    led1 <= clk_4hz;
    led2 <= clk_4hz;
    led3 <= clk_4hz;
    led4 <= clk_4hz;
    led5 <= clk_4hz;
  end blink;