class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :date, :date
    add_column :orders, :time, :time
    add_column :orders, :driver_instructions, :text
  end
end