class Classifio.Views.ClassifiedsNew extends Backbone.View

  template: JST['classifieds/new']

  events:
    'submit #new_classified': 'createClassified'

  render: ->
    @$el.html(@template)
    this

  createClassified: (event) ->
    event.preventDefault()
    attributes =
      title: $('#classified_title').val()
      description: $('#classified_description').val()
    options =
      wait: true
      success: @handleSuccess
      error: @handleError
    Classifio.classifieds.create(attributes, options)

  handleSuccess: (classified, response) ->
    Backbone.history.navigate("classifieds/" + classified.id, true)

  handleError: (classified, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      new Classifio.Views.Error(errors: errors).render()
