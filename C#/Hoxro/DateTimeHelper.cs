using System;

namespace Hoxro.Utiltiy.Helper
{
    public static class DateTimeHelper
    {
        public static bool IsSameDay(DateTime firstDate, DateTime secondDate)
        {
            if (firstDate == null)
            {
                return false;
            }
            return (firstDate.Year == secondDate.Year && firstDate.Month == secondDate.Month && firstDate.Day == secondDate.Day);
        }
        public static double HourDurations(DateTimeOffset firstDate, DateTimeOffset secondDate)
        {
            var hours = (firstDate - secondDate).TotalHours;
            return hours;
        }
    }
}
