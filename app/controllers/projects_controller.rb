class ProjectsController < ApplicationController
  before_action :load_project, only: [:edit, :show, :update]

  def create
    @project = Project.create(project_params)
    render :show
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def update
    @project.update(project_params)
    render :show
  end

  private

  def load_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project)
          .permit(:name)
  end
end
