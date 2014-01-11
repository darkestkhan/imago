pragma License (Modified_GPL);
------------------------------------------------------------------------------
-- EMAIL: <darkestkhan@gmail.com>                                           --
-- License: Modified GNU GPLv3 or any later as published by Free Software   --
--  Foundation (GMGPL).                                                     --
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
with System;

with Imago.Binary;
use Imago;

package Imago.IL is

  --------------------------------------------------------------------------

                              ---------------
                              -- T Y P E S --
                              ---------------

  --------------------------------------------------------------------------
  -- New names for old types.
  subtype Bitfield  is Binary.Word;
  subtype Bool      is Binary.Byte;
  subtype Byte      is Binary.S_Byte;
  subtype ClampD    is Long_Float   range 0.0 .. 1.0;
  subtype ClampF    is Float        range 0.0 .. 1.0;
  subtype ClampH    is Short_Float  range 0.0 .. 1.0;
  subtype Double    is Long_Float;
  subtype Int       is Integer;
  subtype Short     is Short_Integer;
  subtype SizeI     is Integer;
  subtype UByte     is Binary.Byte;
  subtype UShort    is Binary.Short;
  subtype UInt      is Binary.Word;
  subtype Pointer   is System.Address;

  --------------------------------------------------------------------------
  -- Try to bring some touch of order to the ILenum mess.
  subtype Enum is Binary.Word;

  --------------------------------------------------------------------------

                          -----------------------
                          -- C O N S T A N T S --
                          -----------------------

  --------------------------------------------------------------------------
  -- Useful values.
  Null_Pointer: constant Pointer := System.Null_Address;

  --------------------------------------------------------------------------
  -- "Enumeration" constants.
  IL_FALSE                                : constant Bool := 16#0#;
  IL_TRUE                                 : constant Bool := 16#1#;

  -- Data formats.
  IL_COLOUR_INDEX                         : constant Enum := 16#1900#;
  IL_COLOR_INDEX                          : constant Enum := 16#1900#;
  IL_ALPHA                                : constant Enum := 16#1906#;
  IL_RGB                                  : constant Enum := 16#1907#;
  IL_RGBA                                 : constant Enum := 16#1908#;
  IL_BGR                                  : constant Enum := 16#80E0#;
  IL_BGRA                                 : constant Enum := 16#80E1#;
  IL_LUMINANCE                            : constant Enum := 16#1909#;
  IL_LUMINANCE_ALPHA                      : constant Enum := 16#190A#;

  -- Types of data.
  IL_BYTE                                 : constant Enum := 16#1400#;
  IL_UNSIGNED_BYTE                        : constant Enum := 16#1401#;
  IL_SHORT                                : constant Enum := 16#1402#;
  IL_UNSIGNED_SHORT                       : constant Enum := 16#1403#;
  IL_INT                                  : constant Enum := 16#1404#;
  IL_UNSIGNED_INT                         : constant Enum := 16#1405#;
  IL_FLOAT                                : constant Enum := 16#1406#;
  IL_DOUBLE                               : constant Enum := 16#140A#;
  IL_HALF                                 : constant Enum := 16#140B#;

  -- IL specific defines.
  IL_VENDOR                               : constant Enum := 16#1F00#;
  IL_LOAD_EXT                             : constant Enum := 16#1F01#;
  IL_SAVE_EXT                             : constant Enum := 16#1F02#;

  IL_VERSION_1_7_8                        : constant Enum := 16#1#;
  IL_VERSION                              : constant Enum := 178;

  -- Attribute bits.
  IL_ORIGIN_BIT                           : constant Bitfield := 16#0000_0001#;
  IL_FILE_BIT                             : constant Bitfield := 16#0000_0002#;
  IL_PAL_BIT                              : constant Bitfield := 16#0000_0004#;
  IL_FORMAT_BIT                           : constant Bitfield := 16#0000_0008#;
  IL_TYPE_BIT                             : constant Bitfield := 16#0000_0010#;
  IL_COMPRESS_BIT                         : constant Bitfield := 16#0000_0020#;
  IL_LOADFAIL_BIT                         : constant Bitfield := 16#0000_0040#;
  IL_FORMAT_SPECIFIC_BIT                  : constant Bitfield := 16#0000_0080#;
  IL_ALL_ATTRIB_BITS                      : constant Bitfield := 16#000F_FFFF#;

  -- Types of palettes.
  IL_PAL_NONE                             : constant Enum := 16#0400#;
  IL_PAL_RGB24                            : constant Enum := 16#0401#;
  IL_PAL_RGB32                            : constant Enum := 16#0402#;
  IL_PAL_RGBA32                           : constant Enum := 16#0403#;
  IL_PAL_BGR24                            : constant Enum := 16#0404#;
  IL_PAL_BGR32                            : constant Enum := 16#0405#;
  IL_PAL_BGRA32                           : constant Enum := 16#0406#;

  -- Types of images.
  IL_TYPE_UNKNOWN                         : constant Enum := 16#0000#;
  IL_BMP                                  : constant Enum := 16#0420#;
  IL_CUT                                  : constant Enum := 16#0421#;
  IL_DOOM                                 : constant Enum := 16#0422#;
  IL_DOOM_FLAT                            : constant Enum := 16#0423#;
  IL_ICO                                  : constant Enum := 16#0424#;
  IL_JPG                                  : constant Enum := 16#0425#;
  IL_JFIF                                 : constant Enum := 16#0425#;
  IL_ILBM                                 : constant Enum := 16#0426#;
  IL_PCD                                  : constant Enum := 16#0427#;
  IL_PCX                                  : constant Enum := 16#0428#;
  IL_PIC                                  : constant Enum := 16#0429#;
  IL_PNG                                  : constant Enum := 16#042A#;
  IL_PNM                                  : constant Enum := 16#042B#;
  IL_SGI                                  : constant Enum := 16#042C#;
  IL_TGA                                  : constant Enum := 16#042D#;
  IL_TIF                                  : constant Enum := 16#042E#;
  IL_CHEAD                                : constant Enum := 16#042F#;
  IL_RAW                                  : constant Enum := 16#0430#;
  IL_MDL                                  : constant Enum := 16#0431#;
  IL_WAL                                  : constant Enum := 16#0432#;
  IL_LIF                                  : constant Enum := 16#0434#;
  IL_MNG                                  : constant Enum := 16#0435#;
  IL_JNG                                  : constant Enum := 16#0435#;
  IL_GIF                                  : constant Enum := 16#0436#;
  IL_DDS                                  : constant Enum := 16#0437#;
  IL_DCX                                  : constant Enum := 16#0438#;
  IL_PSD                                  : constant Enum := 16#0439#;
  IL_EXIF                                 : constant Enum := 16#043A#;
  IL_PSP                                  : constant Enum := 16#043B#;
  IL_PIX                                  : constant Enum := 16#043C#;
  IL_PXR                                  : constant Enum := 16#043D#;
  IL_XPM                                  : constant Enum := 16#043E#;
  IL_HDR                                  : constant Enum := 16#043F#;
  IL_ICNS                                 : constant Enum := 16#0440#;
  IL_JP2                                  : constant Enum := 16#0441#;
  IL_EXR                                  : constant Enum := 16#0442#;
  IL_WDP                                  : constant Enum := 16#0443#;
  IL_VTF                                  : constant Enum := 16#0444#;
  IL_WBMP                                 : constant Enum := 16#0445#;
  IL_SUN                                  : constant Enum := 16#0446#;
  IL_IFF                                  : constant Enum := 16#0447#;
  IL_TPL                                  : constant Enum := 16#0448#;
  IL_FITS                                 : constant Enum := 16#0449#;
  IL_DICOM                                : constant Enum := 16#044A#;
  IL_IWI                                  : constant Enum := 16#044B#;
  IL_BLP                                  : constant Enum := 16#044C#;
  IL_FTX                                  : constant Enum := 16#044D#;
  IL_ROT                                  : constant Enum := 16#044E#;
  IL_TEXTURE                              : constant Enum := 16#044F#;
  IL_DPX                                  : constant Enum := 16#0450#;
  IL_UTX                                  : constant Enum := 16#0451#;
  IL_MP3                                  : constant Enum := 16#0452#;

  IL_JASC_PAL                             : constant Enum := 16#0475#;

  -- Types of errors.
  IL_NO_ERROR                             : constant Enum := 16#0000#;
  IL_INVALID_ENUM                         : constant Enum := 16#0501#;
  IL_OUT_OF_MEMORY                        : constant Enum := 16#0502#;
  IL_FORMAT_NOT_SUPPORTED                 : constant Enum := 16#0503#;
  IL_INTERNAL_ERROR                       : constant Enum := 16#0504#;
  IL_INVALID_VALUE                        : constant Enum := 16#0505#;
  IL_ILLEGAL_OPERATION                    : constant Enum := 16#0506#;
  IL_ILLEGAL_FILE_VALUE                   : constant Enum := 16#0507#;
  IL_INVALID_FILE_HEADER                  : constant Enum := 16#0508#;
  IL_INVALID_PARAM                        : constant Enum := 16#0509#;
  IL_COULD_NOT_OPEN_FILE                  : constant Enum := 16#050A#;
  IL_INVALID_EXTENSION                    : constant Enum := 16#050B#;
  IL_FILE_ALREADY_EXISTS                  : constant Enum := 16#050C#;
  IL_OUT_FORMAT_SAME                      : constant Enum := 16#050D#;
  IL_STACK_OVERFLOW                       : constant Enum := 16#050E#;
  IL_STACK_UNDERFLOW                      : constant Enum := 16#050F#;
  IL_INVALID_CONVERSION                   : constant Enum := 16#0510#;
  IL_BAD_DIMENSIONS                       : constant Enum := 16#0511#;
  IL_FILE_READ_ERROR                      : constant Enum := 16#0512#;
  IL_FILE_WRITE_ERROR                     : constant Enum := 16#0513#;

  IL_LIB_GIF_ERROR                        : constant Enum := 16#05E1#;
  IL_LIB_JPEG_ERROR                       : constant Enum := 16#05E2#;
  IL_LIB_PNG_ERROR                        : constant Enum := 16#05E3#;
  IL_LIB_TIFF_ERROR                       : constant Enum := 16#05E4#;
  IL_LIB_MNG_ERROR                        : constant Enum := 16#05E5#;
  IL_LIB_JP2_ERROR                        : constant Enum := 16#05E6#;
  IL_LIB_EXR_ERROR                        : constant Enum := 16#05E7#;
  IL_UNKNOWN_ERROR                        : constant Enum := 16#05FF#;

  -- Origin definitions.
  IL_ORIGIN_SET                           : constant Enum := 16#0600#;
  IL_ORIGIN_LOWER_LEFT                    : constant Enum := 16#0601#;
  IL_ORIGIN_UPPER_LEFT                    : constant Enum := 16#0602#;
  IL_ORIGIN_MODE                          : constant Enum := 16#0603#;

  -- Format and type mode definitions.
  IL_FORMAT_SET                           : constant Enum := 16#0610#;
  IL_FORMAT_MODE                          : constant Enum := 16#0611#;
  IL_TYPE_SET                             : constant Enum := 16#0612#;
  IL_TYPE_MODE                            : constant Enum := 16#0613#;

  -- File definitions.
  IL_FILE_OVERWRITE                       : constant Enum := 16#0620#;
  IL_FILE_MODE                            : constant Enum := 16#0621#;

  -- Palette difinitions.
  IL_CONV_PAL                             : constant Enum := 16#0630#;

  -- Load fail definitions.
  IL_DEFAULT_ON_FAIL                      : constant Enum := 16#0632#;

  -- Key colour and alpha definitions.
  IL_USE_KEY_COLOUR                       : constant Enum := 16#0635#;
  IL_USE_KEY_COLOR                        : constant Enum := 16#0635#;
  IL_BLIT_BLEND                           : constant Enum := 16#0636#;

  -- Interlace definitions.
  IL_SAVE_INTERLACED                      : constant Enum := 16#0639#;
  IL_INTERLACE_MODE                       : constant Enum := 16#063A#;

  -- Quantization definitions.
  IL_QUANTIZATION_MODE                    : constant Enum := 16#0640#;
  IL_WU_QUANT                             : constant Enum := 16#0641#;
  IL_NEU_QUANT                            : constant Enum := 16#0642#;
  IL_NEU_QUANT_SAMPLE                     : constant Enum := 16#0643#;
  IL_MAX_QUANT_INDEXS                     : constant Enum := 16#0644#;
  IL_MAX_QUANT_INDICES                    : constant Enum := 16#0644#;

  -- Hints.
  IL_FASTEST                              : constant Enum := 16#0660#;
  IL_LESS_MEM                             : constant Enum := 16#0661#;
  IL_DONT_CARE                            : constant Enum := 16#0662#;
  IL_MEM_SPEED_HINT                       : constant Enum := 16#0665#;
  IL_USE_COMPRESSION                      : constant Enum := 16#0666#;
  IL_NO_COMPRESSION                       : constant Enum := 16#0667#;
  IL_COMPRESSION_HINT                     : constant Enum := 16#0668#;

  -- Compression.
  IL_NVIDIA_COMPRESS                      : constant Enum := 16#0670#;
  IL_SQUISH_COMPRESS                      : constant Enum := 16#0671#;

  -- Subimage types.
  IL_SUB_NEXT                             : constant Enum := 16#0680#;
  IL_SUB_MIPMAP                           : constant Enum := 16#0681#;
  IL_SUB_LAYER                            : constant Enum := 16#0682#;

  -- Compression definitions.
  IL_COMPRESS_MODE                        : constant Enum := 16#0700#;
  IL_COMPRESS_NONE                        : constant Enum := 16#0701#;
  IL_COMPRESS_RLE                         : constant Enum := 16#0702#;
  IL_COMPRESS_LZO                         : constant Enum := 16#0703#;
  IL_COMPRESS_ZLIB                        : constant Enum := 16#0704#;

  -- File format specific values.
  IL_TGA_CREATE_STAMP                     : constant Enum := 16#0710#;
  IL_JPG_QUALITY                          : constant Enum := 16#0711#;
  IL_PNG_INTERLACE                        : constant Enum := 16#0712#;
  IL_TGA_RLE                              : constant Enum := 16#0713#;
  IL_BMP_RLE                              : constant Enum := 16#0714#;
  IL_SGI_RLE                              : constant Enum := 16#0715#;
  IL_TGA_ID_STRING                        : constant Enum := 16#0717#;
  IL_TGA_AUTHNAME_STRING                  : constant Enum := 16#0718#;
  IL_TGA_AUTHCOMMENT_STRING               : constant Enum := 16#0719#;
  IL_PNG_AUTHNAME_STRING                  : constant Enum := 16#071A#;
  IL_PNG_TITLE_STRING                     : constant Enum := 16#071B#;
  IL_PNG_DESCRIPTION_STRING               : constant Enum := 16#071C#;
  IL_TIF_DESCRIPTION_STRING               : constant Enum := 16#071D#;
  IL_TIF_HOSTCOMPUTER_STRING              : constant Enum := 16#071E#;
  IL_TIF_DOCUMENTNAME_STRING              : constant Enum := 16#071F#;
  IL_TIF_AUTHNAME_STRING                  : constant Enum := 16#0720#;
  IL_JPG_SAVE_FORMAT                      : constant Enum := 16#0721#;
  IL_CHEAD_HEADER_STRING                  : constant Enum := 16#0722#;
  IL_PCD_PICNUM                           : constant Enum := 16#0723#;
  IL_PNG_ALPHA_INDEX                      : constant Enum := 16#0724#;
  IL_JPG_PROGRESSIVE                      : constant Enum := 16#0725#;
  IL_VTF_COMP                             : constant Enum := 16#0726#;

  -- DXTC definitions.
  IL_DXTC_FORMAT                          : constant Enum := 16#0705#;
  IL_DXT1                                 : constant Enum := 16#0706#;
  IL_DXT2                                 : constant Enum := 16#0707#;
  IL_DXT3                                 : constant Enum := 16#0708#;
  IL_DXT4                                 : constant Enum := 16#0709#;
  IL_DXT5                                 : constant Enum := 16#070A#;
  IL_DXT_NO_COMP                          : constant Enum := 16#070B#;
  IL_KEEP_DXTC_DATA                       : constant Enum := 16#070C#;
  IL_DXTC_DATA_FORMAT                     : constant Enum := 16#070D#;
  IL_3DC                                  : constant Enum := 16#070E#;
  IL_RXGB                                 : constant Enum := 16#070F#;
  IL_ATI1N                                : constant Enum := 16#0710#;
  IL_DXT1A                                : constant Enum := 16#0711#;

  -- Environment map definitions.
  IL_CUBEMAP_POSITIVEX                    : constant Bitfield := 16#00000400#;
  IL_CUBEMAP_NEGATIVEX                    : constant Bitfield := 16#00000800#;
  IL_CUBEMAP_POSITIVEY                    : constant Bitfield := 16#00001000#;
  IL_CUBEMAP_NEGATIVEY                    : constant Bitfield := 16#00002000#;
  IL_CUBEMAP_POSITIVEZ                    : constant Bitfield := 16#00004000#;
  IL_CUBEMAP_NEGATIVEZ                    : constant Bitfield := 16#00008000#;
  IL_SPHEREMAP                            : constant Bitfield := 16#00010000#;

  -- Values.
  IL_VERSION_NUM                          : constant Enum := 16#0DE2#;
  IL_IMAGE_WIDTH                          : constant Enum := 16#0DE4#;
  IL_IMAGE_HEIGHT                         : constant Enum := 16#0DE5#;
  IL_IMAGE_DEPTH                          : constant Enum := 16#0DE6#;
  IL_IMAGE_SIZE_OF_DATA                   : constant Enum := 16#0DE7#;
  IL_IMAGE_BPP                            : constant Enum := 16#0DE8#;
  IL_IMAGE_BYTES_PER_PIXEL                : constant Enum := 16#0DE8#;
  IL_IMAGE_BITS_PER_PIXEL                 : constant Enum := 16#0DE9#;
  IL_IMAGE_FORMAT                         : constant Enum := 16#0DEA#;
  IL_IMAGE_TYPE                           : constant Enum := 16#0DEB#;
  IL_PALETTE_TYPE                         : constant Enum := 16#0DEC#;
  IL_PALETTE_SIZE                         : constant Enum := 16#0DED#;
  IL_PALETTE_BPP                          : constant Enum := 16#0DEE#;
  IL_PALETTE_NUM_COLS                     : constant Enum := 16#0DEF#;
  IL_PALETTE_BASE_TYPE                    : constant Enum := 16#0DF0#;
  IL_NUM_FACES                            : constant Enum := 16#0DE1#;
  IL_NUM_IMAGES                           : constant Enum := 16#0DF1#;
  IL_NUM_MIPMAPS                          : constant Enum := 16#0DF2#;
  IL_NUM_LAYERS                           : constant Enum := 16#0DF3#;
  IL_ACTIVE_IMAGE                         : constant Enum := 16#0DF4#;
  IL_ACTIVE_MIPMAP                        : constant Enum := 16#0DF5#;
  IL_ACTIVE_LAYER                         : constant Enum := 16#0DF6#;
  IL_ACTIVE_FACE                          : constant Enum := 16#0E00#;
  IL_CUR_IMAGE                            : constant Enum := 16#0DF7#;
  IL_IMAGE_DURATION                       : constant Enum := 16#0DF8#;
  IL_IMAGE_PLANESIZE                      : constant Enum := 16#0DF9#;
  IL_IMAGE_BPC                            : constant Enum := 16#0DFA#;
  IL_IMAGE_OFFX                           : constant Enum := 16#0DFB#;
  IL_IMAGE_OFFY                           : constant Enum := 16#0DFC#;
  IL_IMAGE_CUBEFLAGS                      : constant Enum := 16#0DFD#;
  IL_IMAGE_ORIGIN                         : constant Enum := 16#0DFE#;
  IL_IMAGE_CHANNELS                       : constant Enum := 16#0DFF#;

  IL_SEEK_SET	                            : constant Int  := 0;
  IL_SEEK_CUR	                            : constant Int  := 1;
  IL_SEEK_END	                            : constant Int  := 2;
  IL_EOF		                              : constant Int  := -1;

  --------------------------------------------------------------------------

  -- FIXME/TODO:  typedefs of pointers to functions are not bound.
  --              This is preventing against binding to last functions.

  --------------------------------------------------------------------------

                        ---------------------------
                        -- S U B P R O G R A M S --
                        ---------------------------

  --------------------------------------------------------------------------

  function Active_Face (Number: in UInt) return Bool;

  function Active_Image (Number: in UInt) return Bool;

  function Active_Layer (Number: in UInt) return Bool;

  function Active_Mipmap (Number: in UInt) return Bool;

  function Apply_Pal (File_Name: in String) return Bool;
  Pragma Inline (Apply_Pal);

  -- NOTE: Is this correct way to bind to this function?
  --       Probably not, but will try fixing it once something breaks over this.
  function Apply_Profile
    ( In_Profile: in String; Out_Profile: in String
    ) return Bool;
  Pragma Inline (Apply_Profile);

  procedure Bind_Image (Image: in UInt);

  function Blit
    ( Source: in UInt; DestX: in Int; DestY: in Int; DestZ: in Int;
      SrcX: in UInt; SrcY: in UInt; SrcZ: in UInt;
      Width: in UInt; Height: in UInt; Depth: in UInt
    ) return Bool;

  function Clamp_NTSC return Bool;

  procedure Clear_Color
    ( Red: in ClampF; Green: in ClampF; Blue: in ClampF; Alpha: in ClampF );

  procedure Clear_Colour
    ( Red: in ClampF; Green: in ClampF; Blue: in ClampF; Alpha: in ClampF );

  function Clear_Image return Bool;

  function Clone_Cur_Image return UInt;

  function Compress_DXT
    ( Data: in Pointer; Width: in UInt; Height: in UInt;
      Depth: in UInt; DXTC_Format: in Enum; DXTC_Size: in Pointer
    ) return Pointer;

  function Compress_Func (Mode: in Enum) return Bool;

  function Convert_Image (Dest_Format: in Enum; Dest_Type: in Enum) return Bool;

  function Convert_Pal (Dest_Format: in Enum) return Bool;

  function Copy_Image (Src: in UInt) return Bool;

  function Copy_Pixels
    ( XOff: in UInt; YOff: in UInt; ZOff: in UInt;
      Width: in UInt; Height: in UInt; Depth: in UInt;
      Format: in Enum; Type_Of: in Enum; Data: in Pointer
    ) return UInt;

  function Create_Sub_Image (Type_Of: in Enum; Num: in UInt) return UInt;

  function Default_Image return Bool;

  procedure Delete_Image (Num: in UInt);

  procedure Delete_Images (Num: in SizeI; Images: in Pointer);

  function Determine_Type (File_Name: in String) return Enum;

  function Determine_Type (Lump: in Pointer; Size: in UInt) return Enum;
  Pragma Inline (Determine_Type);

  function Disable (Mode: in Enum) return Bool;

  function DXTC_Data_To_Image return Bool;

  function DXTC_Data_To_Surface return Bool;

  function Enable (Mode: in Enum) return Bool;

  procedure Flip_Surface_DXTC_Data;

  function Format_Func (Mode: in Enum) return Bool;

  function Get_Alpha (Type_Of: in Enum) return Pointer;

  function Gen_Image return UInt;

  procedure Gen_Images (Num: in SizeI; Images: in Pointer);

  function Get_Boolean (Mode: in Enum) return Bool;

  procedure Get_Boolean (Mode: in Enum; Param: in Pointer);
  Pragma Inline (Get_Boolean);

  function Get_Data return Pointer;

  function Get_DXTC_Data
    ( Buffer: in Pointer; Buffer_Size: in UInt; DXTC_Format: in Enum
    ) return UInt;

  function Get_Error return Enum;

  function Get_Integer (Mode: in Enum) return Int;

  procedure Get_Integer (Mode: in Enum; Param: in Pointer);
  Pragma Inline (Get_Integer);

  function Get_Lump_Pos return UInt;

  function Get_Palette return Pointer;

  function Get_String (String_Name: in Enum) return String;
  Pragma Inline (Get_String);

  procedure Hint (Target: in Enum; Mode: in Enum);

  function Invert_Surface_DXTC_Data_Alpha return Bool;

  procedure Init;

  function Image_To_DXTC_Data (Format: in Enum) return Bool;

  function Is_Disabled (Mode: in Enum) return Bool;

  function Is_Enabled (Mode: in Enum) return Bool;

  function Is_Imaga (Image: in UInt) return Bool;

  function Is_Valid (Type_Of: in Enum; File_Name: in String) return Bool;

  function Is_Valid
    ( Type_Of: in Enum; Lump: in Pointer; Size: in UInt
    ) return Bool;
  Pragma Inline (Is_Valid);

  procedure Key_Color
    ( Red: in ClampF; Green: in ClampF; Blue: in ClampF; Alpha: in ClampF );

  procedure Key_Colour
    ( Red: in ClampF; Green: in ClampF; Blue: in ClampF; Alpha: in ClampF );

  function Load (Type_Of: in Enum; File_Name: in String) return Bool;

  function Load
    ( Type_Of: in Enum; Lump: in Pointer; Size: in UInt
    ) return Bool;
  Pragma Inline (Load);

  function Load_Data
    ( File_Name: in String;
      Width: in UInt; Height: in UInt;
      Depth: in UInt; BPP: in UByte
    ) return Bool;

  function Load_Data
    ( Lump: in Pointer; Size: in UInt;
      Width: in UInt; Height: in UInt;
      Depth: in UInt; BPP: in UByte
    ) return Bool;
  Pragma Inline (Load_Data);

  function Load_Image (File_Name: in String) return Bool;
  Pragma Inline (Load_Image);

  function Load_Pal (File_Name: in String) return Bool;
  Pragma Inline (Load_Pal);

  procedure Mod_Alpha (Alpha_Value: in Double);

  function Original_Func (Mode: in Enum) return Bool;

  function Overlay_Image
    ( Source: in UInt;  XCoord: in Int;
      YCoord: in Int;   ZCoord: in Int
    ) return Bool;

  procedure Pop_Attrib;

  -- NOTE: Type of Bits may need to be changed from UInt to Bitfield
  procedure Push_Attrib (Bits: in UInt);

  procedure Register_Format (Format: in Enum);

  function Register_Mip_Num (Num: in UInt) return Bool;

  function Register_Num_Faces (Num: in UInt) return Bool;

  function Register_Num_Images (Num: in UInt) return Bool;

  procedure Register_Origin (Origin: in Enum);

  procedure Register_Pal (Pal: in Pointer; Size: in UInt; Type_Of: in Enum);

  procedure Register_Type (Type_Of: in Enum);

  function Remove_Load (Ext: in String) return Bool;
  Pragma Inline (Remove_Load);

  function Remove_Save (Ext: in String) return Bool;
  Pragma Inline (Remove_Save);

  procedure Reset_Memory;

  procedure Reset_Read;

  procedure Reset_Write;

  function Save (Type_Of: in Enum; File_Name: in String) return Bool;

  function Save
    ( Type_Of: in Enum; Lump: in Pointer; Size: in UInt
    ) return UInt;
  Pragma Inline (Save);

  function Save_Data (File_Name: in String) return Bool;
  Pragma Inline (Save_Data);

  function Save_Image (File_Name: in String) return Bool;
  Pragma Inline (Save_Image);

  function Save_Pal (File_Name: in String) return Bool;
  Pragma Inline (Save_Pal);

  function Set_Alpha (Alpha_Value: in Double) return Bool;

  function Set_Data (Data: in Pointer) return Bool;

  function Set_Duration (Duration: in UInt) return Bool;

  procedure Set_Integer (Mode: in Enum; Param: in Int);

  procedure Set_Pixels
    ( XOff: in Int; YOff: in Int; ZOff: in Int;
      Width: in UInt; Height: in UInt; Depth: in UInt;
      Format: in Enum; Type_Of: in Enum; Data: in Pointer
    );

  procedure Shut_Down;

  function Surface_To_DXTC_Data (Format: in Enum) return Bool;

  function Tex_Image
    ( Width: in UInt; Height: in UInt; Depth: in UInt;
      Num_Channels: in UByte; Format: in Enum; Type_Of: in Enum;
      Data: in Pointer
    ) return Bool;

  function Tex_Image_DXTC
    ( W: in Int; H: in Int; D: in Int; DXT_Format: in Enum; Data: in Pointer
    ) return Bool;

  function Type_From_Ext (File_Name: in String) return Enum;
  Pragma Inline (Type_From_Ext);

  function Type_Func (Mode: in Enum) return Bool;

