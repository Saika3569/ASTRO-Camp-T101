class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :update_state]

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).includes(:user).page(params[:page]).per(5)
  end
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save 
      redirect_to root_path ,notice: t('.notice')
    else
      render :new
    end
  end 

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path ,notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path ,notice: t('.notice') if @task.destroy 
  end

  def update_state
    @task.send(params[:state])
    @task.save
    redirect_to root_path 
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :priority,:start_at, :end_at, :state)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
