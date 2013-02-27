#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.Jsonland =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    @router = new Jsonland.Routers.main()
    Backbone.history.start({pushState: true})

$ ->
  Jsonland.init()