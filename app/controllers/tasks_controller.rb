class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def list
    @tasks = Task.all
  end
  def show
    @task = Task.find(params[:id])
  end
  def new
    task = Task.new
  end
  def create
      # TODO:
    # 1. Instancier une task object à partir de params[:task]
    task = Task.new(task_params)

    # 2. Save
    task.save
    redirect_to tasks_path(task)
  end

  def edit
  end
  def update
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end
  def destroy
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    # strong_params: whitelist params coming from potentially malicious user
    params.require(:task).permit(:title, :details)
  end

end

