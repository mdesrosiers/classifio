window.Classifio =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Classifio.Routers.Classifieds()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Classifio.init()
