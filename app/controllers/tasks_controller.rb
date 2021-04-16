class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :pend, :progress, :finish]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
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

  def pend
    @task.pend!
    redirect_to root_path 
  end

  def progress
    @task.progress!
    redirect_to root_path 
  end

  def finish
    @task.finish!
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
