class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :type
      t.text :coordinates, array: true
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