-- Unbound subprograms:
-- ILenum	ilDetermineTypeF(ILHANDLE File);
-- ILboolean ilIsValidF(ILenum Type, ILHANDLE File);
-- ILboolean ilLoadF(ILenum Type, ILHANDLE File);
-- ILboolean ilRegisterLoad(ILconst_string Ext, IL_LOADPROC Load);
-- ILboolean ilRegisterSave(ILconst_string Ext, IL_SAVEPROC Save);
-- ILuint    ilSaveF(ILenum Type, ILHANDLE File);
-- void      ilSetMemory(mAlloc, mFree);
-- void      ilSetRead(fOpenRProc, fCloseRProc, fEofProc, fGetcProc, fReadProc, fSeekRProc, fTellRProc);
-- void      ilSetString(ILenum Mode, const char *String);
-- void      ilSetWrite(fOpenWProc, fCloseWProc, fPutcProc, fSeekWProc, fTellWProc, fWriteProc);
-- ILboolean ilLoadDataF(ILHANDLE File, ILuint Width, ILuint Height, ILuint Depth, ILubyte Bpp);

  --------------------------------------------------------------------------

private

  --------------------------------------------------------------------------

                            -------------------
                            -- I M P O R T S --
                            -------------------

  --------------------------------------------------------------------------

  Pragma Import (StdCall, Active_Face, "ilActiveFace");
  Pragma Import (StdCall, Active_Image, "ilActiveImage");
  Pragma Import (StdCall, Active_Layer, "ilActiveLayer");
  Pragma Import (StdCall, Active_Mipmap, "ilActiveMipmap");
  Pragma Import (StdCall, Bind_Image, "ilBindImage");
  Pragma Import (StdCall, Blit, "ilBlit");
  Pragma Import (StdCall, Clamp_NTSC, "ilClampNTSC");
  Pragma Import (StdCall, Clear_Color, "ilClearColour");
  Pragma Import (StdCall, Clear_Colour, "ilClearColour");
  Pragma Import (StdCall, Clear_Image, "ilClearImage");
  Pragma Import (StdCall, Clone_Cur_Image, "ilCloneCurImage");
  Pragma Import (StdCall, Compress_DXT, "ilCompressDXT");
  Pragma Import (StdCall, Compress_Func, "ilCompressFunc");
  Pragma Import (StdCall, Convert_Image, "ilConvertImage");
  Pragma Import (StdCall, Convert_Pal, "ilConvertPal");
  Pragma Import (StdCall, Copy_Image, "ilCopyImage");
  Pragma Import (StdCall, Copy_Pixels, "ilCopyPixels");
  Pragma Import (StdCall, Create_Sub_Image, "ilCreateSubImage");
  Pragma Import (StdCall, Default_Image, "ilDefaultImage");
  Pragma Import (StdCall, Delete_Image, "ilDeleteImage");
  Pragma Import (StdCall, Delete_Images, "ilDeleteImages");
  Pragma Import (StdCall, Disable, "ilDisable");
  Pragma Import (StdCall, DXTC_Data_To_Image, "ilDxtcDataToImage");
  Pragma Import (StdCall, DXTC_Data_To_Surface, "ilDxtcDataToSurface");
  Pragma Import (StdCall, Enable, "ilEnable");
  Pragma Import (StdCall, Flip_Surface_DXTC_Data, "ilFlipSurfaceDxtcData");
  Pragma Import (StdCall, Format_Func, "ilFormatFunc");
  Pragma Import (StdCall, Get_Alpha, "ilGetAlpha");
  Pragma Import (StdCall, Gen_Image, "ilGenImage");
  Pragma Import (StdCall, Gen_Images, "ilGenImages");
  Pragma Import (StdCall, Get_Data, "ilGetData");
  Pragma Import (StdCall, Get_DXTC_Data, "ilGetDXTCData");
  Pragma Import (StdCall, Get_Error, "ilGetError");
  Pragma Import (StdCall, Get_Lump_Pos, "ilGetLumpPos");
  Pragma Import (StdCall, Get_Palette, "ilGetPalette");
  Pragma Import (StdCall, Hint, "ilHint");
  Pragma Import
    ( StdCall, Invert_Surface_DXTC_Data_Alpha, "ilInvertSurfaceDxtcDataAlpha" );
  Pragma Import (StdCall, Init, "ilInit");
  Pragma Import (StdCall, Image_To_DXTC_Data, "ilImageToDxtcData");  
  Pragma Import (StdCall, Is_Disabled, "ilIsDisabled");
  Pragma Import (StdCall, Is_Enabled, "ilIsEnabled");
  Pragma Import (StdCall, Is_Imaga, "ilIsImage");
  Pragma Import (StdCall, Key_Color, "ilKeyColour");
  Pragma Import (StdCall, Key_Colour, "ilKeyColour");
  Pragma Import (StdCall, Mod_Alpha, "ilModAlpha");
  Pragma Import (StdCall, Original_Func, "ilOriginFunc");
  Pragma Import (StdCall, Overlay_Image, "ilOverlayImage");
  Pragma Import (StdCall, Pop_Attrib, "ilPopAttrib");
  Pragma Import (StdCall, Push_Attrib, "ilPushAttrib");
  Pragma Import (StdCall, Register_Format, "ilRegisterFormat");
  Pragma Import (StdCall, Register_Mip_Num, "ilRegisterMipNum");
  Pragma Import (StdCall, Register_Num_Faces, "ilRegisterNumFaces");
  Pragma Import (StdCall, Register_Num_Images, "ilRegisterNumImages");
  Pragma Import (StdCall, Register_Origin, "ilRegisterOrigin");
  Pragma Import (StdCall, Register_Pal, "ilRegisterPal");
  Pragma Import (StdCall, Register_Type, "ilRegisterType");
  Pragma Import (StdCall, Reset_Memory, "ilResetMemory");
  Pragma Import (StdCall, Reset_Read, "ilResetRead");
  Pragma Import (StdCall, Reset_Write, "ilResetWrite");
  Pragma Import (StdCall, Set_Alpha, "ilSetAlpha");
  Pragma Import (StdCall, Set_Data, "ilSetData");
  Pragma Import (StdCall, Set_Duration, "ilSetDuration");
  Pragma Import (StdCall, Set_Integer, "ilSetInteger");
  Pragma Import (StdCall, Set_Pixels, "ilSetPixels");
  Pragma Import (StdCall, Shut_Down, "ilShutDown");
  Pragma Import (StdCall, Surface_To_DXTC_Data, "ilSurfaceToDxtcData");
  Pragma Import (StdCall, Tex_Image, "ilTexImage");
  Pragma Import (StdCall, Tex_Image_DXTC, "ilTexImageDxtc");
  Pragma Import (StdCall, Type_Func, "ilTypeFunc");

  --------------------------------------------------------------------------

end Imago.IL;
