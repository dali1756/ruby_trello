class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to "/projects"
    end
  end

  def destroy
    @project = Project.find_by(id: params[:id])
    @project.destroy
    redirect_to "/"
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date)
  end
end
