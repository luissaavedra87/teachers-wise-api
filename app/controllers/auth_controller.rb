class AuthController < ApplicationController

  def login
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login.params[:password])
      token = JWT.encode({user_id: user.id}, 'secret', 'HS256')
      render json: {user: user, token: token}, status: 200
    else
      render json: {errors: user.errors.full_messages}, status: 400
    end
  end

  def session
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      token = JWT.decode(encoded_token, 'secret')
      user_id = token[0]['user_id']
      user = User.find(user_id)
      render json: user
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end