class Supplier < ApplicationRecord
  validates_presence_of :tradingName, :ownerName, :document
end
