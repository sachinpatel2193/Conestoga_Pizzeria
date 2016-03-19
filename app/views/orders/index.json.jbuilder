json.array!(@orders) do |order|
  json.extract! order, :id, :address, :city, :province, :postalcode, :phonenumber, :size, :crust, :toppings, :numberofpizza
  json.url order_url(order, format: :json)
end
