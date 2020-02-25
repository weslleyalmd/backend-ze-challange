class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :tradingName, :ownerName, :document

  has_one :address
  has_one :coverage_area
end