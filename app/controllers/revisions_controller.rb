class RevisionsController < ApplicationController
  def index
    @revisions = Revision.includes(:images).all
  end

  def show
    @revision = Revision.includes(:images).find(params[:id])
  end
end
