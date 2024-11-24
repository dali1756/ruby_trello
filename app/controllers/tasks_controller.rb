class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @lane = Lane.find(params[:task][:lane_id])
    @task = @lane.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to project_path(@lane.project)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(@task.lane.project)
  end

  private

  def task_params
    params.require(:task).permit(:name, :lane_id, :priority, :level, :status, :end_date)
  end
end
