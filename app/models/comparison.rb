class Comparison < ApplicationRecord
  belongs_to :from_revision, class_name: 'Revision'
  belongs_to :to_revision, class_name: 'Revision'

  has_many :comparison_image_diffs
  has_many :image_diffs, through: :comparison_image_diffs
end
