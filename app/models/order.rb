class Order < ActiveRecord::Base
    #attr_accessible :movie_id, :showtime_id

	belongs_to :showtime
	has_one :movie, through: :showtime

	validates :first_name, :last_name, :age, :email, :credit_card, :expiration, :showtime_id, :movie_id, :order_quantity, presence: true
	validate :order_quantity, if: :orders_sold_out?
	validate :age, if: :age_restriction?
    
    def order_total
       puts "9" * 50
       puts Order.where("showtime_id", self.showtime_id).sum("order_quantity")
       return Order.where("showtime_id", self.showtime_id).sum("order_quantity")
    end

    # find the theater seats capacity:
    def order_limit
        puts "&" * 50
        showing = self.showtime_id.to_i
        puts showing
        show_room = Showtime.find(showing).theater_id.to_i
        puts show_room
        available_seats = Theater.find(show_room).seats
        puts available_seats 
        return available_seats
    end 

    def orders_sold_out?
    	if order_total >= order_limit
            puts "$total" * 100
            puts order_total
    		errors.add(:order_quantity, "All seats are sold out for this movie.")
    	end 
    end 

    def age_restriction?
    	user_age = self.age 
        if user_age <= 18
    	  errors.add(:age, "You must be 18 or older to make a purchase.")
        end 
    end 

end
