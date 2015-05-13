class ChatRoomApi.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    email: null

class ChatRoomApi.Collections.UsersCollection extends Backbone.Collection
  model: ChatRoomApi.Models.User
  url: '/users'
