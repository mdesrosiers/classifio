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
    $(@el).html(@template(classified: @model))
    this

  initUploader: ->
    uploadOptions =
      prefix: 'image'
      accept: 'json'
      beforeSend: (xhr) ->
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      url: "/api/classifieds/" + @model.get('id') + "/image"
      success: @uploadSuccess

    @uploader = new uploader(@uploadInput(), uploadOptions)

  uploadInput: ->
    return @$('#image-upload input').get(0)

  upload: ->
    @initUploader()
    @uploader.send()

  uploadSuccess: (event) =>
    @model.fetch()
