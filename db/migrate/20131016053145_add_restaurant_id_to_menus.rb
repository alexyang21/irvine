class AddRestaurantIdToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :restaurant_id, :integer
    add_index :menus, :restaurant_id
  end
end
