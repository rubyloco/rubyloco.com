class EventsView
  constructor: ->
    @source = $("#event-template").html()
    @template = Handlebars.compile(@source)

  get_events: ->
    url = "http://api.meetup.com//2/events/?group_id=8825222&status=upcoming&order=time&limited_events=False&desc=false&offset=0&format=json&page=200&fields=&sig_id=9228642&sig=7e9df3f8cdbe03c41cb42ee8aa90def04e71bf68&callback=loadEvents"
    $.ajax url,
        dataType: 'jsonp'
        success: (data) =>
          @add_callout(data)
          @add_event(event) for event in data.results when @coming_soon(event.time)
          @remove_last_event_border()

  add_event: (event) ->
    event.date = moment(event.time).format('MM/DD/YYYY h:mma')
    event.description = event.description.replace(/<img\ssrc.+"><\/img>/, '')
    event.description = event.description.replace(/\<(\/)?p\>/g, '') 
    event.description = event.description.replace(/\<br(\s)?(\/)?\>/g, '')
    event.description = new Handlebars.SafeString(event.description)
    event.venue = { name:'TBD' } if event.venue == undefined
    #event.venue_url = "http://maps.google.com/maps?q=" + event.venue.address_1 + "+" + event.venue.city + "+" + event.venue.country if event.venue.name != "TBD"
    event.thumb_src = @thumb_src(event)
    $("#events").append @template(event)

  coming_soon: (time) ->
    moment(time).isBefore(moment().add('months', 2))

  thumb_src: (event) ->
    if event.name.indexOf("Lunch") > 0
      "http://photos1.meetupstatic.com/photos/event/b/a/6/0/global_263987712.jpeg"
    else
      "http://photos3.meetupstatic.com/photos/event/b/f/9/c/global_246409052.jpeg"

  add_callout: (data) ->

  remove_last_event_border: ->
    $("#events li .list-item-footer").last().css('border','none');

$ ->
  events_view = new EventsView
  events_view.get_events()

