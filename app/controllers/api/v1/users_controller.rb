class Api::V1::UsersController < ApplicationController

  def create
    # require 'pry'; binding.pry 

    user = User.new(user_params)

    if user.save
      user.update(api_key: SecureRandom.hex)
      render json: UserSerializer.new(user).response, status: 201
    elsif User.exists?(email: user_params[:email].downcase)
      render :json => {:error => "Oops user creation failed (email taken)"}.to_json, :status => 400 
    elsif user_params[:password] != user_params[:password_confirmation]
      render :json => {:error => "Oops user creation failed (password and confirmation mismatch"}.to_json, :status => 400
    elsif EmailValidator.valid?(user_params[:email]) == false
      render :json => {:error => "Oops user creation failed (bad email)"}.to_json, :status => 400
    else
      render :json => {:error => "I honestly don't know what you did to break it this badly"}.to_json, :status => 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end