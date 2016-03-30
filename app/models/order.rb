class Order < ActiveRecord::Base
    #attr_accessible :movie_id, :showtime_id

	belongs_to :showtime
	has_one :movie, through: :showtime

	validates :first_name, :last_name, :age, :email, :credit_card, :expiration, :showtime_id, :movie_id, :order_quantity, presence: true
	validate :order_quantity, if: :orders_sold_out?
	validate :age, if: :age_restriction?
    
    # the sum only sum up the previous orders, without the most current one.
  
    def order_total
       puts "9" * 50
       #if self.showtime_id.present?
       my_order = Order.where(showtime_id: self.showtime_id)
       #my_order_total = Order.where(showtime_id: self.showtime_id).group(:showtime_id).sum(:order_quantity) => doesn't work
       my_order_total = my_order.sum(:order_quantity) + self.order_quantity
       #total = my_order.map {|o| o['order_quantity']}.reduce(0, :+)
       # total = my_order.inject(0) { |sum, self.order_quantity| sum + self.order_quantity }
       
       puts my_order_total
       puts self
       puts "show" * 50
       puts self.showtime_id # get the showtime_id for new order.
       
       return my_order_total
    end
     

    # find the theater seats capacity:
    def order_limit
        if self.showtime_id?
            puts "&" * 50
            showing = self.showtime_id.to_i
            puts showing
            show_room = Showtime.find(showing).theater_id.to_i
            puts show_room
            available_seats = Theater.find(show_room).seats
            puts available_seats 
            return available_seats
        end 
        order_limit
    end 

    def orders_sold_out?
    	if order_total >= order_limit.to_i
          puts "$total" * 50
          puts order_total
    		  errors.add(:order_quantity, "All seats are sold out for this movie.")
      else
          puts "Order created."
    	end  
    end 
  
    def age_restriction?
    	user_age = self.age 
        if user_age != nil
         if user_age <= 18
    	  errors.add(:age, "You must be 18 or older to make a purchase.")
         end 
        end
    end 
end
