class Classifio.Views.ClassifiedsIndex extends Backbone.View

  template: JST['classifieds/index']

  initialize: ->
    @collection.on('reset', @render)
    @collection.on('add', @appendClassified)

  render: =>
    @$el.html(@template)
    @collection.each(@appendClassified)
    this

  appendClassified: (classified) =>
    view = new Classifio.Views.ClassifiedsIndexItem(model: classified)
    @$('#classifieds').append(view.render().el)
