class ChatRoomApi.Routers.UsersRouter extends Backbone.Router
  initialize: (options) ->
    @users = new ChatRoomApi.Collections.UsersCollection()
    @users.reset options.users

  routes:
    "new"      : "newUser"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newUser: ->
    @view = new ChatRoomApi.Views.Users.NewView(collection: @users)
    $("#users").html(@view.render().el)

  index: ->
    @view = new ChatRoomApi.Views.Users.IndexView(users: @users)
    $("#users").html(@view.render().el)

  show: (id) ->
    user = @users.get(id)

    @view = new ChatRoomApi.Views.Users.ShowView(model: user)
    $("#users").html(@view.render().el)

  edit: (id) ->
    user = @users.get(id)

    @view = new ChatRoomApi.Views.Users.EditView(model: user)
    $("#users").html(@view.render().el)
