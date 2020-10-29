class ProjectTokensController < ApplicationController
  def create
    token = ProjectToken.create(project_token_params)
    authorize token
    redirect_to token.project
  end

  private

  def project_token_params
    params.require(:project_token)
          .permit(:project_id)
  end
end
