class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end 

	def show
		@movie = Movie.find(params[:id])
		@showtimes = @movie.showtimes
	end 

	def new
		@movie = Movie.new
		#2.times {@movie.showtimes.build}
	end 

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to '/movies'
		else
			render 'movies/new'
		end 
	end 

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to movies_path
	end 

	private

	def movie_params
		params.require(:movie).permit(:title, :image, :release_year, :plot, :theater_id, :showtime_id)
	end 
end
