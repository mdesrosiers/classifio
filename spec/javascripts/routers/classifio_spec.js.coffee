describe "Classifio.Routers.Classifieds", ->

  beforeEach ->
    @router = new Classifio.Routers.Classifieds

    try
      Backbone.history.start
        silent:true
        pushState:true
    catch e

    spyOn(@router, "route:index")

    @router.navigate "elsewhere"

  it "fires the index route with a blank hash", ->
    @router.bind("route:index", @routeSpy)
    @router.navigate("", true)
    expect(@route).toHaveBeenCalled()
