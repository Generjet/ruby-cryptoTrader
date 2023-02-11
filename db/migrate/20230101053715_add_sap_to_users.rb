class AddSapToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sap_id, :integer
    add_column :users, :name, :string
    add_column :users, :surname, :string
  end
end
