describe "Classifio.Views.ClassifiedIndex", ->

  beforeEach ->
    @el = sandbox()
    @thumbnail_url = 'http://test.png'
    @classifieds = new Classifio.Collections.Classifieds([
      title: 'foo'
      description: 'bar'
      thumbnail_url: @thumbnail_url])
    @view = new Classifio.Views.ClassifiedsIndex(el: @el, collection: @classifieds)

  afterEach ->
    @view.remove()

  it "returns the view object", ->
      expect(@view.render()).toEqual(@view)

  it "should contain an image tag for for the thumbnail url", ->
    @view.render()
    expect(@el.find('img')).toHaveAttr('src', @thumbnail_url)
