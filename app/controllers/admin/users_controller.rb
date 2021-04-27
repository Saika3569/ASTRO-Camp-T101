class Admin::UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :destroy]
  after_action :verify_authorized

  def index
    authorize User
    @users = User.all.includes(:tasks).page(params[:page]).per(5)
  end

  def new
    authorize User
    @user = User.new
  end

  def create
    authorize User
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_root_path, notice: t('.notice')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_root_path, notice: t('.notice')
    else
      render :edit
    end
  end

  def show
    @q = @user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).includes(:user).page(params[:page]).per(5)
  end

  def destroy
    @user.destroy
    redirect_to admin_root_path, notice: t('.notice')
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end
end
