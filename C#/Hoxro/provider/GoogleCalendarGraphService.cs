using System;
using System.Collections.Generic;
using System.Text;
using Hoxro.Data.Models;
using System.Threading.Tasks;
using Task = System.Threading.Tasks.Task;
using System.Linq;
using Hoxro.Entity.ViewModels;

namespace Hoxro.Service.userDefinedService.provider
{
    public class GoogleCalendarGraphService:ICalendarGraphService
    {
        readonly IProviderHelper _providerHelper;
        public GoogleCalendarGraphService(IProviderHelper providerHelper)
        {
            _providerHelper = providerHelper;
        }

        public async Task<dynamic> GetCalendars(Provider provider)
        {
            try
            {
                var service = SDKHelper.GoogleCalendarService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var response = await service.CalendarList.List().ExecuteAsync();
                if (response != null)
                {
                    var items = response.Items.Where(x=> !x.Id.Contains("#")).Select(x => new
                    {
                        Id = x.Id,
                        Name = x.Id                        
                    }).ToList();
                    return await Task.FromResult(items);
                }
                return null;
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
                var service = SDKHelper.GoogleCalendarService(provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);
                var request = service.Events.List(calenderId);
                //request.OrderBy = Google.Apis.Calendar.v3.EventsResource.ListRequest.OrderByEnum.StartTime;
                request.TimeMin = from;
                request.TimeMax = to;
                var response = await request.ExecuteAsync();
                if (response != null)
                {
                    var events = response.Items.Select(x=> new Data.Models.Event{
                        Id = x.Id,
                        Name = x.Summary,
                        Description = x.Description,
                        EventDate = x.Start.DateTime == null ? Convert.ToDateTime(x.Start.Date) : x.Start.DateTime,
                        EventDateEnd = x.End.DateTime == null ? Convert.ToDateTime(x.End.Date): x.End.DateTime,
                        IsProvider = true,
                        CalId = calenderId,
                        CalendarName = calendarName
                    }).ToList();
                    return await Task.FromResult(events);
                }
                return null;
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
                var @event = new Google.Apis.Calendar.v3.Data.Event
                {
                    Summary = model.Name ?? "",
                    Location = model.Location == null ? "" : model.Location,
                    Description = model.Description,
                    Start = new Google.Apis.Calendar.v3.Data.EventDateTime { DateTime = model.EventDate},
                    End = new Google.Apis.Calendar.v3.Data.EventDateTime { DateTime = model.EventDateEnd},
                    //Status = model.Status ?? ""
                };

                var service = SDKHelper.GoogleCalendarService(wrapper.Provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);

                var eventRequest = service.Events.Insert(@event, wrapper.CalendarId).Execute();
                model.Id = eventRequest.Id;
                model.IsProvider = true;
                model.CalId = wrapper.CalendarId;
                return await Task.FromResult(model);
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
                var @event = new Google.Apis.Calendar.v3.Data.Event
                {
                    Summary = model.Name ?? "",
                    Location = model.Location == null ? "" : model.Location,
                    Description = model.Description,
                    Start = new Google.Apis.Calendar.v3.Data.EventDateTime { DateTime = model.EventDate },
                    End = new Google.Apis.Calendar.v3.Data.EventDateTime { DateTime = model.EventDateEnd },
                    //Status = model.Status ?? ""
                };

                var service = SDKHelper.GoogleCalendarService(wrapper.Provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);

                var eventRequest = service.Events.Update(@event, wrapper.CalendarId, model.Id).Execute();
                //model.Id = eventRequest.Id;
                model.IsProvider = true;
                model.CalId = wrapper.CalendarId;
                return await Task.FromResult(model);
                
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
                
                var service = SDKHelper.GoogleCalendarService(wrapper.Provider.RefreshToken, _providerHelper.GoogleClientId, _providerHelper.GoogleClientSecretCode, _providerHelper.GoogleProjectName);

                var deleteResponse = service.Events.Delete(wrapper.CalendarId, wrapper.Event.Id).Execute();
                
                return await Task.FromResult(true);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
