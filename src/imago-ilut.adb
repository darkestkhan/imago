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
package body Imago.ILUT is

  --------------------------------------------------------------------------

                            -------------------
                            -- R E N A M E S --
                            -------------------

  ---------------------------------------------------------------------------

  package IC renames Interfaces.C;
  package CStrings renames Interfaces.C.Strings;

  --------------------------------------------------------------------------

                      ---------------------------------
                      -- I N S T A N T I A T I O N S --
                      ---------------------------------

  --------------------------------------------------------------------------

  procedure Free is new
    Ada.Unchecked_Deallocation (IC.char_array, CStrings.char_array_access);

  ---------------------------------------------------------------------------

                  -------------------------------------------
                  -- S U B P R O G R A M ' S   B O D I E S --
                  -------------------------------------------

  ---------------------------------------------------------------------------

  function Get_String (String_Name: in IL.Enum) return String
  is
    function ilutGetString (String_Name: in IL.Enum) return CStrings.chars_ptr
      with Import => True, Convention => StdCall,
           External_Name => "ilutGetString";
  begin
    return IC.To_Ada (CStrings.Value (ilutGetString (String_Name)));
  end Get_String;

  ---------------------------------------------------------------------------

  function GL_Load_Image (File_Name: in String) return GL.UInt
  is
    function ilutGLLoadImage (F: in CStrings.chars_ptr) return GL.UInt
      with Import => True, Convention => StdCall,
           External_Name => "ilutGLLoadImage";

    Value: GL.UInt;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Value := ilutGLLoadImage (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Value;
  end GL_Load_Image;

  ---------------------------------------------------------------------------

  function GL_Save_Image
    ( File_Name: in String; Tex_ID: in GL.UInt
    ) return IL.Bool
  is
    function ilutGLSaveImage
      ( F: in CStrings.chars_ptr; Tex_ID: in GL.UInt
      ) return IL.Bool
      with Import => True, Convention => StdCall,
           External_Name => "ilutGLSaveImage";

    Value: IL.Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Value := ilutGLSaveImage (CStrings.To_Chars_Ptr (CString), Tex_ID);
    Free (CString);
    return Value;
  end GL_Save_Image;

  ---------------------------------------------------------------------------

end Imago.ILUT;
