class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, :email, :phone, :address, :city, :state, :date, :time,
            presence: true

  validates :date, format: { with: /\d{4}-\d{2}-\d{2}/,
            message: "Date should be of form YYYY-MM-DD" }

  validates :time, format: { with: /\d{2}:\d{2}/,
            message: "Time should be of form HH:MM (24-hour clock)"}

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
