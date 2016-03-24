class Order < ActiveRecord::Base
     belongs_to:user
     #validates :user_id, presence: true
     before_save do
        self.toppings.gsub!(/[\[\]\"]/, "") if attribute_present?('toppings')
    end
    
    validates :address, presence:true
    
    validates :city, presence: true
    
    phonenumber_validation =  /\d{3}-\d{3}-\d{4}/
      validates :phonenumber, :presence => true, :format => { :with => phonenumber_validation , message: " - please use this format 123-234-3456"  }
      
    zip_canada = /\A[a-zA-Z]{1}\d{1}[a-zA-Z]{1}[ -]?\d{1}[a-zA-Z]{1}\d{1}\z/
    validates :postalcode, :presence => true, :format => { :with => zip_canada }
    
    validates :size, presence:true
    
    validates :crust, presence:true
    
    validates :toppings, presence:true
    
    def price
          @sizeprice = 0;
          @crustprice = 0;
          @toppingprice = 0;
          @numberofpizzaprice=0;
          @tax = 0;
          @totalprice = 0;
          @grandtotal=0;
          
          if self.province=='ON'
                 @tax=0.13
            elsif self.province=='MB'
                 @tax=0.10
            elsif self.province=='SK'
                 @tax=0.15
            elsif self.province=='QC'
                 @tax=0.11
          end
          
          if self.size=='small'
               @sizeprice=5.00
          elsif self.size=='medium'
               @sizeprice=10.00
          elsif self.size=='large'
               @sizeprice=15.00
          elsif self.size=='xlarge'
               @sizeprice=20.00
          end
               
          
           if self.crust == "Stuff_Crust"
               @CrustPrice =  2.0;
           end
          
            
            if attribute_present?("toppings")
                 @toppingprice=self.toppings.count(',')*0.5
            end
            
            @totalprice = @sizeprice + @crustprice + @toppingprice + @tax;
            
                 @totalprice=@totalprice*self.numberofpizza;
            
            
            @grandtotal= (@totalprice + (@tax * @totalprice));
            return @grandtotal
    end
end