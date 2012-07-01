class Classifio.Routers.Classifieds extends Backbone.Router
  routes:
    '': 'index'
    'classifieds/new': 'new'
    'classifieds/:id': 'show'

  initialize: ->
    @collection = new Classifio.Collections.Classifieds
    @collection.reset($('#container').data('classifieds'))

  index: ->
    view = new Classifio.Views.ClassifiedsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    model = new Classifio.Models.Classified
      id: id
    model.fetch()
    view = new Classifio.Views.ClassifiedsShow(model: model)
    $('#container').html(view.render().el)

  new: ->
    view = new Classifio.Views.ClassifiedsNew
    $('#container').html(view.render().el)
