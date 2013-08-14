class PhotosView
  constructor: ->
    @source = $("#photo-template").html()
    @template = Handlebars.compile(@source)

  get_photos: ->
    url = "http://api.meetup.com/2/photos/?group_id=8825222&order=time&desc=True&offset=0&format=json&page=200&fields=&sig_id=9228642&sig=05f5138c0ffcee4bbbbd69a33edb6e591f6bcc0b&callback=loadPhotos"
    $.ajax url,
        dataType: 'jsonp'
        success: (data) =>
          @add_photo(photo) for photo in data.results

  add_photo: (photo) ->
    photo.date = moment(photo.created).format('MMM DD, YYYY')
    $("#photos").append @template(photo)

$ ->
  if $("#photos").length > 0
    photos_view = new PhotosView
    photos_view.get_photos()
