class CreateAssetsOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :assets_owners do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :position
      t.string :department
      t.string :dockingStation
      t.string :desktopModel
      t.string :desktopSerial
      t.string :laptop
      t.string :laptopSerial
      t.string :monitor1
      t.string :monitor2
      t.string :monitor3
      t.string :location
      t.string :comment
      t.integer :sap_id

      t.timestamps
    end
  end
end
