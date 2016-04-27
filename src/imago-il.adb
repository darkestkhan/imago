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
with Ada.Unchecked_Deallocation;

with Interfaces.C;
with Interfaces.C.Strings;

package body Imago.IL is

  --------------------------------------------------------------------------

                            -------------------
                            -- R E N A M E S --
                            -------------------

  --------------------------------------------------------------------------

  package ASCII renames Ada.Characters.Latin_1;
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

  function Apply_Pal (File_Name: in String) return Bool
  is
    function ilApplyPal (FileName: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall, External_Name => "ilApplyPal";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilApplyPal (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Apply_Pal;

  --------------------------------------------------------------------------

  function Apply_Profile
    ( In_Profile: in String; Out_Profile: in String
    ) return Bool
  is
    function ilApplyProfile
      ( InProfile: in CStrings.chars_ptr; OutProfile: in CStrings.chars_ptr
      ) return Bool
      with Import => True, Convention => StdCall,
           External_Name => "ilApplyProfile";

    Success: Bool;

    C_In_Profile: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (In_Profile));
    C_Out_Profile: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Out_Profile));
  begin
    Success := ilApplyProfile
      ( CStrings.To_Chars_Ptr (C_In_Profile),
        CStrings.To_Chars_Ptr (C_Out_Profile)
      );
    Free (C_In_Profile);
    Free (C_Out_Profile);
    return Success;
  end Apply_Profile;

  --------------------------------------------------------------------------

  function Determine_Type (File_Name: in String) return Enum
  is
    function ilDetermineType (FileName: in CStrings.chars_ptr) return Enum
      with Import => True, Convention => StdCall,
           External_Name => "ilDetermineType";

    Value: Enum;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Value := ilDetermineType (IC.Strings.To_Chars_Ptr (CString));
    Free (CString);
    return Value;
  end Determine_Type;

  --------------------------------------------------------------------------

  function Get_String (String_Name: in Enum) return String
  is
    function ilGetString (String_Name: in Enum) return CStrings.chars_ptr
      with Import => True, Convention => StdCall,
           External_Name => "ilGetString";
  begin
    return IC.To_Ada (CStrings.Value (ilGetString (String_Name)));
  end Get_String;

  --------------------------------------------------------------------------

  function Is_Valid (Type_Of: in Enum; File_Name: in String) return Bool
  is
    function ilIsValid (T: in Enum; F: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall, External_Name => "ilIsValid";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilIsValid (Type_Of, CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Is_Valid;

  --------------------------------------------------------------------------

  function Load (Type_Of: in Enum; File_Name: in String) return Bool
  is
    function ilLoad (T: in Enum; F: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall, External_Name => "ilLoad";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilLoad (Type_Of, CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Load;

  --------------------------------------------------------------------------

  function Load_Data
    ( File_Name: in String;
      Width: in UInt; Height: in UInt;
      Depth: in UInt; BPP: in UByte
    ) return Bool
  is
    function ilLoadData
      ( FileName: in CStrings.chars_ptr;
        Width: in UInt; Height: in UInt;
        Depth: in UInt; BPP: in UByte
      ) return Bool
    with Import => True, Convention => StdCall, External_Name => "ilLoadData";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success :=
      ilLoadData (CStrings.To_Chars_Ptr (CString), Width, Height, Depth, BPP);
    Free (CString);
    return Success;
  end Load_Data;

  --------------------------------------------------------------------------

  function Load_Image (File_Name: in String) return Bool
  is
    function ilLoadImage (FileName: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall,
           External_Name => "ilLoadImage";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilLoadImage (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Load_Image;

  --------------------------------------------------------------------------

  function Load_Pal (File_Name: in String) return Bool
  is
    function ilLoadPal (FileName: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall,
           External_Name => "ilLoadImage";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilLoadPal (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Load_Pal;

  --------------------------------------------------------------------------

  function Remove_Load (Ext: in String) return Bool
  is
    function ilRemoveLoad (Ext: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall,
           External_Name => "ilRemoveLoad";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Ext));
  begin
    Success := ilRemoveLoad (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Remove_Load;

  --------------------------------------------------------------------------

  function Remove_Save (Ext: in String) return Bool
  is
    function ilRemoveSave (Ext: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall,
           External_Name => "ilRemoveSave";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (Ext));
  begin
    Success := ilRemoveSave (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Remove_Save;

  --------------------------------------------------------------------------

  function Save (Type_Of: in Enum; File_Name: in String) return Bool
  is
    function ilSave
      ( Type_Of: in Enum; FileName: in CStrings.chars_ptr
      ) return Bool
      with Import => True, Convention => StdCall, External_Name => "ilSave";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilSave (Type_Of, CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Save;

  --------------------------------------------------------------------------

  function Save_Data (File_Name: in String) return Bool
  is
    function ilSaveData (FileName: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall, External_Name => "ilSaveData";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilSaveData (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Save_Data;

  --------------------------------------------------------------------------

  function Save_Image (File_Name: in String) return Bool
  is
    function ilSaveImage (FileName: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall,
           External_Name => "ilSaveImage";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilSaveImage (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Save_Image;

  --------------------------------------------------------------------------

  function Save_Pal (File_Name: in String) return Bool
  is
    function ilSavePal (FileName: in CStrings.chars_ptr) return Bool
      with Import => True, Convention => StdCall, External_Name => "ilSavePal";

    Success: Bool;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Success := ilSavePal (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Success;
  end Save_Pal;

  --------------------------------------------------------------------------

  procedure Set_String (Mode: in Enum; Value: in String)
  is
    procedure ilSetString (Mode : in Enum; Value: in Pointer)
      with Import => True, Convention => StdCall,
           External_Name => "ilSetString";

    CString: constant String := Value & ASCII.NUL;
  begin
    ilSetString (Mode, CString'Address);
  end Set_String;

  ---------------------------------------------------------------------------

  function Type_From_Ext (File_Name: in String) return Enum
  is
    function ilTypeFromExt (FileName: in CStrings.chars_ptr) return Enum
      with Import => True, Convention => StdCall,
           External_Name => "ilTypeFromExt";

    Value: Enum;

    CString: CStrings.char_array_access :=
      new IC.char_array'(IC.To_C (File_Name));
  begin
    Value := ilTypeFromExt (CStrings.To_Chars_Ptr (CString));
    Free (CString);
    return Value;
  end Type_From_Ext;

  --------------------------------------------------------------------------

end Imago.IL;
