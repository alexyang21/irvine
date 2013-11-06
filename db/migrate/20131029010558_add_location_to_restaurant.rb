class AddLocationToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
  end
end
