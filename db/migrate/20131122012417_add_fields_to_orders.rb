class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_time, :datetime
    add_column :orders, :driver_instructions, :text
  end
end
