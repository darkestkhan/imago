pragma License (Modified_GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: Modified GNU GPLv3 or any later as published by Free Software   --
--  Foundation (GMGPL).                                                     --
--                                                                          --
--                    Copyright © 2014 darkestkhan                          --
------------------------------------------------------------------------------
--  This Program is Free Software: You can redistribute it and/or modify    --
--  it under the terms of The GNU General Public License as published by    --
--    the Free Software Foundation: either version 3 of the license, or     --
--                 (at your option) any later version.                      --
--                                                                          --
--      This Program is distributed in the hope that it will be useful,     --
--      but WITHOUT ANY WARRANTY; without even the implied warranty of      --
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the        --
--              GNU General Public License for more details.                --
--                                                                          --
--    You should have received a copy of the GNU General Public License     --
--   along with this program.  If not, see <http://www.gnu.org/licenses/>.  --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
------------------------------------------------------------------------------

  --------------------------------------------------------------------------
  -- This package is based on Lumen.Binary package from Lumen library.    --
  --------------------------------------------------------------------------

package Imago.Binary is

  --------------------------------------------------------------------------

  pragma Pure;

  --------------------------------------------------------------------------

                          -----------------------
                          -- C O N S T A N T S --
                          -----------------------

  --------------------------------------------------------------------------
  -- Basic sizes of fundamental binary data types.
  Byte_Bits : constant := 8;
  Short_Bits: constant := 16;
  Word_Bits : constant := 32;
  Long_Bits : constant := 64;

  --------------------------------------------------------------------------
  -- Derived sizes.
  Short_Bytes: constant := Short_Bits / Byte_Bits;
  Word_Bytes : constant := Word_Bits  / Byte_Bits;
  Long_Bytes : constant := Long_Bits  / Byte_Bits;

  --------------------------------------------------------------------------
  -- "Last-bit" values for use in rep clauses.
  Byte_LB : constant := Byte_Bits  - 1;
  Short_LB: constant := Short_Bits - 1;
  Word_LB : constant := Word_Bits  - 1;
  Long_LB : constant := Long_Bits  - 1;

  --------------------------------------------------------------------------

                              ---------------
                              -- T Y P E S --
                              ---------------

  --------------------------------------------------------------------------
  -- Unsigned types.
  type Byte   is mod 2 ** Byte_Bits;
  type Short  is mod 2 ** Short_Bits;
  type Word   is mod 2 ** Word_Bits;
  type Long   is mod 2 ** Long_Bits;

  for Byte'Size   use Byte_Bits;
  for Short'Size  use Short_Bits;
  for Word'Size   use Word_Bits;
  for Long'Size   use Long_Bits;

  --------------------------------------------------------------------------
  -- Signed types.
  type S_Byte   is new Integer range -(2 ** Byte_LB)  .. (2 ** Byte_LB)  - 1;
  type S_Short  is new Integer range -(2 ** Short_LB) .. (2 ** Short_LB) - 1;
  type S_Word   is new Integer range -(2 ** Word_LB)  .. (2 ** Word_LB)  - 1;
  type S_Long   is new Long_Integer range -(2 ** Long_LB) .. (2 ** Long_LB) - 1;

  for S_Byte'Size   use Byte_Bits;
  for S_Short'Size  use Short_Bits;
  for S_Word'Size   use Word_Bits;
  for S_Long'Size   use Long_Bits;

  --------------------------------------------------------------------------
  -- Array types.
  type Byte_Array     is array (Natural range <>) of Byte;
  type Short_Array    is array (Natural range <>) of Short;
  type Word_Array     is array (Natural range <>) of Word;
  type Long_Array     is array (Natural range <>) of Long;

  type S_Byte_Array   is array (Natural range <>) of S_Byte;
  type S_Short_Array  is array (Natural range <>) of S_Short;
  type S_Word_Array   is array (Natural range <>) of S_Word;
  type S_Long_Array   is array (Natural range <>) of S_Long;

  ---------------------------------------------------------------------------

end Imago.Binary;
