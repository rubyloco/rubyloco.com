class SponsorsView
  constructor: ->
    @source = $("#sponsor-template").html()
    @template = Handlebars.compile(@source)

  get_sponsors: ->
    url = "http://api.meetup.com/2/groups?group_id=8825222&radius=25.0&order=id&desc=false&offset=0&format=json&page=500&fields=sponsors&sig_id=13745894&sig=288da9174a8ce352ee1bdc0af34013592d49f612&callback=loadSponsors"
    $.ajax url,
        dataType: 'jsonp'
        success: (data) =>
          @add_sponsor sponsor for sponsor in data.results[0].sponsors

  add_sponsor: (sponsor) ->
    $("#sponsors").append @template(sponsor)

$ ->
  if $("#sponsors").length > 0
    sponsors_view = new SponsorsView
    sponsors_view.get_sponsors()
