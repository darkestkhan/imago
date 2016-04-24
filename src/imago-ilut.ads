------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: ISC                                                             --
--                                                                          --
--                    Copyright © 2015  - 2016 darkestkhan                  --
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
with Imago.IL;
use Imago;

with Lumen.GL;
use Lumen;
package Imago.ILUT is

  --------------------------------------------------------------------------

                        -----------------------
                        -- C O N S T A N T S --
                        -----------------------

  --------------------------------------------------------------------------

  ILUT_VERSION_1_7_8                        : constant IL.Enum := 1;
  ILUT_VERSION                              : constant IL.Enum := 178;

  -- Attribute Bits.
  ILUT_OPENGL_BIT                           : constant IL.Enum := 16#00000001#;
  ILUT_D3D_BIT                              : constant IL.Enum := 16#00000002#;
  ILUT_ALL_ATTRIB_BITS                      : constant IL.Enum := 16#000FFFFF#;

  -- Error Types.
  ILUT_INVALID_ENUM                         : constant IL.Enum := 16#0501#;
  ILUT_OUT_OF_MEMORY                        : constant IL.Enum := 16#0502#;
  ILUT_INVALID_VALUE                        : constant IL.Enum := 16#0505#;
  ILUT_ILLEGAL_OPERATION                    : constant IL.Enum := 16#0506#;
  ILUT_INVALID_PARAM                        : constant IL.Enum := 16#0509#;
  ILUT_COULD_NOT_OPEN_FILE                  : constant IL.Enum := 16#050A#;
  ILUT_STACK_OVERFLOW                       : constant IL.Enum := 16#050E#;
  ILUT_STACK_UNDERFLOW                      : constant IL.Enum := 16#050F#;
  ILUT_BAD_DIMENSIONS                       : constant IL.Enum := 16#0511#;
  ILUT_NOT_SUPPORTED                        : constant IL.Enum := 16#0550#;

  -- State Definitions.
  ILUT_PALETTE_MODE                         : constant IL.Enum := 16#0600#;
  ILUT_OPENGL_CONV                          : constant IL.Enum := 16#0610#;
  ILUT_D3D_MIPLEVELS                        : constant IL.Enum := 16#0620#;
  ILUT_MAXTEX_WIDTH                         : constant IL.Enum := 16#0630#;
  ILUT_MAXTEX_HEIGHT                        : constant IL.Enum := 16#0631#;
  ILUT_MAXTEX_DEPTH                         : constant IL.Enum := 16#0632#;
  ILUT_GL_USE_S3TC                          : constant IL.Enum := 16#0634#;
  ILUT_D3D_USE_DXTC                         : constant IL.Enum := 16#0634#;
  ILUT_GL_GEN_S3TC                          : constant IL.Enum := 16#0635#;
  ILUT_D3D_GEN_DXTC                         : constant IL.Enum := 16#0635#;
  ILUT_S3TC_FORMAT                          : constant IL.Enum := 16#0705#;
  ILUT_DXTC_FORMAT                          : constant IL.Enum := 16#0705#;
  ILUT_D3D_POOL                             : constant IL.Enum := 16#0706#;
  ILUT_D3D_ALPHA_KEY_COLOR                  : constant IL.Enum := 16#0707#;
  ILUT_D3D_ALPHA_KEY_COLOUR                 : constant IL.Enum := 16#0707#;
  ILUT_FORCE_INTEGER_FORMAT                 : constant IL.Enum := 16#0636#;

  -- This new state does automatic texture target detection
  -- if enabled. Currently, only cubemap detection is supported.
  -- if the current image is no cubemap, the 2d texture is chosen.
  ILUT_GL_AUTODETECT_TEXTURE_TARGET         : constant IL.Enum := 16#0807#;

  -- Values.
  ILUT_VERSION_NUM                    : constant IL.Enum := IL.IL_VERSION_NUM;
  ILUT_VENDOR                         : constant IL.Enum := IL.IL_VENDOR;

  -- The different rendering api's.
  -- NOTE:  Imago has support only for OpenGL functions.
  --        Addition of support for other bindings is not planned.
  ILUT_OPENGL                               : constant IL.Enum := 0;
  ILUT_ALLEGRO                              : constant IL.Enum := 1;
  ILUT_WIN32                                : constant IL.Enum := 2;
  ILUT_DIRECT3D8                            : constant IL.Enum := 3;
  ILUT_DIRECT3D9                            : constant IL.Enum := 4;
  ILUT_X11                                  : constant IL.Enum := 5;
  ILUT_DIRECT3D10                           : constant IL.Enum := 6;

  --------------------------------------------------------------------------

                      ---------------------------
                      -- S U B P R O G R A M S --
                      ---------------------------

  --------------------------------------------------------------------------
  -- ImageLib Utility Toolkit Functions.
  function Disable (Mode: in IL.Enum) return IL.Bool
    with Import => True, Convention => StdCall, External_Name => "ilutDisable";

  function Enable (Mode: in IL.Enum) return IL.Bool
    with Import => True, Convention => StdCall, External_Name => "ilutEnable";

  function Get_Boolean (Mode: in IL.Enum) return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutGetBoolean";

  procedure Get_Boolean (Mode: in IL.Enum; Param: in IL.Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "ilutGetBooleanv";

  function Get_Integer (Mode: in IL.Enum) return IL.Int
    with Import => True, Convention => StdCall,
         External_Name => "ilutGetInteger";

  procedure Get_Integer (Mode: in IL.Enum; Param: in IL.Pointer)
    with Import => True, Convention => StdCall,
         External_Name => "ilutGetIntegerv";

  function Get_String (String_Name: in IL.Enum) return String
    with Inline => True;

  procedure Init
    with Import => True, Convention => StdCall, External_Name => "ilutInit";

  function Is_Disabled (Mode: in IL.Enum) return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutIsDisabled";

  function Is_Enabled (Mode: in IL.Enum) return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutIsEnabled";

  procedure Pop_Attrib
    with Import => True, Convention => StdCall,
         External_Name => "ilutPopAttrib";

  procedure Push_Attrib (Bits: in IL.UInt)
    with Import => True, Convention => StdCall,
         External_Name => "ilutPushAttrib";

  procedure Set_Integer (Mode: in IL.Enum; Param: in IL.Int)
    with Import => True, Convention => StdCall,
         External_Name => "ilutSetInteger";

  function Renderer (Renderer: in IL.Enum) return IL.Bool
    with Import => True, Convention => StdCall, External_Name => "ilutRenderer";

  -- ImageLib Utility Toolkit's OpenGL Functions.
  function GL_Bind_Tex_Image return GL.UInt
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLBindTexImage";

  function GL_Bind_Mipmaps return GL.UInt
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLBindMipmaps";

  function GL_Build_Mipmaps return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLBuildMipmaps";

  function GL_Load_Image (File_Name: in String) return GL.UInt
    with Inline => True;

  function GL_Screen return IL.Bool
    with Import => True, Convention => StdCall, External_Name => "ilutGLScreen";

  function GL_Screenie return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLScreenie";

  function GL_Save_Image
    ( File_Name: in String; Tex_ID: in GL.UInt
    ) return IL.Bool
    with Inline => True;

  function GL_Sub_Tex
    ( Tex_ID: in GL.UInt; XOff: in IL.UInt; YOff: in IL.UInt
    ) return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLSubTex2D";

  function GL_Sub_Tex
    ( Tex_ID: in GL.UInt; XOff: in IL.UInt;
      YOff: in IL.UInt; ZOff: in IL.UInt
    ) return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLSetTex3D";

  function GL_Set_Tex_2D (Tex_ID: in GL.UInt) return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLSetTex2D";

  function GL_Set_Tex_3D (Tex_ID: in GL.UInt) return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLSetTex3D";

  function GL_Tex_Image (Level: in GL.UInt) return IL.Bool
    with Import => True, Convention => StdCall,
         External_Name => "ilutGLTexImage";

  ---------------------------------------------------------------------------

end Imago.ILUT;
