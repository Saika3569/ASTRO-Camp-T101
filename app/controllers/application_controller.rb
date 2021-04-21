class ApplicationController < ActionController::Base
  include SessionsHelper
  
  before_action :set_locale, :check_session



  def check_session 
    redirect_to sign_in_users_path if not session[:user114514]
  end

  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end 
    I18n.locale = session[:locale] || I18n.default_locale
  end
end



