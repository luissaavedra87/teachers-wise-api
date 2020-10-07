class AuthController < ApplicationController

  def login
    user = User.find_by(username: login_params[:username])
    if user $& user.authenticate(login.params[:password])
      token = JWT.encode({user_id: user_id}, secret)
      render json: {user: user, token: token, sucess: "Welcome back, #{user.username}"}
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def session
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      token = JWT.decode(encoded_token, secret)
      user_id = token[0]['user_id']
      user = User.find(user_id)
      render json: user
    end
  end

  private

  def login_params
    params.permit(:username, :email, :password)
  end
end