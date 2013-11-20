class Cart < ActiveRecord::Base
  has_many :items, dependent: :destroy

  def add_menu(menu_id)
    current_item = items.find_by(menu_id: menu_id)

    if current_item
      current_item.quantity += 1
    else
      current_item = items.build(menu_id: menu_id)
    end

    current_item
  end

  def decrease(item_id)
    current_item = items.find_by(id: item_id)
    if current_item.quantity > 1
      current_item.quantity -= 1
    else
      current_item.destroy
    end
    current_item
  end

  def increase(item_id)
    current_item = items.find_by(id: item_id)
    current_item.quantity += 1
    current_item
  end

  def total_price
    items.to_a.sum { |item| item.total_price }
  end
end
