class Jsonland.Views.Posts extends Backbone.View
  initialize: ->
    @collection = new Jsonland.Collections.Posts()
    @collection.fetch()
    @collection.on 'reset', @render, @
    @collection.on 'add', @render, @
    @form = ""

  events:
    'click .create-new':'create'

  addOne: (post) ->
    view = new Jsonland.Views.Post(model: post)
    ($ "#posts-table").append view.render().el

  render: ->
    @$el.html HandlebarsTemplates['posts']({})
    @collection.each(@addOne, @)
    @

  create: (e) ->
    e.preventDefault()
    @collection.create(Jsonland.jsonize($(@form)))
