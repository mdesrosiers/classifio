class Classifio.Views.ClassifiedsIndexItem extends Backbone.View

  template: JST['classifieds/index_item']

  tagName: 'li'

  events:
    'click': 'showClassified'

  initialize: ->
    @model.on('change', @render)

  showClassified: ->
    Backbone.history.navigate("classifieds/#{@model.get('id')}", true)

  render: =>
    $(@el).html(@template(classified: @model))
    this
