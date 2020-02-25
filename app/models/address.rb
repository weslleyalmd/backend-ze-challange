class Address < ApplicationRecord
  belongs_to :supplier
  serialize :coordinates

  self.inheritance_column = "not_sti"
end
