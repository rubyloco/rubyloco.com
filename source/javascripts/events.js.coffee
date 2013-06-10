class EventsView
  constructor: ->
    @source = $("#event-template").html()
    @template = Handlebars.compile(@source)

  get_events: ->
    url = "http://api.meetup.com//2/events/?group_id=8825222&status=upcoming&order=time&limited_events=False&desc=false&offset=0&format=json&page=200&fields=&sig_id=9228642&sig=7e9df3f8cdbe03c41cb42ee8aa90def04e71bf68&callback=loadEvents"
    $.ajax url,
        dataType: 'jsonp'
        success: (data) =>
          @add_event event for event in data.results

  add_event: (event) ->
    d = new Date(event.time)
    t = d.getHours()+ ":" +  d.getMinutes()
    event.date = d.getMonth() + "-" + d.getDate() + "-" + d.getFullYear() + " " + t
    event.description = new Handlebars.SafeString(event.description)
    $("#events").append @template(event)

$ ->
  events_view = new EventsView
  events_view.get_events()

