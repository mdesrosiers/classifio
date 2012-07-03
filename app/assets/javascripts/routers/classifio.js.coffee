class Classifio.Routers.Classifieds extends Backbone.Router
  routes:
    '': 'index'
    'classifieds/new': 'new'
    'classifieds/:id': 'show'

  initialize: ->
    Classifio.classifieds = new Classifio.Collections.Classifieds
    Classifio.classifieds.reset($('#container').data('classifieds'))
    header = new Classifio.Views.HeaderShow
    $('#header').html(header.render().el)

  index: ->
    view = new Classifio.Views.ClassifiedsIndex(collection: Classifio.classifieds)
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
