module Api
  class ImagesController < ApiController
    before_action :set_image, only: [:show, :update]

    def show
      render(@image)
    end

    def update
      @image.update(image_params)
      render(@image)
    end

    private

    def image_params
      params.require(:image)
            .permit [:identifier, :image, :signature]
    end

    def set_image
      @image = Image.find_by(signature: params[:id])
    end
  end
end
