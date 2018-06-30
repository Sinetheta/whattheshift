class Script < ApplicationRecord
  belongs_to :scenario
  serialize :body

  def self.types
    %w(NavigationScript)
  end

  def partial_name
    self.class.name.underscore
  end
end
