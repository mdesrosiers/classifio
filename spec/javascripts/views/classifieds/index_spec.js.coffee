describe "Classifio.Views.ClassifiedIndex", ->

  beforeEach ->
    @el = sandbox()
    @thumbnail_url = 'http://test.png'
    @classifieds = new Classifio.Collections.Classifieds([{}, {}])
    @view = new Classifio.Views.ClassifiedsIndex(el: @el, collection: @classifieds)

  afterEach ->
    @view.remove()

  describe "render", ->
    it "returns the view object", ->
      expect(@view.render()).toEqual(@view)

    it "should append a classified for each item in the collection", ->
      spyOn(@view, 'appendClassified')
      @view.render()
      expect(@view.appendClassified.calls.length).toEqual(@classifieds.length)
