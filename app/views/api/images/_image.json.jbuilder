json.merge! image.attributes

json.url rails_blob_url(image.image) if image.image.attached?
