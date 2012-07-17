describe "Classifio.Models.Classified", ->

  beforeEach ->
    @classified = new Classifio.Models.Classified

  it "should be defined", ->
    expect(Classifio.Models.Classified).toBeDefined()

  it "can be instantiated", ->
    expect(@classified).not.toBeNull()
