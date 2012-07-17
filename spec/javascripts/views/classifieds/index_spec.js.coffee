describe "Classifio.Views.ClassifiedIndex", ->
  @classifieds = null
  @view = null

  beforeEach ->
    @classifieds = new Classifio.Collections.Classifieds
    @view = new Classifio.Views.ClassifiedIndex(collection: @classifieds)

  it "should contain the the collection of classifieds", ->
    @view.render()
    expect(@view.$el).toBe("#classifieds")
