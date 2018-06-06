class Revision < ApplicationRecord
  has_and_belongs_to_many :images

  accepts_nested_attributes_for :images
end
