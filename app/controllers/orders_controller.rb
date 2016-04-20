class OrdersController < ApplicationController
	#attr_accessor :showtime_id, :movie_id
	def new
		@order = Order.new
		# @showtime = Showtime.find(params[:id])
		# @movie_id = @showtime.movie_id
	end 

	def index
		@orders = Order.all
	end 
    
	def create
		@order = Order.new(order_params)
		# @order.showtime_id = params[:order][:showtime_id]
		# @order.first_name = params[:order][:first_name]
		if @order.save
			puts "Debug information"
		   flash[:notice] = "Thank you for your order."
		   redirect_to '/movies'
		else 
           render  'new'
        end 
	end 

	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to orders_path
	end 

	private

	def order_params
		params.require(:order).permit(:age, :first_name, :last_name, :email, :credit_card, :expiration, :order_quantity, :movie_id, :showtime_id)
	end 
end





