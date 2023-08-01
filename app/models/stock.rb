class Stock < ApplicationRecord
   has_many :products
    validates :stock_name, presence: true, uniqueness: true,format: {with: /[a]/, message: "stock_name must include letter 'a'"}
    validates :price, presence: true
    validates :market_capital, presence: true
    after_save :pop 
    validate :valid_stock

    #call_back method
    def pop 
        puts "just checking callbacks man!"
    end

    #custom_validation
    def valid_stock 
        if self.price <100
            errors.add(:price,"price must be greater than 100")
        end 
    end
end
