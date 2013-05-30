get_events = ->
  url = "http://api.meetup.com/2/events/?group_id=1815773&status=upcoming&order=time&limited_events=False&desc=false&offset=0&format=json&page=200&fields=&sig_id=9228642&sig=f99269d939e056eee5ec9852160b9027f95dfd5f&callback=loadEvents"
  $.ajax url,
      dataType: 'jsonp'
      success: (data) ->
        load_events(data)

load_events = (response) ->
  append_li evt for evt in response.results

append_li = (evt) ->
  eventDate = new Date(evt.time);
  li = "<li class='event'>Date: " + eventDate + "Name: " + evt.name + "<span='description'>" + evt.description + "</span></li>"
  $("#events").append(li)

$ ->
  get_events()