json.array!(@orders) do |order|
  json.extract! order, :name, :email, :phone, :address, :city, :state
  json.url order_url(order, format: :json)
end
