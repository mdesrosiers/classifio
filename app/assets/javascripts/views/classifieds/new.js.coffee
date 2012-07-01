class Classifio.Views.ClassifiedsNew extends Backbone.View

  template: JST['classifieds/new']

  events:
    'submit #new_classified': 'createClassified'

  render: ->
    $(@el).html(@template)
    this

  createClassified: (event) ->
    event.preventDefault()
    classified = new Classifio.Models.Classified
      title: $('#new_classified_title').val()
      description: $('#new_classified_description').val()
    classified.save {},
      success: -> Backbone.history.navigate("classifieds/" + classified.id, true)
      error: @handleError

  handleError: (classified, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages
