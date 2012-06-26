class Classifio.Views.ClassifiedsIndex extends Backbone.View

  template: JST['classifieds/index']

  events:
    'submit #new_classified': 'createClassified'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendClassified)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendClassified)
    this

  appendClassified: (classified) =>
    view = new Classifio.Views.ClassifiedsShow(model: classified)
    @$('#classifieds').append(view.render().el)

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
