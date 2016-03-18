class Order < ActiveRecord::Base
	belongs_to :showtime
	has_one :movie, through: :showtime

	validates :first_name, :last_name, :age, :email, :credit_card, :expiration, :showtime_id, :order_quantity, presence: true
	validate :order_quantity, if: :orders_sold_out?
	validate :age, if: :age_restriction?
    
    def order_total
       puts Order.where("showtime_id", self.showtime_id).count()
       return Order.where("showtime_id", self.showtime_id).count()
       
    end 

    def order_limit
        showing = Showtime.where("id", self.id)
        newId = showing.id
    	available_seats = Theater.where("id", newId).seats
        puts available_seats
        return available_seats
    end 

    def orders_sold_out?
    	if order_total >= order_limit
            puts order_total
    		errors.add(:order_quantity, "All seats are sold out for this movie.")
    	end 
    end 

    def age_restriction?
    	order = Order.new
    	user_age = order.age.to_i
    	if user_age < 18
    		errors.add(:age, "You must be 18 or older to make a purchase.")
    	end 

    end 

end
