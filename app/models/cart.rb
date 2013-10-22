class Cart < ActiveRecord::Base
  has_many :items, dependent: :destroy

  def add_menu(menu_id)
    # logger.info "Entering add_menu function"
    current_item = items.find_by(menu_id: menu_id)

    # if !current_item.nil?
    #   logger.info "Before updating, current_item quantity is #{current_item.quantity}"
    #   logger.info "Before updating, cart item quantity is #{items.first.quantity}"
    # end

    if current_item
      current_item.quantity += 1
    else
      current_item = items.build(menu_id: menu_id)
    end

    # logger.info "After updating, current_item quantity is #{current_item.quantity}"
    # logger.info "After updating, cart item quantity is #{items.first.quantity}"

    current_item
  end

  def total_price
    items.to_a.sum { |item| item.total_price }
  end
end
