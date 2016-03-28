class ShowtimesController < ApplicationController
	def show
		@showtime = Showtime.find(params[:id])
	end 

	def create
		@showtime = Showtime.new(showtime_params)
		if @showtime.save
			puts "Debug information"
		   
		   redirect_to '/movies'
		else 
           render  '/movies/new'
        end 
	end 

	private

	def showtime_params
		params.require(:showtime).permit(:month, :date, :hour, :year)
	end 
end
