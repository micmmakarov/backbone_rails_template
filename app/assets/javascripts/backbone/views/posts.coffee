class Jsonland.Views.Posts extends Backbone.View
  initialize: ->
    @collection = new Jsonland.Collections.Posts()
    @collection.fetch()
    @collection.on 'reset', @render, @
    @collection.on 'add', @render, @
    @form = ""

  events:
    'click .submit':'create'

  addOne: (post) ->
    view = new Jsonland.Views.Post(model: post)
    ($ "#posts-table").append view.render().el

  render: ->
    @$el.html HandlebarsTemplates['posts']({})
    ($ "#create_new").prepend HandlebarsTemplates['new_post']({})
    @collection.each(@addOne, @)
    @

  create: (e) ->
    title = $("")
    @collection.create(Jsonland.jsonize($(@form)))
    $(@form).find("input").val("")
