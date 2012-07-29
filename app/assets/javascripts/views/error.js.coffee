class Classifio.Views.Error extends Backbone.View

  initialize: (options) ->
    @errors = options.errors

  render: ->
    @clearOldErrors()
    @renderErrors()
    this

  clearOldErrors: ->
    $(".error").removeClass("error")
    $("span.help-inline").remove()

  renderErrors: ->
    _.each(@errors, @renderError)

  renderError: (errors, attribute) =>
    field = @fieldFor(attribute)
    field.after(@errorTag(errors))
    field.closest('.control-group').addClass("error")

  errorTag: (errors) ->
    errorString = errors.join(", ")
    $("<span>").addClass("help-inline").text(errorString)

  fieldFor: (attribute) ->
    $("[id$='#{attribute}']")
