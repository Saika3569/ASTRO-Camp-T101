class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :update_state]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page]).per(5)
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

  def  update_state
    case params[:state]
    when 'pend'
      @task.pend!
      redirect_to root_path 
    when 'progress'
      @task.progress!
      redirect_to root_path 
    when 'finish'
      @task.finish!
      redirect_to root_path 
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :priority,:start_at, :end_at, :state)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
