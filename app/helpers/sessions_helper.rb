module SessionsHelper
  def current_user 
    @user_114514 ||= User.find_by(id: session[:user114514])
  end

  def user_sign_in?
    if current_user
      true
    else
      false
    end
  end
end
