class Classifio.Views.ClassifiedsNew extends Backbone.View

  template: JST['classifieds/new']

  events:
    'submit #new_classified': 'createClassified'

  render: ->
    $(@el).html(@template())
    this

  createClassified: (event) ->
    event.preventDefault()
    attributes =
      title: $('#new_classified_title').val()
      description: $('#new_classified_description').val()
    @collection.create attributes,
      wait: true
      success: -> $('#new_classified')[0].reset()
      error: @handleError

  handleError: (classified, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
