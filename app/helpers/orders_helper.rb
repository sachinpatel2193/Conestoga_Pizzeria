module OrdersHelper
    
    def checked(area)
        @order.toppings.nil? ? false : @order.toppings.match(area)
    end
end
