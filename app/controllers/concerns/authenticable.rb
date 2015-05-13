module Authenticable


  # Devise methods overwrites
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated"}, status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    #with this current implementation it is easy to change your authentication method on this page
    current_user.present?
  end
end
