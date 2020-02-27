class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :tradingName, :ownerName, :document, :coverageArea, :address

  def address
    RGeo::GeoJSON.encode(self.object.address, :json_parser => :json)
  end
  
  def coverageArea
    RGeo::GeoJSON.encode(self.object.coverageArea, :json_parser => :json)
  end
end
