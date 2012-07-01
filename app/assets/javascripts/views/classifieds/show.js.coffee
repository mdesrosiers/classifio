class Classifio.Views.ClassifiedsShow extends Backbone.View

  template: JST['classifieds/show']

  tagName: 'li'

  events:
    'click': 'showClassified'

  initialize: ->
    @model.on('change', @render, this)

  showClassified: ->
    Backbone.history.navigate("classifieds/#{@model.get('id')}", true)

  render: ->
    $(@el).html(@template(classified: @model))
    this
