class Api::V1::SessionsController < ApplicationController

  def create
   user = User.find_by(email: session_params[:email])
   # require 'pry'; binding.pry
   if user.present? && user.authenticate(session_params[:password])
     render json: UserSerializer.new(user), status: 200
   else
     render :json => {:error => "Login failed"}, :status => 400
   end

 end

     private

  def session_params
    params.require(:session).permit(:email, :password, :password_confirmation)
  end

end
