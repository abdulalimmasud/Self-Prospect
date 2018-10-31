using Hoxro.Data.Models;
using Hoxro.Entity.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Task = System.Threading.Tasks.Task;

namespace Hoxro.Service.userDefinedService.provider
{
    public interface ICalendarGraphService
    {

        Task<dynamic> GetCalendars(Provider provider);
        Task<dynamic> GetEvents(Provider provider, string calenderId, string calendarName, DateTime from, DateTime to);
        Task<dynamic> CreateEvent(EventWrapper wrapper);
        Task<dynamic> UpdateEvent(EventWrapper wrapper);
        Task<bool> DeleteEvent(EventWrapper wrapper);
    }
}
