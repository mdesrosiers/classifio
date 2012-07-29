class Classifio.Views.HeaderShow extends Backbone.View

  template: JST['header/show']

  events:
    'click #brand-header-link': 'home'
    'click #new-classified-header-link': 'newClassified'

  initialize: ->
    @render

  home: (event) ->
    event.preventDefault
    Backbone.history.navigate("", true)

  newClassified: (event) ->
    event.preventDefault
    Backbone.history.navigate("classifieds/new", true)

  render: ->
    @$el.html(@template)
    this
