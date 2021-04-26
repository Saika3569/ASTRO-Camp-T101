class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pundit
  
  before_action :set_locale, :check_session

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  

  def check_session 
    redirect_to sign_in_users_path if not session[:user114514]
  end

  private

  def user_not_authorized(e)
    if e.record
      flash[:notice] = I18n.t('.pundit.default')
    else
      flash[:notice] = e.message
    end
    redirect_to request.referrer || root_path 
  end

  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end 
    I18n.locale = session[:locale] || I18n.default_locale
  end
end



