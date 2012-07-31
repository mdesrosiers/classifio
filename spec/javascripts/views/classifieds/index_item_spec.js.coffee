describe "Classifio.Views.ClassifiedIndexItem", ->

  beforeEach ->
    @el = sandbox()
    @thumbnail_url = 'http://test.png'
    @classified = new Classifio.Models.Classified(
      title: 'foo'
      description: 'bar'
      thumbnail_url: @thumbnail_url)
    @view = new Classifio.Views.ClassifiedsIndexItem(el: @el, model: @classified)

  afterEach ->
    @view.remove()

  describe "render", ->
    it "returns the view object", ->
      expect(@view.render()).toEqual(@view)

    it "should contain an image tag for for the thumbnail url", ->
      @view.render()
      expect(@el.find('img')).toHaveAttr('src', @thumbnail_url)

