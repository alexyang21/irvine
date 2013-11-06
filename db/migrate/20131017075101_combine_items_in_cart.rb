class CombineItemsInCart < ActiveRecord::Migration
  def up
    # replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.items.group(:menu_id).sum(:quantity)

      sums.each do |menu_id, quantity|
        if quantity > 1
          # remove individual items
          cart.items.where(menu_id: menu_id).delete_all

          # replace with a single item
          item = cart.items.build(menu_id: menu_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # split items with quantity > 1 into multiple items
    Item.where("quantity>1").each do |item|
      # add individual items
      item.quantity.times do
        Item.create cart_id: item.cart_id,
          menu_id: item.menu_id, quantity: 1
      end

      # remove original item
      item.destroy
    end
  end
end
