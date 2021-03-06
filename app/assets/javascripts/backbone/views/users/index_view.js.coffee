ChatRoomApi.Views.Users ||= {}

class ChatRoomApi.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  initialize: () ->
    @options.users.bind('reset', @addAll)

  addAll: () =>
    @options.users.each(@addOne)

  addOne: (user) =>
    view = new ChatRoomApi.Views.Users.UserView({model : user})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(users: @options.users.toJSON() ))
    @addAll()

    return this
