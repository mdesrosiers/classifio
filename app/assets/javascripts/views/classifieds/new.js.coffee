class Classifio.Views.ClassifiedsNew extends Backbone.View

  template: JST['classifieds/new']

  events:
    'submit #new_classified': 'createClassified'

  render: ->
    $(@el).html(@template)
    this

  createClassified: (event) ->
    event.preventDefault()
    attributes =
      title: $('#new_classified_title').val()
      description: $('#new_classified_description').val()
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
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
