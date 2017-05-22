class ApplicationController < ActionController::Base
	include SessionsHelper
  protect_from_forgery with: :exception

def sign_in(user)
user.remember
cookies.permanent[:remember_token] = user.remember_token
current_user
end

def current_user

@current_user ||= User.find_by(remember_token: cookies[:remember_token])

end	


def current_user?(user)
@current_user == user
end	

def sign_out
@current_user = nil 
cookies.delete(:remember_token)
redirect_to root_path
end	

def signed_in?
if cookies[:remember_token]

else
flash[:danger] = "You must be logged in"	
redirect_to login_path

end
end	

end
