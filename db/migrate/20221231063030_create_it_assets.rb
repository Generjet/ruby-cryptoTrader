class CreateItAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :it_assets do |t|
      t.string :name
      t.text :detail
      t.string :serial_number
      t.integer :asset_type
      t.integer :status
      t.integer :owner_id
      t.integer :registered_by
      t.integer :edited_by

      t.timestamps
    end
  end
end
