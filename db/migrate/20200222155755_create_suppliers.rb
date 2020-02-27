class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :tradingName
      t.string :ownerName
      t.string :document
      t.multi_polygon :coverageArea
      t.point :address

      t.timestamps
    end
  end
end
