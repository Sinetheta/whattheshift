class ProjectsController < ApplicationController
  before_action :load_project, only: [:edit, :show, :update]

  def create
    @project = Project.new(project_params)
    @project.members.new(user: current_user, role: :admin)
    @project.save!
    authorize @project
    render :show
  end

  def index
    @projects = policy_scope(Project)
  end

  def new
    @project = Project.new
    authorize @project
  end

  def update
    authorize @project
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
