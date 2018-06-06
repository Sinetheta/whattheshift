class Image < ApplicationRecord
  has_and_belongs_to_many :revisions

  has_one_attached :image
end
