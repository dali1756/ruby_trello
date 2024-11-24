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
    if @lanes.empty?
      %w[待處理 進行中 已完成].each do |name|
        @project.lanes.create(name: name)
      end
      @lanes = @project.lanes.order(:id).includes(:tasks)
    end
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
