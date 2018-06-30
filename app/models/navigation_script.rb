class NavigationScript < Script
  def destinations
    (body || []).map{ |attrs| Destination.new(attrs) }
  end

  def destinations=(destinations_attrs)
    self.body = destinations_attrs
  end

  def destinations_attributes=(destinations_attrs_hash)
    self.body = destinations_attrs_hash.values.select{ |attrs| Destination.new(attrs).valid? }
  end

  def fill_destinations
    (destinations + Array.new(5) { Destination.new }).first(5)
  end

  private

  class Destination
    include ActiveModel::Model

    attr_accessor :description, :url

    validates :description, presence: true
    validates :url, presence: true, url: true
  end
end
