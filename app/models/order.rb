class Order < ActiveRecord::Base
  has_many :items, dependent: :destroy

  validates :name, :email, :phone, :address, :city, :state,
            presence: true

  def add_items_from_cart(cart)
    cart.items.each do |item|
      item.cart_id = nil
      items << item
    end
  end
end
