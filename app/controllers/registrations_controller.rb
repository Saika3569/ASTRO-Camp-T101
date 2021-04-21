class RegistrationsController < ApplicationController
  skip_before_action :check_session, only: [:new, :create]
  before_action :find_user,only:[:edit,:update,:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save   
      redirect_to root_path, notice: t('.notice')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)   
      redirect_to root_path, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name,:account,:password,:password_confirmation)
  end

  def find_user
    @user = User.find(current_user.id)
  end
end
