module Api
  class ImagesController < ApiController
    before_action :set_image, only: [:show]

    def show
      json_response(@image)
    end

    private

    def set_image
      @image = Image.find(params[:id])
    end
  end
end
