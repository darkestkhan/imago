pragma License (Modified_GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: Modified GNU GPLv3 or any later as published by Free Software   --
--  Foundation (GMGPL, see COPYING file).                                   --
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
with Imago.IL;
use Imago;

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
  function Disable (Mode: in IL.Enum) return IL.Bool;

  function Enable (Mode: in IL.Enum) return IL.Bool;

  function Get_Boolean (Mode: in IL.Enum) return IL.Bool;

  procedure Get_Boolean (Mode: in IL.Enum; Param: in IL.Pointer);
  Pragma Inline (Get_Boolean);

  function Get_Integer (Mode: in IL.Enum) return IL.Int;

  procedure Get_Integer (Mode: in IL.Enum; Param: in IL.Pointer);
  Pragma Inline (Get_Integer);

  function Get_String (String_Name: in IL.Enum) return String;
  Pragma Inline (Get_String);

  procedure Init;

  function Is_Disabled (Mode: in IL.Enum) return IL.Bool;

  function Is_Enabled (Mode: in IL.Enum) return IL.Bool;

  procedure Pop_Attrib;

  procedure Push_Attrib (Bits: in IL.UInt);

  procedure Set_Integer (Mode: in IL.Enum; Param: in IL.Int);

  function Renderer (Renderer: in IL.Enum) return IL.Bool;

  -- ImageLib Utility Toolkit's OpenGL Functions.
--	GLuint	ilutGLBindTexImage();
--	GLuint	ilutGLBindMipmaps(void);
--	ILboolean	ilutGLBuildMipmaps(void);
--	GLuint	ilutGLLoadImage(ILstring FileName);
--	ILboolean	ilutGLScreen(void);
--	ILboolean	ilutGLScreenie(void);
--	ILboolean	ilutGLSaveImage(ILstring FileName, GLuint TexID);
--	ILboolean ilutGLSubTex2D(GLuint TexID, ILuint XOff, ILuint YOff);
--	ILboolean ilutGLSubTex3D(GLuint TexID, ILuint XOff, ILuint YOff, ILuint ZOff);
--	ILboolean	ilutGLSetTex2D(GLuint TexID);
--	ILboolean	ilutGLSetTex3D(GLuint TexID);
--	ILboolean	ilutGLTexImage(GLuint Level);
--	ILboolean ilutGLSubTex(GLuint TexID, ILuint XOff, ILuint YOff);
--	ILboolean	ilutGLSetTex(GLuint TexID);
--	ILboolean ilutGLSubTex(GLuint TexID, ILuint XOff, ILuint YOff);

  ---------------------------------------------------------------------------

private

  --------------------------------------------------------------------------

                            -------------------
                            -- I M P O R T S --
                            -------------------

  --------------------------------------------------------------------------

  Pragma Import (StdCall, Disable, "ilutDisable");
  Pragma Import (StdCall, Enable, "ilutEnable");
  Pragma Import (StdCall, Init, "ilutInit");
  Pragma Import (StdCall, Is_Disabled, "ilutIsDisabled");
  Pragma Import (StdCall, Is_Enabled, "ilutIsEnabled");
  Pragma Import (StdCall, Pop_Attrib, "ilutPopAttrib");
  Pragma Import (StdCall, Push_Attrib, "ilutPushAttrib");
  Pragma Import (StdCall, Set_Integer, "ilutSetInteger");
  Pragma Import (StdCall, Renderer, "ilutRenderer");

  --------------------------------------------------------------------------

end Imago.ILUT;
