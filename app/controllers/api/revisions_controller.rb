module Api
  class RevisionsController < ApiController
    before_action :set_revision, only: [:show]
    before_action :load_scenario, only: [:create]

    def show
      render(@revision)
    end

    def create
      @revision = @scenario.revisions.create!(revision_params)
      render(@revision, status: :created)
    end

    private

    def load_scenario
      api_key = params.require(:api_key)
      project = ProjectToken.find(api_key).project
      @scenario = project.scenarios.first
    end

    def revision_params
      params.require(:revision)
            .permit :description,
                    :identifier,
                    images_attributes: [:identifier, :signature]
    end

    def set_revision
      @revision = Revision.find(params[:id])
    end
  end
end
