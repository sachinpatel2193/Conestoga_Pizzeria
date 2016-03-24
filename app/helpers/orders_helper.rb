module OrdersHelper
    
    def checked(area)
        @order.toppings.nil? ? false : @order.toppings.match(area)
    end
    
    #def checked(area)
     #   @order.status.nil? ? false : @order.status.match(area)
    #end
end
