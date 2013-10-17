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
end
