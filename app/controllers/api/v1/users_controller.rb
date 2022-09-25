class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user).response, status: 201
    elsif User.exists?(email: user_params[:email])
      render :json => {:error => "Oops user creation failed (email taken)"}.to_json, :status => 400 
    end
  end

  def login
    user = User.find_by(email: user_params[:email])
    if user.authenticate(user_params[:password])
      session[:user_id] = user.id
    else

    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end