class Scenario < ApplicationRecord
  belongs_to :project
  has_one :script, dependent: :destroy

  accepts_nested_attributes_for :script
end
