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
with Imago.IL;
use Imago;

package Imago.ILU is

  --------------------------------------------------------------------------

                            ---------------
                            -- T Y P E S --
                            ---------------

  --------------------------------------------------------------------------

  -- TODO: Bind types (ILinfo, ILpointf, ILpointi).

  --------------------------------------------------------------------------

                        -----------------------
                        -- C O N S T A N T S --
                        -----------------------

  --------------------------------------------------------------------------

  ILU_VERSION_1_7_8                     : constant IL.Enum := 1;
  ILU_VERSION                           : constant IL.Enum := 178;

  ILU_FILTER                            : constant IL.Enum := 16#2600#;
  ILU_NEAREST                           : constant IL.Enum := 16#2601#;
  ILU_LINEAR                            : constant IL.Enum := 16#2602#;
  ILU_BILINEAR                          : constant IL.Enum := 16#2603#;
  ILU_SCALE_BOX                         : constant IL.Enum := 16#2604#;
  ILU_SCALE_TRIANGLE                    : constant IL.Enum := 16#2605#;
  ILU_SCALE_BELL                        : constant IL.Enum := 16#2606#;
  ILU_SCALE_BSPLINE                     : constant IL.Enum := 16#2607#;
  ILU_SCALE_LANCZOS3                    : constant IL.Enum := 16#2608#;
  ILU_SCALE_MITCHELL                    : constant IL.Enum := 16#2609#;

  -- Error types.
  ILU_INVALID_ENUM                      : constant IL.Enum := 16#0501#;
  ILU_OUT_OF_MEMORY                     : constant IL.Enum := 16#0502#;
  ILU_INTERNAL_ERROR                    : constant IL.Enum := 16#0504#;
  ILU_INVALID_VALUE                     : constant IL.Enum := 16#0505#;
  ILU_ILLEGAL_OPERATION                 : constant IL.Enum := 16#0506#;
  ILU_INVALID_PARAM                     : constant IL.Enum := 16#0509#;

  -- Values.
  ILU_PLACEMENT                         : constant IL.Enum := 16#0700#;
  ILU_LOWER_LEFT                        : constant IL.Enum := 16#0701#;
  ILU_LOWER_RIGHT                       : constant IL.Enum := 16#0702#;
  ILU_UPPER_LEFT                        : constant IL.Enum := 16#0703#;
  ILU_UPPER_RIGHT                       : constant IL.Enum := 16#0704#;
  ILU_CENTER                            : constant IL.Enum := 16#0705#;
  ILU_CONVOLUTION_MATRIX                : constant IL.Enum := 16#0710#;
  
  ILU_VERSION_NUM                       : constant IL.Enum := IL.IL_VERSION_NUM;
  ILU_VENDOR                            : constant IL.Enum := IL.IL_VENDOR;

  -- Languages.
  ILU_ENGLISH                           : constant IL.Enum := 16#0800#;
  ILU_ARABIC                            : constant IL.Enum := 16#0801#;
  ILU_DUTCH                             : constant IL.Enum := 16#0802#;
  ILU_JAPANESE                          : constant IL.Enum := 16#0803#;
  ILU_SPANISH                           : constant IL.Enum := 16#0804#;
  ILU_GERMAN                            : constant IL.Enum := 16#0805#;
  ILU_FRENCH                            : constant IL.Enum := 16#0806#;

  --------------------------------------------------------------------------

                        ---------------------------
                        -- S U B P R O G R A M S --
                        ---------------------------

  --------------------------------------------------------------------------

  function Alienify return IL.Bool;
  function Blur_Avg (Iter: in IL.UInt) return IL.Bool;
  function Blur_Gaussian (Iter: in IL.UInt) return IL.Bool;
  function Build_Mipmaps return IL.Bool;
  function Colors_Used return IL.UInt;
  function Colours_Used return IL.UInt;
  function Compare_Image (Comp: in IL.UInt) return IL.Bool;
  function Contrast (Contrats: in Float) return IL.Bool;
  function Crop
    ( XOff: in IL.UInt; YOff: in IL.UInt; ZOff: in IL.UInt;
      Width: in IL.UInt; Height: in IL.UInt; Depth: in IL.UInt
    ) return IL.Bool;
  procedure Delete_Image (ID: in IL.UInt);
  function Edge_Detect_E return IL.Bool;
  function Edge_Detect_P return IL.Bool;
  function Edge_Detect_S return IL.Bool;
  function Emboss return IL.Bool;
  function Enlarge_Canvas
    ( Width: in IL.UInt; Height: in IL.UInt; Depth: in IL.UInt
    ) return IL.Bool;
  function Enlarge_Image
    ( XDim: in Float; YDim: in Float; ZDim: in Float
    ) return IL.Bool;
  function Equalize return IL.Bool;
  function Convolution
    ( Matrix: in IL.Pointer; Scale: in IL.Int; Bias: in IL.Int
    ) return IL.Bool;
  function Flip_Image return IL.Bool;
  function Gamma_Correct (Gamma: in Float) return IL.Bool;
  function Gen_Image return IL.UInt;
  procedure Image_Parameter (P_Name: in IL.Enum; Param: in IL.Enum);
  procedure Init;
  function Invert_Alpha return IL.Bool;
  function Mirror return IL.Bool;
  function Negative return IL.Bool;
  function Noisify (Tolerance: in IL.ClampF) return IL.Bool;
  function Pixelize (Pix_Size: in IL.UInt) return IL.Bool;
  function Replace_Color
    ( Red: in IL.UByte; Green: in IL.UByte;
      Blue: in IL.UByte; Tolerance: in Float
    ) return IL.Bool;
  function Replace_Colour
    ( Red: in IL.UByte; Green: in IL.UByte;
      Blue: in IL.UByte; Tolerance: in Float
    ) return IL.Bool;
  function Scale
    ( Width: in IL.UInt; Height: in IL.UInt; Depth: in IL.UInt
    ) return IL.Bool;
  function Scale_Alpha (Scale: in Float) return IL.Bool;
  function Scale_Colors (R: in Float; G: in Float; B: in Float) return IL.Bool;
  function Scale_Colours (R: in Float; G: in Float; B: in Float) return IL.Bool;
  function Set_Language (Language: in IL.Enum) return IL.Bool;
  function Sharpen (Factor: in Float; Iter: in IL.UInt) return IL.Bool;
  function Swap_Colors return IL.Bool;
  function Swap_Colours return IL.Bool;
  function Wave (Angle: in Float) return IL.Bool;

