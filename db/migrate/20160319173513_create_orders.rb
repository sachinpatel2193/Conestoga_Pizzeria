class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :address
      t.string :city
      t.string :province
      t.string :postalcode
      t.string :phonenumber
      t.string :size
      t.string :crust
      t.string :toppings
      t.integer :numberofpizza

      t.timestamps null: false
    end
  end
end
