json.merge! revision.attributes

json.images revision.images, partial: 'api/images/image', as: :image
