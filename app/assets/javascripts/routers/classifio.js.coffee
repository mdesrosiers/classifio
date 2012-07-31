class Classifio.Routers.Classifieds extends Backbone.Router
  routes:
    '': 'index'
    'classifieds/new': 'new'
    'classifieds/:id': 'show'

  initialize: ->
    Classifio.classifieds = new Classifio.Collections.Classifieds
    Classifio.classifieds.reset($('#container').data('classifieds'))
    header = new Classifio.Views.Header.Show
    $('#header').html(header.render().el)

  index: ->
    view = new Classifio.Views.Classifieds.Index(collection: Classifio.classifieds)
    $('#container').html(view.render().el)

  show: (id) ->
    model = Classifio.classifieds.get(id)
    view = new Classifio.Views.Classifieds.Show(model: model)
    $('#container').html(view.render().el)

  new: ->
    view = new Classifio.Views.Classifieds.New
    $('#container').html(view.render().el)
