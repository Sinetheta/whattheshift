class Revision < ApplicationRecord
  belongs_to :scenario
  has_and_belongs_to_many :images

  accepts_nested_attributes_for :images

  before_save :find_or_create_images

  private

  # Avoid creating new images when existing images can be shared between revisions
  def find_or_create_images
    self.images = images.map do |image|
      Image.find_by(image.attributes.compact) || image
    end
  end
end
