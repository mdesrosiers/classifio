window.Classifio =
  Models: {}
  Collections: {}
  Views: {
    Classifieds: {}
    Header: {}
  }
  Routers: {}
  init: ->
    new Classifio.Routers.Classifieds()
    Backbone.history.start(pushState: true)
