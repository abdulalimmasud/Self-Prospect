using System;
using System.Collections.Generic;
using System.Text;
using Hoxro.Data.Models;
using System.Threading.Tasks;
using Task = System.Threading.Tasks.Task;
using Microsoft.Graph;
using Hoxro.Utiltiy.Converter;
using System.Net.Http;
using Newtonsoft.Json;
using System.Linq;
using Hoxro.Entity.ViewModels;

namespace Hoxro.Service.userDefinedService.provider
{
    public class OutlookCalendarGraphService:ICalendarGraphService
    {
        readonly IProviderHelper _providerHelper;
        public OutlookCalendarGraphService(IProviderHelper providerHelper)
        {
            _providerHelper = providerHelper;
        }

        public async Task<dynamic> GetCalendars(Provider provider)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(provider.AccessToken);

                var response = await graphClient.Me.Calendars.Request()
                                        //.Select(x => new Microsoft.Graph.Calendar
                                        //{
                                        //    //Color = x.Color,
                                        //    Id = x.Id,
                                        //    Name = x.Name,
                                        //    //Owner = x.Owner,
                                        //    //CalendarView = x.CalendarView,
                                        //    //CanEdit = x.CanEdit
                                        //})
                                        .GetAsync();
                foreach (var item in response)
                {
                    if(item.Name == "Calendar")
                    {
                        item.Name = provider.Email;
                    }
                }
                //response.Where(x => x.Name == "Calendar").FirstOrDefault().Name.Replace("Calendar", provider.Email);
                return await Task.FromResult(response);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> GetEvents(Provider provider, string calenderId, string calendarName, DateTime from, DateTime to)
        {
            try
            {
                string strFilterDateRange = CalederDateFilterFormat(from, to);
                string url = $" https://graph.microsoft.com/v1.0/users/me/calendars/{calenderId}/events?$filter={strFilterDateRange}";
                using(var response = await SDKHelper.SendRequest(HttpMethod.Get, url, provider.AccessToken))
                {
                    var result = await response.Content.ReadAsStringAsync();
                    var content = JsonConvert.DeserializeObject<RetriveEvent>(result);
                    var events = OutlookToHoxroEvents(content.Value, calenderId, calendarName);
                    return await Task.FromResult(events);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> CreateEvent(EventWrapper wrapper)
        {
            try
            {
                var model = wrapper.Event;
                Microsoft.Graph.Event @event = new Microsoft.Graph.Event
                {
                    Subject = model.Name ?? "",
                    Start = new Microsoft.Graph.DateTimeTimeZone { TimeZone = wrapper.TimeZoneName, DateTime = Convert.ToDateTime(model.EventDate).ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'") },
                    End = new Microsoft.Graph.DateTimeTimeZone { TimeZone = wrapper.TimeZoneName, DateTime = Convert.ToDateTime(model.EventDateEnd).ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'") },
                    ShowAs = StringConverter.ToEnum<FreeBusyStatus>(model.Status ?? "Unknown"),
                    Body = new ItemBody { Content = model.Description ?? "" },
                    //IsReminderOn = model.Reminders.Count > 0 ? true : false,
                    Location = new Location { DisplayName = model.Location ?? "" },
                    OriginalStartTimeZone = wrapper.TimeZoneName,
                    OriginalEndTimeZone = wrapper.TimeZoneName,
                    ResponseStatus = new ResponseStatus {  Time = Convert.ToDateTime(Convert.ToDateTime(model.EventDate).ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'")) }
                };

                

                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(wrapper.Provider.AccessToken);
                var response = await graphClient.Me.Calendars[wrapper.CalendarId].Events.Request().AddAsync(@event);
                var eventObj = OutlookToHoxroEvent(response, wrapper.CalendarId);
                return await Task.FromResult(eventObj);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> DeleteEvent(EventWrapper wrapper)
        {
            try
            {
                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(wrapper.Provider.AccessToken);
                await graphClient.Me.Events[wrapper.Event.Id].Request().DeleteAsync();
                return await Task.FromResult(true);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<dynamic> UpdateEvent(EventWrapper wrapper)
        {
            try
            {
                var model = wrapper.Event;
                Microsoft.Graph.Event @event = new Microsoft.Graph.Event
                {
                    Subject = model.Name ?? "",
                    Start = new Microsoft.Graph.DateTimeTimeZone { TimeZone = wrapper.TimeZoneName, DateTime = Convert.ToDateTime(model.EventDate).ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'") },
                    End = new Microsoft.Graph.DateTimeTimeZone { TimeZone = wrapper.TimeZoneName, DateTime = Convert.ToDateTime(model.EventDateEnd).ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'") },
                    ShowAs = StringConverter.ToEnum<FreeBusyStatus>(model.Status ?? "Unknown"),
                    Body = new ItemBody { Content = model.Description ?? "" },
                    Location = new Location { DisplayName = model.Location ?? "" },
                    OriginalStartTimeZone = wrapper.TimeZoneName,
                    OriginalEndTimeZone = wrapper.TimeZoneName,
                    ResponseStatus = new ResponseStatus { Time = Convert.ToDateTime(Convert.ToDateTime(model.EventDate).ToString("yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'fff'Z'")) }
                };



                GraphServiceClient graphClient = SDKHelper.GetMicrosoftAuthenticatedClient(wrapper.Provider.AccessToken);
                var response = await graphClient.Me.Events[model.Id].Request().UpdateAsync(@event);
                var eventObj = OutlookToHoxroEvent(response, wrapper.CalendarId);
                return await Task.FromResult(eventObj);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private string CalederDateFilterFormat(DateTime from, DateTime to)
        {
            string strFilterDateRange = String.Format(
                                                "start/dateTime ge '{0}T00:00' and end/dateTime le '{1}T23:59'",
                                                from.ToString("yyyy-MM-dd"),
                                                to.ToString("yyyy-MM-dd"));
            return strFilterDateRange;
        }
        private string EventFilterText(string text)
        {
            string strFilterText = String.Format("subject eq '{0}' or bodypreview eq '{1}'", text);
            return strFilterText;
        }
        private List<Data.Models.Event> OutlookToHoxroEvents(List<Microsoft.Graph.Event> outlookEvents, string calendarId, string calendarName)
        {
            return outlookEvents.Select(x => new Data.Models.Event
            {
                Id = x.Id,
                Name = x.Subject,
                Description = x.Body.Content,
                EventDate = Convert.ToDateTime(x.Start.DateTime),
                EventDateEnd = Convert.ToDateTime(x.End.DateTime),
                IsProvider = true,
                CalId = calendarId,
                CalendarName = calendarName
            }).ToList();
        }
        private Data.Models.Event OutlookToHoxroEvent(Microsoft.Graph.Event outlookEvent, string calendarId)
        {
            return  new Data.Models.Event
            {
                Id = outlookEvent.Id,
                Name = outlookEvent.Subject,
                Description = outlookEvent.Body.Content,
                EventDate = Convert.ToDateTime(outlookEvent.Start.DateTime),
                EventDateEnd = Convert.ToDateTime(outlookEvent.End.DateTime),
                IsProvider = true,
                CalId = calendarId
            };
        }

        private class RetriveEvent
        {
            public List<Microsoft.Graph.Event> Value { get; set; }
        }
    }
}
