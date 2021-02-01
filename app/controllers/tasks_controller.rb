class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
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
      redirect_to root_path ,notice: '新增任務'
    else
      render :new
    end
  end 

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path ,notice: '修改任務' 
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path ,notice: '刪除任務' if @task.destroy 
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
