class Classifio.Views.ClassifiedsShow extends Backbone.View

  template: JST['classifieds/show']

  events:
    'click': 'showClassified'
    'click #image-upload button': 'upload'

  initialize: ->
    @model.on('change', @render)

  showClassified: ->
    Backbone.history.navigate("classifieds/#{@model.get('id')}", true)

  render: =>
    @renderTemplate()
    @renderImage()
    this

  renderTemplate: ->
    $(@el).html(@template(classified: @model))

  renderImage: ->
    thumbnail = @model.get('thumbnail_url')

    if thumbnail?
      image = @$('#image')
      image.html('<img>')
      $('img', image).attr("src", thumbnail)

  initUploader: ->
    uploadOptions =
      prefix: 'image'
      accept: 'json'
      url: "/api/classifieds/" + @model.get('id') + "/image"
      success: @uploadSuccess
      beforeSend: (xhr) ->
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))

    @uploader = new uploader(@uploadInput(), uploadOptions)

  uploadInput: ->
    return @$('#image-upload input').get(0)

  upload: ->
    @initUploader()
    @uploader.send()

  uploadSuccess: (event) =>
    @model.fetch()
