using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Hoxro.Utiltiy.StaticData
{
    public class DynamicField
    {
        public string Name { get; set; }
        public string InitialValue { get; set; }
    }
    public static class FieldValue
    {
        public static string GetDynamicField(string fieldName, string timezone, string format)
        {
            TimeZoneInfo timeZoneInfo = GetTimeZoneInfoById(timezone);
            DateTime utcDate = DateTime.UtcNow;
            DateTime dateTime = TimeZoneInfo.ConvertTimeFromUtc(utcDate, timeZoneInfo);
            return GetDateTime(fieldName, dateTime).ToString(format);
        }
        public static TimeZoneInfo GetTimeZoneInfoById(string timeZoneId)
        {
            TimeZoneInfo timeZoneInfo = null;
            try
            {
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(timeZoneId);
            }
            catch (Exception)
            {
                switch (timeZoneId)
                {
                    default:
                        timeZoneId = "GMT Standard Time";
                        break;
                }

                //string[] keywords = timeZoneId.Split(' ');
                //timeZoneId = string.Empty;
                //for (int i = 0; i < keywords.Length; i++)
                //{
                //    timeZoneId +=keywords[i][0];
                //}
                timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(timeZoneId);
            }
            return timeZoneInfo;
        }
        public static DateTime GetDateTime(string definedName, DateTime dateTime)
        {
            switch (definedName.ToLower())
            {
                case "currentdate":
                case "current date":
                case "currentday":
                case "current day":
                case "today":
                case "currenttime":
                case "current time":
                case "now":
                    break;
                case "yesterday":
                case "previousdate":
                case "previousday":
                case "previous date":
                case "previous day":
                case "lastdate":
                case "last date":
                case "lastday":
                case "last day":
                    dateTime.AddDays(-1);
                    break;
                case "tomorrow":
                case "nextdate":
                case "nextday":
                case "next date":
                case "next day":
                    dateTime.AddDays(1);
                    break;
                default:
                    dateTime = GetDateTimeFromContainingName(definedName, dateTime);
                    break;
            }
            return dateTime;
        }
        private static DateTime GetDateTimeFromContainingName(string definedName, DateTime dateTime)
        {
            if (Credential.TimeNameCredential.Any(definedName.Contains) && Credential.TimeCredential.Any(definedName.Contains))
            {

            }
            else if (Credential.DateNameCredential.Any(definedName.Contains) && Credential.DayCredential.Any(definedName.Contains))
            {

            }
            return dateTime;
        }
    }
    public static class Field
    {
        public const int ATTRIBUTE_CONFLICT = 2;
    }
    public static class Credential
    {

        public static string[] DateNameCredential = { "previous", "next", "last", "this", "before", "after", "current", "previousmonth", "lastmonth", "nextmonth", "previous month", "last month", "next month", "firstmonth", "first month", "month" };
        public static string[] DayCredential =
        {
            "firstday",
            "senondday",
            "thirdday",
            "fourthday",
            "fifthday",
            "sixthday",
            "seventhday",
            "eighthday",
            "ninthday",
            "first day",
            "senond day",
            "third day",
            "fourth day",
            "fifth day",
            "sixth day",
            "seventh day",
            "eighth day",
            "ninth day",
            "1st",
            "1 day",
            "1day",
            "1st day",
            "1stday",
            "2nd",
            "2nd day",
            "2ndday",
            "2 day",
            "2day",
            "3rd",
            "3rd day",
            "3rdday",
            "3 day",
            "3day",
            "4th",
            "4th day",
            "4thday",
            "4 day",
            "4day",
            "5th",
            "5th day",
            "5thday",
            "5 day",
            "5day",
            "6th",
            "6 day",
            "6day",
            "6th day",
            "6thday",
            "7th",
            "7th day",
            "7thday",
            "7 day",
            "7day",
            "8th",
            "8th day",
            "8thday",
            "8 day",
            "8day",
            "9th",
            "9th day",
            "9thday",
            "9 day",
            "9day",
            "10th",
            "10th day",
            "10thday",
            "10 day",
            "10day",
            "11th",
            "11 day",
            "11day",
            "11th day",
            "11thday",
            "12th",
            "12 day",
            "12day",
            "12th day",
            "12thday",
            "13th",
            "13 day",
            "13day",
            "13th day",
            "13thday",
            "14th",
            "14 day",
            "14day",
            "14th day",
            "14thday",
            "15th",
            "15 day",
            "15day",
            "15th day",
            "15thday",
            "16th",
            "16 day",
            "16day",
            "16th day",
            "16thday",
            "17th",
            "17 day",
            "17day",
            "17th day",
            "17thday",
            "18th",
            "18 day",
            "18day",
            "18th day",
            "18thday",
            "19th",
            "19 day",
            "19day",
            "19th day",
            "19thday",
            "20th",
            "20 day",
            "20day",
            "20th day",
            "20thday",
            "21th",
            "21st",
            "21 day",
            "21day",
            "21th day",
            "21thday",
            "22th",
            "22 day",
            "22day",
            "22th day",
            "22thday",
            "23th",
            "23 day",
            "23day",
            "23th day",
            "23thday",
            "24th",
            "24 day",
            "24day",
            "24th day",
            "24thday",
            "25th",
            "25 day",
            "25day",
            "25th day",
            "25thday",
            "26th",
            "26 day",
            "26day",
            "26th day",
            "26thday",
            "27th",
            "27 day",
            "27day",
            "27th day",
            "27thday",
            "28th",
            "28 day",
            "28day",
            "28th day",
            "28thday",
            "29th",
            "29 day",
            "29day",
            "29th day",
            "29thday",
            "30th",
            "30 day",
            "30day",
            "30th day",
            "30thday",
            "31th",
            "31 day",
            "31day",
            "31th day",
            "31thday",
            "endofmonth",
            "end day",
            "endday",
            "last day",
            "lastday",
            "monday",
            "tuesday",
            "wednesday",
            "thursday",
            "friday",
            "saturday",
            "sunday"
        };
        public static string[] TimeNameCredential = { "before", "after", "current", "hour" };
        public static string[] HourCredential =
        {
            "1", "01", "01:00",
            "2", "02", "02:00",
            "3", "03", "03:00",
            "4", "04", "04:00",
            "5", "05", "05:00",
            "6", "06", "06:00",
            "7", "07", "07:00",
            "8", "08", "08:00",
            "9", "09", "09:00",
            "10", "10:00",
            "11", "11:00",
            "12", "12:00",
            "13", "13:00",
            "14", "14:00",
            "15", "15:00",
            "16", "16:00",
            "17", "17:00",
            "18", "18:00",
            "19", "19:00",
            "20", "20:00",
            "21", "21:00",
            "22", "22:00",
            "23", "23:00",
            "24", "24:00",
            "00", "00:00",
        };
        public static string[] TimeCredential =
        {
            "1pm",
            "1 pm",
            "1p.m.",
            "1 p.m.",
            "01:00pm",
            "01:00 pm",
            "01:00 p.m.",
            "01:00p.m.",
            "2pm",
            "2 pm",
            "2p.m.",
            "2 p.m.",
            "02:00pm",
            "02:00 pm",
            "02:00 p.m.",
            "02:00p.m.",
            "3pm",
            "3 pm",
            "3p.m.",
            "3 p.m.",
            "03:00pm",
            "03:00 pm",
            "03:00 p.m.",
            "03:00p.m.",
            "4pm",
            "4 pm",
            "4p.m.",
            "4 p.m.",
            "04:00pm",
            "04:00 pm",
            "04:00 p.m.",
            "04:00p.m.",
            "5pm",
            "5 pm",
            "5p.m.",
            "5 p.m.",
            "05:00pm",
            "05:00 pm",
            "05:00 p.m.",
            "05:00p.m.",
            "6pm",
            "6 pm",
            "6p.m.",
            "6 p.m.",
            "06:00pm",
            "06:00 pm",
            "06:00 p.m.",
            "06:00p.m.",
            "7pm",
            "7 pm",
            "7p.m.",
            "7 p.m.",
            "07:00pm",
            "07:00 pm",
            "07:00 p.m.",
            "07:00p.m.",
            "8pm",
            "8 pm",
            "8p.m.",
            "8 p.m.",
            "08:00pm",
            "08:00 pm",
            "08:00 p.m.",
            "08:00p.m.",
            "9pm",
            "9 pm",
            "9p.m.",
            "9 p.m.",
            "09:00pm",
            "09:00 pm",
            "09:00 p.m.",
            "09:00p.m.",
            "10pm",
            "10 pm",
            "10p.m.",
            "10 p.m.",
            "10:00pm",
            "10:00 pm",
            "10:00 p.m.",
            "10:00p.m.",
            "11pm",
            "11 pm",
            "11p.m.",
            "11 p.m.",
            "11:00pm",
            "11:00 pm",
            "11:00 p.m.",
            "11:00p.m.",
            "12pm",
            "12 pm",
            "12p.m.",
            "12 p.m.",
            "12:00pm",
            "12:00 pm",
            "12:00 p.m.",
            "12:00p.m.",
            "1am",
            "1 am",
            "1a.m.",
            "1 a.m.",
            "01:00am",
            "01:00 am",
            "01:00 a.m.",
            "01:00a.m.",
            "2am",
            "2 am",
            "2a.m.",
            "2 a.m.",
            "02:00am",
            "02:00 am",
            "02:00 a.m.",
            "02:00a.m.",
            "3am",
            "3 am",
            "3a.m.",
            "3 a.m.",
            "03:00am",
            "03:00 am",
            "03:00 a.m.",
            "03:00a.m.",
            "4am",
            "4 am",
            "4a.m.",
            "4 a.m.",
            "04:00am",
            "04:00 am",
            "04:00 a.m.",
            "04:00a.m.",
            "5am",
            "5 am",
            "5a.m.",
            "5 a.m.",
            "05:00am",
            "05:00 am",
            "05:00 a.m.",
            "05:00a.m.",
            "6am",
            "6 am",
            "6a.m.",
            "6 a.m.",
            "06:00am",
            "06:00 am",
            "06:00 a.m.",
            "06:00a.m.",
            "7am",
            "7 am",
            "7a.m.",
            "7 a.m.",
            "07:00am",
            "07:00 am",
            "07:00 a.m.",
            "07:00a.m.",
            "8am",
            "8 am",
            "8a.m.",
            "8 a.m.",
            "08:00am",
            "08:00 am",
            "08:00 a.m.",
            "08:00a.m.",
            "9am",
            "9 am",
            "9a.m.",
            "9 a.m.",
            "09:00am",
            "09:00 am",
            "09:00 a.m.",
            "09:00a.m.",
            "10am",
            "10 am",
            "10a.m.",
            "10 a.m.",
            "10:00am",
            "10:00 am",
            "10:00 a.m.",
            "10:00a.m.",
            "11am",
            "11 am",
            "11a.m.",
            "11 a.m.",
            "11:00am",
            "11:00 am",
            "11:00 a.m.",
            "11:00a.m.",
            "12am",
            "12 am",
            "12a.m.",
            "12 a.m.",
            "12:00am",
            "12:00 pm",
            "12:00 a.m.",
            "12:00a.m.",
            "13",
            "13:00",
            "14",
            "14:00",
            "15",
            "15:00",
            "16",
            "16:00",
            "17",
            "17:00",
            "18",
            "18:00",
            "19",
            "19:00",
            "20",
            "20:00",
            "21",
            "21:00",
            "22",
            "22:00",
            "23",
            "23:00",
            "24",
            "24:00",
            "00",
            "00:00",
        };
    }
}
