class Supplier < ApplicationRecord
  validates_presence_of :tradingName, :ownerName, :document

  before_save :parse_coord

  def self.closest(lng, lat)
    point = RGeo::Geographic.spherical_factory.point(lng, lat)
    Supplier.where("st_contains(coverageArea, '#{point}')").first
  end

  private

  def parse_coord
    self.address = RGeo::GeoJSON.decode(self.address, :json_parser => :json)
    self.coverageArea = RGeo::GeoJSON.decode(self.coverageArea, :json_parser => :json)
  end
end
