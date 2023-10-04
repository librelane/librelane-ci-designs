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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--  Led positions
--
--  I         D3
--  r
--  D     D2  D5  D4
--  A
--            D1
--
entity leds is
  port (clk : in std_logic;
        led1, led2, led3, led4, led5 : out std_logic);
end leds;
