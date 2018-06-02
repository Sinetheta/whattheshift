module Api
  class RevisionsController < ApiController
    before_action :set_revision, only: [:show]

    def show
      render(@revision)
    end

    def create
      @revision = Revision.create!(revision_params)
      render(@revision, status: :created)
    end

    private

    def revision_params
      params.require(:revision)
            .permit :description,
                    :identifier,
                    images_attributes: [:description, :identifier, :signature]
    end

    def set_revision
      @revision = Revision.find(params[:id])
    end
  end
end
