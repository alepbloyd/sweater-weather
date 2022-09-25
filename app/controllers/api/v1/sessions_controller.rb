class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: session_params[:email])

    if user.present? && user.authenticate(session_params[:password])
      render json: UserSerializer.new(user).response, status: 200
    else

    end

  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

end