class Image < ApplicationRecord
  belongs_to :revision

  has_one_attached :image
end
