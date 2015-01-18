pragma License (Modified_GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: Modified GNU GPLv3 or any later as published by Free Software   --
--  Foundation (GMGPL, see COPYING file).                                    --
--                                                                          --
--                    Copyright © 2015 darkestkhan                          --
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

  function Get_Boolean (Mode: in IL.Enum) return IL.Bool
  is
    function ilutGetBoolean (Mode: in IL.Enum) return IL.Bool;
    pragma Import (StdCall, ilutGetBoolean, "ilutGetBoolean");
  begin
    return ilutGetBoolean (Mode);
  end Get_Boolean;

  ---------------------------------------------------------------------------

  procedure Get_Boolean (Mode: in IL.Enum; Param: in IL.Pointer)
  is
    procedure ilutGetBooleanV (Mode: in IL.Enum; Param: in IL.Pointer);
    pragma Import (StdCall, ilutGetBooleanV, "ilutGetBooleanv");
  begin
    ilutGetBooleanV (Mode, Param);
  end Get_Boolean;

  ---------------------------------------------------------------------------

  function Get_Integer (Mode: in IL.Enum) return IL.Int
  is
    function ilutGetInteger (Mode: in IL.Enum) return IL.Int;
    pragma Import (StdCall, ilutGetInteger, "ilutGetInteger");
  begin
    return ilutGetInteger (Mode);
  end Get_Integer;

  ---------------------------------------------------------------------------

  procedure Get_Integer (Mode: in IL.Enum; Param: in IL.Pointer)
  is
    procedure ilutGetIntegerV (Mode: in IL.Enum; Param: in IL.Pointer);
    pragma Import (StdCall, ilutGetIntegerV, "ilutGetIntegerv");
  begin
    ilutGetIntegerV (Mode, Param);
  end Get_Integer;

  ---------------------------------------------------------------------------

  function Get_String (String_Name: in IL.Enum) return String
  is
    function ilutGetString (String_Name: in IL.Enum) return CStrings.chars_ptr;
    pragma Import (StdCall, ilutGetString, "ilutGetString");
  begin
    return IC.To_Ada (CStrings.Value (ilutGetString (String_Name)));
  end Get_String;

  ---------------------------------------------------------------------------

  function GL_Load_Image (File_Name: in String) return GL.UInt
  is
    function ilutGLLoadImage (F: in CStrings.chars_ptr) return GL.UInt;
    pragma Import (StdCall, ilutGLLoadImage, "ilutGLLoadImage");

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
      ) return IL.Bool;
    pragma Import (StdCall, ilutGLSaveImage, "ilutGLSaveImage");

    Value: IL.Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Value := ilutGLSaveImage (CStrings.To_Chars_Ptr (CString), Tex_ID);
    Free (CString);
    return Value;
  end GL_Save_Image;

  ---------------------------------------------------------------------------

  function GL_Sub_Tex
    ( Tex_ID: in GL.UInt; XOff: in IL.UInt; YOff: in IL.UInt
    ) return IL.Bool
  is
    function ilutGLSubTex2D
      ( T: in GL.UInt; X: in IL.UInt; Y: in IL.UInt
      ) return IL.Bool;
    pragma Import (StdCall, ilutGLSubTex2D, "ilutGLSubTex2D");
  begin
    return ilutGLSubTex2D (Tex_ID, XOff, YOff);
  end GL_Sub_Tex;

  ---------------------------------------------------------------------------

  function GL_Sub_Tex
    ( Tex_ID: in GL.UInt; XOff: in IL.UInt;
      YOff: in IL.UInt; ZOff: in IL.UInt
    ) return IL.Bool
  is
    function ilutGLSubTex3D
      ( T: in GL.UInt; X: in IL.UInt; Y: in IL.UInt; Z: in IL.UInt
      ) return IL.Bool;
    pragma Import (StdCall, ilutGLSubTex3D, "ilutGLSubTex3D");
  begin
    return ilutGLSubTex3D (Tex_ID, XOff, YOff, ZOff);
  end GL_Sub_Tex;

  ---------------------------------------------------------------------------

end Imago.ILUT;
