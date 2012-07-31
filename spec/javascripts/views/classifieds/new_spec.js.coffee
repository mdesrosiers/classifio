describe "Classifio.Views.ClassifiedNew", ->

  beforeEach ->
    @el = "<div></div>"
    @view = new Classifio.Views.ClassifiedsNew(el: @el)
    Classifio.classifieds = new Classifio.Collections.Classifieds

  afterEach ->
    @view.remove()

  describe "render", ->
    it "returns the view object", ->
      expect(@view.render()).toEqual(@view)

  describe "createClassified", ->
    beforeEach ->
      @event = jasmine.createSpyObj('event', ['preventDefault'])

    xit "adds a classified to the global collection", ->
      @view.createClassified(@event)
      expect(Classifio.classifieds.length).toEqual(1)