-- ILconst_string 		 iluErrorString(ILenum Error);
-- void           iluGetImageInfo(ILinfo *Info);
-- ILint          iluGetInteger(ILenum Mode);
-- void           iluGetIntegerv(ILenum Mode, ILint *Param);
-- ILstring 		 iluGetString(ILenum StringName);
-- ILuint         iluLoadImage(ILconst_string FileName);
-- void           iluRegionfv(ILpointf *Points, ILuint n);
-- void           iluRegioniv(ILpointi *Points, ILuint n);
-- ILboolean      iluRotate(ILfloat Angle);
-- ILboolean      iluRotate3D(ILfloat x, ILfloat y, ILfloat z, ILfloat Angle);
-- ILboolean      iluSaturate1f(ILfloat Saturation);
-- ILboolean      iluSaturate4f(ILfloat r, ILfloat g, ILfloat b, ILfloat Saturation);

  --------------------------------------------------------------------------

private

  --------------------------------------------------------------------------

                            -------------------
                            -- I M P O R T S --
                            -------------------

  --------------------------------------------------------------------------

  Pragma Import (StdCall, Alienify, "iluAlienify");
  Pragma Import (StdCall, Blur_Avg, "iluBlurAvg");
  Pragma Import (StdCall, Blur_Gaussian, "iluBlurGaussian");
  Pragma Import (StdCall, Build_Mipmaps, "iluBuildMipmaps");
  Pragma Import (StdCall, Colors_Used, "iluColoursUsed");
  Pragma Import (StdCall, Colours_Used, "iluColoursUsed");
  Pragma Import (StdCall, Compare_Image, "iluCompareImage");
  Pragma Import (StdCall, Contrast, "iluContrast");
  Pragma Import (StdCall, Crop, "iluCrop");
  Pragma Import (StdCall, Delete_Image, "iluDeleteImage");
  Pragma Import (StdCall, Edge_Detect_E, "iluEdgeDetectE");
  Pragma Import (StdCall, Edge_Detect_P, "iluEdgeDetectP");
  Pragma Import (StdCall, Edge_Detect_S, "iluEdgeDetectS");
  Pragma Import (StdCall, Emboss, "iluEmboss");
  Pragma Import (StdCall, Enlarge_Canvas, "iluEnlargeCanvas");
  Pragma Import (StdCall, Enlarge_Image, "iluEnlargeImage");
  Pragma Import (StdCall, Equalize, "iluEqualize");
  Pragma Import (StdCall, Convolution, "iluConvolution");
  Pragma Import (StdCall, Flip_Image, "iluFlipImage");
  Pragma Import (StdCall, Gamma_Correct, "iluGammaCorrect");
  Pragma Import (StdCall, Gen_Image, "iluGenImage");
  Pragma Import (StdCall, Image_Parameter, "iluImageParameter");
  Pragma Import (StdCall, Init, "iluInit");
  Pragma Import (StdCall, Invert_Alpha, "iluInvertAlpha");
  Pragma Import (StdCall, Mirror, "iluMirror");
  Pragma Import (StdCall, Negative, "iluNegative");
  Pragma Import (StdCall, Noisify, "iluNoisify");
  Pragma Import (StdCall, Pixelize, "iluPixelize");
  Pragma Import (StdCall, Replace_Color, "iluReplaceColour");
  Pragma Import (StdCall, Replace_Colour, "iluReplaceColour");
  Pragma Import (StdCall, Scale, "iluScale");
  Pragma Import (StdCall, Scale_Alpha, "iluScaleAlpha");
  Pragma Import (StdCall, Scale_Colors, "iluScaleColours");
  Pragma Import (StdCall, Scale_Colours, "iluScaleColours");
  Pragma Import (StdCall, Set_Language, "iluSetLanguage");
  Pragma Import (StdCall, Sharpen, "iluSharpen");
  Pragma Import (StdCall, Swap_Colors, "iluSwapColours");
  Pragma Import (StdCall, Swap_Colours, "iluSwapColours");
  Pragma Import (StdCall, Wave, "iluWave");

  --------------------------------------------------------------------------

end Imago.ILU;
