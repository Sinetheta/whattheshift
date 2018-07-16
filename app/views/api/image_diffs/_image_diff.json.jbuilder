json.merge! image_diff.attributes

json.after_image  image_diff.after_image,  partial: 'api/images/image', as: :image
json.before_image image_diff.before_image, partial: 'api/images/image', as: :image

json.url rails_blob_url(image_diff.image) if image_diff.image.attached?
