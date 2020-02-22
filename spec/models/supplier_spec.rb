require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it { should validate_presence_of(:tradingName) }
  it { should validate_presence_of(:ownerName) }
  it { should validate_presence_of(:document) }
end