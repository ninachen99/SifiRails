class Order < ActiveRecord::Base
	belongs_to :showtime
	has_one :movie, through: :showtime

	validates :first_name, :last_name, :age, :email, :credit_card, :expiration, :showtime_id, :movie_id, :order_quantity, presence: true
	#validate :order_quantity, if: :orders_sold_out?
	#validate :age, if: :age_restriction?
    # find order sum:  Showtime.find(params[:id]).orders.sum("order_quantity") 
    # find the seats:
    # theaterId = Showtime.find(params[:id]).theater_id
    # Theater.find(theaterId).seats

    #order_total = Order.where("showtime_id = ?", params[:orders]).count
 
    def order_total
       puts "9" * 50
       total = Showtime.find(params[:id]).orders.sum("order_quantity")
       return total
       #puts Order.where("showtime_id", self.showtime_id).sum("order_quantity")
       #return Order.where("showtime_id", self.showtime_id).sum("order_quantity")
    end

    def order_limit
        puts "9" * 50
        theaterId = Showtime.find(params[:id]).theater_id
        available_seats = Theater.find(theaterId).seats
        #newId = Showtime.find_by("id", self.id).theater_id
    	#available_seats = Theater.find_by("id", newId).seats
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
