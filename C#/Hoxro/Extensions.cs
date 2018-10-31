using System;
using System.Collections.Generic;
using System.Text;

namespace Hoxro.Utiltiy.StaticData
{
    public static class Extensions
    {
        public const string Docx = ".docx";
        public const string Pdf = ".pdf";
        public const string Xlsx = ".xlsx";
        public const string Pptx = ".pptx";
        public const string Html = ".html";
        public const string Htm = ".htm";
        public const string Mov = ".mov";
        public const string Jpeg = ".jpeg";
        public const string Jpg = ".jpg";
        public const string Ico = ".ico";
        public const string Avi = ".avi";
        public const string Bmp = ".bmp";
        public const string Msg = ".msg";
        public const string eml = ".eml";
        public const string Mp3 = ".mp3";
        public const string Mp4 = ".mp4";
        public const string Tif = ".tif";
        public const string Tiff = ".tiff";
        public const string Png = ".png";
        public const string Wav = ".wav";
        public const string Gif = ".gif";
        public const string Xml = ".xml";
        public const string Txt = ".txt";
        public const string Xls = ".xls";
        public const string Csv = ".csv";

        public static string ContentType(string extension)
        {
            string contentString = string.Empty;
            if (!extension.Contains("."))
            {
                extension = "." + extension;
            }
            switch (extension.ToLower())
            {
                case Jpeg:
                case Jpg:
                    contentString = MimeType.Image_Jpeg;
                    break;
                case Gif:
                    contentString = MimeType.Image_Gif;
                    break;
                case Png:
                    contentString = MimeType.Image_Png;
                    break;
                case Bmp:
                    contentString = MimeType.Image_Bmp;
                    break;
                case Ico:
                    contentString = MimeType.Image_Icon;
                    break;
                case Docx:
                    contentString = MimeType.Application_Vnd_OpenXmlFormats_OfficeDocument_WordProcessing_Document;
                    break;
                case Pdf:
                    contentString = MimeType.Application_Pdf;
                    break;
                case Xlsx:
                    contentString = MimeType.Application_Vnd_OpenXmlFormats_OfficeDocument_Spreadsheetml_Sheet;
                    break;
                case Pptx:
                    contentString = MimeType.Application_Vnd_OpenXmlFormats_OfficeDocument_Presentationml_Presentation;
                    break;
                case Html:
                    contentString = MimeType.Text_Html;
                    break;
                case Mov:
                    contentString = MimeType.Video_QuickTime;
                    break;
                case Avi:
                    contentString = MimeType.Video_X_MsVideo;
                    break;
                case Msg:
                    contentString = MimeType.Application_Vnd_Ms_Outlook;
                    break;
                case eml:
                    contentString = MimeType.Message_Rfc822;
                    break;
                case Mp3:
                    contentString = MimeType.Audio_Mpeg;
                    break;
                case Mp4:
                    contentString = MimeType.Video_Mp4;
                    break;
                case Tif:
                case Tiff:
                    contentString = MimeType.Image_Tiff;
                    break;
                case Wav:
                    contentString = MimeType.Audio_Wav;
                    break;
                case Xml:
                    contentString = MimeType.Application_Xml;
                    break;
                case Txt:
                    contentString = MimeType.Text_Plain;
                    break;
                case Xls:
                    contentString = MimeType.Application_Vnd_Ms_Excel;
                    break;
                default:
                    contentString = MimeType.Application_Octet_Stream;
                    break;
            }
            return contentString;
        }
        public static string GetExtensionByProvider(string provider)
        {
            string ext;
            switch (provider)
            {
                case ProviderName.google:
                    ext = eml;
                    break;
                default:
                    ext = Msg;
                    break;
            }
            return ext.Replace(".", "");
        }
    }
    public static class MimeType
    {
        public const string Text_Plain = "text/plain";
        public const string Text_Css = "text/css";
        public const string Text_Html = "text/html";
        public const string Image_Jpeg = "image/jpeg";
        public const string Image_Png = "image/png";
        public const string Image_Bmp = "image/bmp";
        public const string Image_Gif = "image/gif";
        public const string Image_Icon = "image/x-icon";
        public const string Image_Svg = "image/svg+xml";
        public const string Image_Tiff = "image/tiff";
        public const string Audio_Mpeg = "audio/mpeg";
        public const string Audio_Ogg = "audio/ogg";
        public const string Audio_All = "audio/*";
        public const string Audio_Wave = "audio/wave";
        public const string Audio_Wav = "audio/wav";
        public const string Video_Mp4 = "video/mp4";
        public const string Video_X_MsVideo = "video/x-msvideo";
        public const string Video_QuickTime = "video/quicktime";
        public const string Video_X_Sgi_Movie = "video/x-sgi-movie";
        public const string Application_All = "application/*";
        public const string Application_Json = "application/json";
        public const string Application_X_Www_Form_UrlEncoded = "application/x-www-form-urlencoded";
        public const string Application_Javascript = "application/javascript";
        public const string Application_Ecmascript = "application/ecmascript";
        public const string Application_Octet_Stream = "application/octet-stream";
        public const string Application_Vnd_OpenXmlFormats_OfficeDocument_WordProcessing_Document = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        public const string Application_Vnd_OpenXmlFormats_OfficeDocument_Spreadsheetml_Sheet = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        public const string Application_Vnd_OpenXmlFormats_OfficeDocument_Presentationml_Presentation = "application/vnd.openxmlformats-officedocument.presentationml.presentation";
        public const string Application_Vnd_Ms_PowerPoint = "application/vnd.ms-powerpoint";
        public const string Application_Vnd_Ms_Excel = "application/vnd.ms-excel";
        public const string Application_MsWord = "application/msword";
        public const string Application_Pdf = "application/pdf";
        public const string Application_Vnd_Ms_Outlook = "application/vnd.ms-outlook";
        public const string Message_Rfc822 = "message/rfc822";
        public const string Application_Xml = "application/xml";
        public const string Multipart_Mixed = "multipart/mixed";

    }
    public static class UrlContent
    {
        public const string RSCT = "&rsct=";
    }
    public static class UrlContentValue
    {
        public const string Octet_Stream = "&rsct=application%2Foctet-stream";
        public const string FileName = "&rscd=filename%3D";
    }
    
}
