json.merge! revision.attributes

json.images revision.images do |image|
  json.partial! '/api/images/image', image: image
end
