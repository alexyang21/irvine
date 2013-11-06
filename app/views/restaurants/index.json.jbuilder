json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :name, :description, :image_url
  json.url restaurant_url(restaurant, format: :json)
end
