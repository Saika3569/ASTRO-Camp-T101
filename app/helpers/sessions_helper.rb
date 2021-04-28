module SessionsHelper
  def current_user 
    @current_user ||= User.find_by(id: session[:user114514])
  end

  def user_sign_in?
    current_user
  end
end
