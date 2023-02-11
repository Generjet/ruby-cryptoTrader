class CreateAssetsMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :assets_movements do |t|
      t.string :serial_number
      t.integer :from_who
      t.integer :to_who
      t.integer :registered_by
      t.integer :edited_by

      t.timestamps
    end
  end
end
