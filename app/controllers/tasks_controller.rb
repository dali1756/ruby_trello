class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @lane = Lane.find(params[:task][:lane_id])
    @task = @lane.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to project_path(@lane.project)
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(id: params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to project_path(@project)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(@task.lane.project)
  end

  private

  def task_params
    params.require(:task).permit(:name, :lane_id, :priority, :level, :status, :end_date, :description)
  end
end
