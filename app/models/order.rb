class Order < ActiveRecord::Base
     belongs_to:user
     #validates :user_id, presence: true
     before_save do
        self.toppings.gsub!(/[\[\]\"]/, "") if attribute_present?('toppings')
    end
end
