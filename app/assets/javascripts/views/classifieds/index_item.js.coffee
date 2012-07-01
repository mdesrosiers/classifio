class Classifio.Views.ClassifiedsIndexItem extends Backbone.View

  tagName: 'li'

  events:
    'click': 'showClassified'

  initialize: ->
    @model.on('change', @render)

  showClassified: ->
    Backbone.history.navigate("classifieds/#{@model.get('id')}", true)

  render: =>
    $(@el).html(@model.get('title'))
    this
