module Api
  class RevisionsController < ApiController
    before_action :set_revision, only: [:show]

    def show
      json_response(@revision)
    end

    def create
      @revision = Revision.create!(revision_params)
      json_response(@revision, :created)
    end

    private

    def revision_params
      params.require(:revision)
            .permit :identifier
    end

    def set_revision
      @revision = Revision.find(params[:revision_id])
    end
  end
end
