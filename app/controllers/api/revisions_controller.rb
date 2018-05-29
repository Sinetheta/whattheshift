module Api
  class RevisionsController < ApiController
    before_action :set_revision, only: [:show]

    def show
      json_response(@revision, :ok, include: :images)
    end

    def create
      @revision = Revision.create!(revision_params)
      json_response(@revision, :created, include: :images)
    end

    private

    def revision_params
      params.require(:revision)
            .permit :identifier,
                    images_attributes: [:description, :identifier, :signature]
    end

    def set_revision
      @revision = Revision.find(params[:id])
    end
  end
end
