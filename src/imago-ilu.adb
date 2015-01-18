pragma License (Modified_GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: Modified GNU GPLv3 or any later as published by Free Software   --
--  Foundation (GMGPL).                                                      --
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
with Ada.Unchecked_Deallocation;

with Interfaces.C;
with Interfaces.C.Strings;

package body Imago.ILU is

  --------------------------------------------------------------------------

                            -------------------
                            -- R E N A M E S --
                            -------------------

  --------------------------------------------------------------------------

  package IC renames Interfaces.C;
  package CStrings renames Interfaces.C.Strings;

  --------------------------------------------------------------------------

                      ---------------------------------
                      -- I N S T A N T I A T I O N S --
                      ---------------------------------

  --------------------------------------------------------------------------

  procedure Free is new
    Ada.Unchecked_Deallocation (IC.char_array, CStrings.char_array_access);

  --------------------------------------------------------------------------

                  -------------------------------------------
                  -- S U B P R O G R A M S '   B O D I E S --
                  -------------------------------------------

  --------------------------------------------------------------------------

  function Error_String (String_Name: in IL.Enum) return String
  is
    function iluErrorString (String_Name: in IL.Enum) return CStrings.chars_ptr;
    pragma Import (StdCall, iluErrorString, "iluErrorString");
  begin
    return IC.To_Ada (CStrings.Value (iluErrorString (String_Name)));
  end Error_String;

  --------------------------------------------------------------------------

  function Get_Integer (Mode: in IL.Enum) return IL.Int
  is
    function iluGetInteger (Mode: in IL.Enum) return IL.Int;
    pragma Import (StdCall, iluGetInteger, "iluGetInteger");
  begin
    return iluGetInteger (Mode);
  end Get_Integer;

  --------------------------------------------------------------------------

  procedure Get_Integer (Mode: in IL.Enum; Param: in IL.Pointer)
  is
    procedure iluGetIntegerV (Mode: in IL.Enum; Param: in IL.Pointer);
    pragma Import (StdCall, iluGetIntegerV, "iluGetIntegerv");
  begin
    iluGetIntegerV (Mode, Param);
  end Get_Integer;

  --------------------------------------------------------------------------

  function Get_String (String_Name: in IL.Enum) return String
  is
    function iluGetString (String_Name: in IL.Enum) return CStrings.chars_ptr;
    pragma Import (StdCall, iluGetString, "iluGetString");
  begin
    return IC.To_Ada (CStrings.Value (iluGetString (String_Name)));
  end Get_String;

  ------------------------------------------------------------------

  function Load_Image (File_Name: in String) return IL.UInt
  is
    function iluLoadImage (F: in CStrings.chars_ptr) return IL.UInt;
    pragma Import (StdCall, iluLoadImage, "iluLoadImage");

    Value: IL.UInt;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Value := iluLoadImage (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Value;
  end Load_Image;

  ------------------------------------------------------------------

  function Rotate (Angle: in Float) return IL.Bool
  is
    function iluRotate (Angle: in Float) return IL.Bool;
    pragma Import (StdCall, iluRotate, "iluRotate");
  begin
    return iluRotate (Angle);
  end Rotate;

  ------------------------------------------------------------------

  function Rotate
    ( X: in Float; Y: in Float; Z: in Float; Angle: in Float
    ) return IL.Bool
  is
    function iluRotate3D
      ( X: in Float; Y: in Float; Z: in Float; A: in Float
      ) return IL.Bool;
    pragma Import (StdCall, iluRotate3D, "iluRotate3D");
  begin
    return iluRotate3D (X, Y, Z, Angle);
  end Rotate;

  ------------------------------------------------------------------

  function Saturate (Saturation: in Float) return IL.Bool
  is
    function iluSaturate1f (Saturation: in Float) return IL.Bool;
    pragma Import (StdCall, iluSaturate1f, "iluSaturate1f");
  begin
    return iluSaturate1f (Saturation);
  end Saturate;

  ------------------------------------------------------------------

  function Saturate
    ( R: in Float; G: in Float; B: in Float; Saturation: in Float
    ) return IL.Bool
  is
    function iluSaturate4f
      ( R: in Float; G: in Float; B: in Float; S: in Float
      ) return IL.Bool;
    pragma Import (StdCall, iluSaturate4f, "iluSaturate4f");
  begin
    return iluSaturate4f (R, G, B, Saturation);
  end Saturate;

  ------------------------------------------------------------------

end Imago.ILU;
