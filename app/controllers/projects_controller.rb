class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.save
      redirect_to root_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @lanes = @project.lanes.includes(:tasks)
  end

  def destroy
    @project = Project.find_by(id: params[:id])
    if @project.destroy
      redirect_to root_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date)
  end
end
