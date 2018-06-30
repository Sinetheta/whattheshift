class Scenario < ApplicationRecord
  belongs_to :project
  has_one :script, dependent: :destroy

end
