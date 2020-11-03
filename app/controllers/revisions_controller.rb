class RevisionsController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def index
    @revisions = Revision.includes(:images).all
  end

  def show
    @revision = Revision.includes(:images).find(params[:id])
  end
end
