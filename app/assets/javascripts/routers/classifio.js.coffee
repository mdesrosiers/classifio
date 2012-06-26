class Classifio.Routers.Classifieds extends Backbone.Router
  routes:
    '': 'index'
    'classifieds/:id': 'show'

  initialize: ->
    @collection = new Classifio.Collections.Classifieds()
    @collection.reset($('#container').data('classifieds'))

  index: ->
    view = new Classifio.Views.ClassifiedsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Classified #{id}"
