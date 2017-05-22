class SessionsController < ApplicationController
  
  def login
  

  end

def create
user = User.find_by(email: params[:session][:email].downcase)
 if user && user.authenticate(params[:session][:password])
 	sign_in(user)
      redirect_to user_path(user.id)
    else
    	flash.now[:danger] = "Hahahahhaah Wrong password"
      render 'login'
    end

end

def delete
sign_out

end	

end
