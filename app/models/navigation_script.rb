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

    attr_accessor :description, :is_full_height, :url

    validates :description, presence: true
    validates :is_full_height, inclusion: ['true', 'false']
    validates :url, presence: true, url: true

    def full_height?
      is_full_height == 'true'
    end
  end
end
