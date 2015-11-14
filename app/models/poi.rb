class Poi < ActiveRecord::Base
  GEO_FACTORY = RGeo::Geographic.spherical_factory(srid: 4326)

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :lonlat, presence: true

  def factory
    RGeo::Geographic.spherical_factory(srid: 4326)
  end
end
