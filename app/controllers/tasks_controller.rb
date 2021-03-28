class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:order]
      @tasks = Task.with_order(params[:order])
    elsif params[:end_at]
      @tasks = Task.with_end(params[:end_at])
    else 
      @tasks = Task.with_order
    end
  end
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    # 之後要能修改所屬user
    @task = User.first.tasks.new(task_params)
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

  private
  def task_params
    params.require(:task).permit(:title, :content, :priority,:start_at, :end_at)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
