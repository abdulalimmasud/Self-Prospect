using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;
using Hoxro.Utiltiy.Helper;
using System.Linq;

namespace Hoxro.Utiltiy.Converter
{
    public class DateTimeConverter
    {
        public static long TimeSpentToMilliseconds(string tSpent)
        {
            int fIn = tSpent.IndexOf(":");
            int f = Convert.ToInt32(tSpent.Substring(0, fIn));
            int s = Convert.ToInt32(tSpent.Substring(fIn + 1, tSpent.IndexOf(":")));
            int t = Convert.ToInt32(tSpent.Substring(tSpent.LastIndexOf(":") + 1));
            TimeSpan intervalTimespan = new TimeSpan(f, s, t);
            return Convert.ToInt64(intervalTimespan.TotalMilliseconds);
        }
        public static DateTime GetUnixDate(long value)
        {
            DateTime start = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            DateTime date = start.AddMilliseconds(value);
            return date;
        }
    }
    public class UtcKindConverter : DateTimeConverterBase
    {
        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            try
            {
                if (reader.TokenType == JsonToken.Null)
                {
                    if (objectType != typeof(DateTime?) && objectType != typeof(DateTimeOffset?))
                        throw new JsonSerializationException($"Cannot convert null value to {objectType}");
                    return null;
                }
                else if(reader.TokenType == JsonToken.Date)
                {
                    var dateTime = Convert.ToDateTime(reader.Value);
                    return dateTime;
                    //return new DateTime(dateTime.Year, dateTime.Month, dateTime.Day, dateTime.Hour, dateTime.Minute, dateTime.Second, DateTimeKind.Utc);
                }
                else if (reader.TokenType == JsonToken.String)
                {
                    return reader.Value;
                }
                throw new JsonSerializationException($"Cannot convert to DateTime or DateTimeOffset from token type {reader.TokenType}");
            }
            catch (Exception ex)
            {
                throw new JsonSerializationException($"Cannot convert to DateTime or DateTimeOffset from token type {reader.TokenType}");
            }
        }

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            try
            {
                if (value == null)
                {
                    writer.WriteNull();
                    return;
                }
                else if (value is DateTime)
                {
                    var dateTime = DateTime.SpecifyKind(Convert.ToDateTime(value), DateTimeKind.Utc);
                    writer.WriteValue(dateTime);
                }
            }
            catch (Exception)
            {

            }
        }
    }
    public class UtcToLocalConverter : DateTimeConverterBase
    {
        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            try
            {
                if (reader.TokenType == JsonToken.Null)
                {
                    if (objectType != typeof(DateTime?) && objectType != typeof(DateTimeOffset?))
                        throw new JsonSerializationException($"Cannot convert null value to {objectType}");
                    return null;
                }
                else if (reader.TokenType == JsonToken.Date)
                {
                    var dateTime = Convert.ToDateTime(reader.Value);
                    return dateTime;
                }
                else if (reader.TokenType == JsonToken.String)
                {
                    return reader.Value;
                }
                throw new JsonSerializationException($"Cannot convert to DateTime or DateTimeOffset from token type {reader.TokenType}");
            }
            catch (Exception ex)
            {
                throw new JsonSerializationException($"Cannot convert to DateTime or DateTimeOffset from token type {reader.TokenType}");
            }
        }
        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            try
            {
                if (value == null)
                {
                    writer.WriteNull();
                    return;
                }
                else if (value is DateTime)
                {
                    var context = OutHttpContext.Current;
                    string timeZoneId = ClaimHelper.GetCompanyTimeZoneId(context);
                    if (!string.IsNullOrEmpty(timeZoneId))
                    {
                        TimeZoneInfo timeZoneInfo = null;
                        try
                        {
                            timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(timeZoneId);
                        }
                        catch (Exception)
                        {
                            var timeZones = TimeZoneInfo.GetSystemTimeZones();
                            timeZoneInfo = timeZones.ToList().FirstOrDefault(x => x.Id == timeZoneId);
                        }
                        var dateTime = TimeZoneInfo.ConvertTimeFromUtc(Convert.ToDateTime(value), timeZoneInfo);
                        writer.WriteValue(dateTime);
                    }
                    else
                    {
                        var dateTime = DateTime.SpecifyKind(Convert.ToDateTime(value), DateTimeKind.Utc);
                        writer.WriteValue(dateTime);
                    }
                }
            }
            catch (Exception)
            {

            }
        }
    }
}
