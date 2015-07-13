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

  function Error_String (String_Name: in IL.Enum) return String;
  pragma Inline (Error_String);

  function Equalize return IL.Bool;

  function Convolution
    ( Matrix: in IL.Pointer; Scale: in IL.Int; Bias: in IL.Int
    ) return IL.Bool;

  function Flip_Image return IL.Bool;

  function Gamma_Correct (Gamma: in Float) return IL.Bool;

  function Gen_Image return IL.UInt;

  function  Get_Integer (Mode: in IL.Enum) return IL.Int;

  procedure Get_Integer (Mode: in IL.Enum; Param: in IL.Pointer);
  pragma Inline (Get_Integer);

  function Get_String (String_Name: in IL.Enum) return String;
  pragma Inline (Get_String);

  procedure Image_Parameter (P_Name: in IL.Enum; Param: in IL.Enum);

  procedure Init;

  function Invert_Alpha return IL.Bool;

  function Load_Image (File_Name: in String) return IL.UInt;
  pragma Inline (Load_Image);

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

  function Rotate (Angle: in Float) return IL.Bool;

  function Rotate
    ( X: in Float; Y: in Float; Z: in Float; Angle: in Float
    ) return IL.Bool;
  pragma Inline (Rotate);

  function Saturate (Saturation: in Float) return IL.Bool;

  function Saturate
    ( R: in Float; G: in Float; B: in Float; Saturation: in Float
    ) return IL.Bool;
  pragma Inline (Saturate);

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

-- Unbound subprograms:
-- void           iluGetImageInfo(ILinfo *Info);
-- void           iluRegionfv(ILpointf *Points, ILuint n);
-- void           iluRegioniv(ILpointi *Points, ILuint n);

  --------------------------------------------------------------------------

private

  --------------------------------------------------------------------------

                            -------------------
                            -- I M P O R T S --
                            -------------------

  --------------------------------------------------------------------------

  pragma Import (StdCall, Alienify, "iluAlienify");
  pragma Import (StdCall, Blur_Avg, "iluBlurAvg");
  pragma Import (StdCall, Blur_Gaussian, "iluBlurGaussian");
  pragma Import (StdCall, Build_Mipmaps, "iluBuildMipmaps");
  pragma Import (StdCall, Colors_Used, "iluColoursUsed");
  pragma Import (StdCall, Colours_Used, "iluColoursUsed");
  pragma Import (StdCall, Compare_Image, "iluCompareImage");
  pragma Import (StdCall, Contrast, "iluContrast");
  pragma Import (StdCall, Crop, "iluCrop");
  pragma Import (StdCall, Delete_Image, "iluDeleteImage");
  pragma Import (StdCall, Edge_Detect_E, "iluEdgeDetectE");
  pragma Import (StdCall, Edge_Detect_P, "iluEdgeDetectP");
  pragma Import (StdCall, Edge_Detect_S, "iluEdgeDetectS");
  pragma Import (StdCall, Emboss, "iluEmboss");
  pragma Import (StdCall, Enlarge_Canvas, "iluEnlargeCanvas");
  pragma Import (StdCall, Enlarge_Image, "iluEnlargeImage");
  pragma Import (StdCall, Equalize, "iluEqualize");
  pragma Import (StdCall, Convolution, "iluConvolution");
  pragma Import (StdCall, Flip_Image, "iluFlipImage");
  pragma Import (StdCall, Gamma_Correct, "iluGammaCorrect");
  pragma Import (StdCall, Gen_Image, "iluGenImage");
  pragma Import (StdCall, Image_Parameter, "iluImageParameter");
  pragma Import (StdCall, Init, "iluInit");
  pragma Import (StdCall, Invert_Alpha, "iluInvertAlpha");
  pragma Import (StdCall, Mirror, "iluMirror");
  pragma Import (StdCall, Negative, "iluNegative");
  pragma Import (StdCall, Noisify, "iluNoisify");
  pragma Import (StdCall, Pixelize, "iluPixelize");
  pragma Import (StdCall, Replace_Color, "iluReplaceColour");
  pragma Import (StdCall, Replace_Colour, "iluReplaceColour");
  pragma Import (StdCall, Scale, "iluScale");
  pragma Import (StdCall, Scale_Alpha, "iluScaleAlpha");
  pragma Import (StdCall, Scale_Colors, "iluScaleColours");
  pragma Import (StdCall, Scale_Colours, "iluScaleColours");
  pragma Import (StdCall, Set_Language, "iluSetLanguage");
  pragma Import (StdCall, Sharpen, "iluSharpen");
  pragma Import (StdCall, Swap_Colors, "iluSwapColours");
  pragma Import (StdCall, Swap_Colours, "iluSwapColours");
  pragma Import (StdCall, Wave, "iluWave");

  --------------------------------------------------------------------------

end Imago.ILU;
