describe "Classifio.Views.ClassifiedIndex", ->

  beforeEach ->
    @el = sandbox()
    @thumbnail_url = 'http://test.png'
    @classifieds = new Classifio.Collections.Classifieds([
      title: 'foo'
      description: 'bar'
      thumbnail_url: @thumbnail_url])
    @view = new Classifio.Views.ClassifiedsIndex(el: @el, collection: @classifieds)

  it "should contain the the collection of classifieds", ->
    @view.render()
    expect(@el.html()).toContain(@thumbnail_url)
