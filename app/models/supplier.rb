class Supplier < ApplicationRecord
  has_one :coverage_area
  has_one :address
  validates_presence_of :tradingName, :ownerName, :document

  acts_as_mappable :through => :coverage_area

  accepts_nested_attributes_for :coverage_area, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true
end
