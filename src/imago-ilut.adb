------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: ISC                                                             --
--                                                                          --
--                    Copyright © 2015 - 2016 darkestkhan                   --
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
with Ada.Characters.Latin_1;

with Interfaces.C;
with Interfaces.C.Strings;
package body Imago.ILUT is

  --------------------------------------------------------------------------

                            -------------------
                            -- R E N A M E S --
                            -------------------

  ---------------------------------------------------------------------------

  package ASCII renames Ada.Characters.Latin_1;
  package IC renames Interfaces.C;
  package CStrings renames Interfaces.C.Strings;

  --------------------------------------------------------------------------

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
    function ilutGLLoadImage (F: in IL.Pointer) return GL.UInt
      with Import => True, Convention => StdCall,
           External_Name => "ilutGLLoadImage";

    CString: constant String := File_Name & ASCII.NUL;
  begin
    return ilutGLLoadImage (CString'Address);
  end GL_Load_Image;

  ---------------------------------------------------------------------------

  function GL_Save_Image
    ( File_Name: in String; Tex_ID: in GL.UInt
    ) return IL.Bool
  is
    function ilutGLSaveImage
      ( F: in IL.Pointer; Tex_ID: in GL.UInt
      ) return IL.Bool
      with Import => True, Convention => StdCall,
           External_Name => "ilutGLSaveImage";

    CString: constant String := File_Name & ASCII.NUL;
  begin
    return ilutGLSaveImage (CString'Address, Tex_ID);
  end GL_Save_Image;

  ---------------------------------------------------------------------------

end Imago.ILUT;
