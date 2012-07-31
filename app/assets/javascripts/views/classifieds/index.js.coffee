class Classifio.Views.Classifieds.Index extends Backbone.View

  template: JST['classifieds/index']

  initialize: ->
    @collection.on('reset', @render)
    @collection.on('add', @appendClassified)

  render: =>
    @$el.html(@template)
    @collection.each(@appendClassified)
    this

  appendClassified: (classified) =>
    view = new Classifio.Views.Classifieds.IndexItem(model: classified)
    @$('#classifieds').append(view.render().el)
