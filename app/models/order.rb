class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, :email, :phone, :address, :city, :state, :delivery_time,
            presence: true

  # Email address validation
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/,
            message: "Invalid email address" }

  # Physical address validation
  validates :city, inclusion: { in: %w(Irvine Tustin irvine tustin),
            message: "Sorry, we're only delivering to Irvine/Tustin for now!" }
  validates :state, inclusion: { in: %w(CA Ca cA ca),
            message: "Sorry, you must be in California to order!"}

  def add_items_from_cart(cart)
    cart.items.each do |item|
      item.cart_id = nil
      items << item
    end
  end

  def total_price
    items.to_a.sum { |item| item.total_price }
  end
end
