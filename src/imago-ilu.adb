------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: ISC                                                             --
--                                                                          --
--                    Copyright © 2015 darkestkhan                          --
------------------------------------------------------------------------------
-- Permission to use, copy, modify, and/or distribute this software for any --
-- purpose with or without fee is hereby granted, provided that the above   --
-- copyright notice and this permission notice appear in all copies.        --
--                                                                          --
-- The software is provided "as is" and the author disclaims all warranties --
-- with regard to this software including all implied warranties of         --
-- merchantability and fitness. In no event shall the author be liable for  --
-- any special, direct, indirect, or consequential damages or any damages   --
-- whatsoever resulting from loss of use, data or profits, whether in an    --
-- action of contract, negligence or other tortious action, arising out of  --
-- or in connection with the use or performance of this software.           --
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
