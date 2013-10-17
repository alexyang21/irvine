class Item < ActiveRecord::Base
  belongs_to :menu
  belongs_to :cart

  def total_price
    menu.price * quantity
  end
end
