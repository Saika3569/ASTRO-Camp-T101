class SessionsController < ApplicationController
  skip_before_action :check_session, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user114514] = @user.id
      redirect_to root_path, notice: t('.notice')
    else
      redirect_to sign_in_users_path
    end
  end

  def destroy
    session[:user114514] = nil
    redirect_to root_path, notice: t('.notice')
  end
end
