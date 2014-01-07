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

  --------------------------------------------------------------------------

end Imago.IL;
