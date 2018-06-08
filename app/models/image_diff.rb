class ImageDiff < ApplicationRecord
  belongs_to :before_image, class_name: 'Image'
  belongs_to :after_image, class_name: 'Image'

  has_one_attached :image
end
