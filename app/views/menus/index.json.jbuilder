json.array!(@menus) do |menu|
  json.extract! menu, :name, :description, :price
  json.url menu_url(menu, format: :json)
end
