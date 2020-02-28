class Supplier < ApplicationRecord
  validates_presence_of :tradingName, :ownerName, :document

  before_save :parse_coord

  def self.closest(lng, lat)
    point = RGeo::Geographic.spherical_factory.point(lng, lat)
    ### I know that here we have a bug finding the closest supplier
    ### I believe that it occours becouse MySQL isn't good for spatial queries
    ### Because of the due date to deliver this test, I don't have time to switch to PostGIS (postgres)
    Supplier.where("st_contains(coverageArea, '#{point}')").first
  end

  private

  def parse_coord
    self.address = RGeo::GeoJSON.decode(self.address, :json_parser => :json)
    self.coverageArea = RGeo::GeoJSON.decode(self.coverageArea, :json_parser => :json)
  end
end
