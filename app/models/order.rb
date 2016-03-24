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
end
