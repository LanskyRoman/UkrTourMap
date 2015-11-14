class Poi < ActiveRecord::Base
  GEO_FACTORY = RGeo::Geographic.spherical_factory(srid: 4326)
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :lonlat, presence: true

  def self.factory
    GEO_FACTORY
  end

  def factory
    GEO_FACTORY
  end

  def lon
    lonlat.try(:x)
  end

  def lat
    lonlat.try(:y)
  end
end
