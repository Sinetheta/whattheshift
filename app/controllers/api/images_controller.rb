module Api
  class ImagesController < ApiController
    before_action :set_image, only: [:show, :update]

    def show
      json_response(@image)
    end

    def update
      @image.update(image_params)
      json_response(@image)
    end

    private

    def image_params
      params.require(:image)
            .permit [:description, :identifier, :signature]
    end

    def set_image
      @image = Image.find(params[:id])
    end
  end
end
