class ChangeDeliveryTimeInOrders < ActiveRecord::Migration
  def self.up
    change_column :orders, :delivery_time, :string
  end

  def self.down
    change_column :orders, :delivery_time, :datetime
  end
end
