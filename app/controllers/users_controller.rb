class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def appoinments
    @user = User.find(params[:id])
    @appoinments = @user.appoinments
    render json: @appoinments
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = JWT.encode({ user_id: @user.id }, 'secret', 'HS256')
      render json: { user: @user, token: token }
    else
      render json: { error: 'Unable to create new user' }, status: 400
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy if @user.present?
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user
      if @user.authenticate(user_params[:password])
        token = JWT.encode({ user_id: @user.id }, 'secret', 'HS256')
        render json: { user: @user, token: token }, status: 200
      else
        render json: { error: 'Invalid Credentials' }, status: 400
      end
    else
      render json: { error: 'Not a user' }, status: 400
    end
  end

  # rubocop:disable Style/GuardClause
  def auto_login
    if request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      token = JWT.decode(encoded_token, 'secret', true, algorithm: 'HS256')
      user_id = token[0]['user_id']
      @user = User.find(user_id)
      render json: @user
    end
  end
  # rubocop:enable Style/GuardClause

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
