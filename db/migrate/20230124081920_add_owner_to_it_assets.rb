class AddOwnerToItAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :it_assets, :owner, :string
  end
end
