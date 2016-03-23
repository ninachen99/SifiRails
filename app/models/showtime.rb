class Showtime < ActiveRecord::Base
	#attr_accessible :movie_id

	has_many :orders, dependent: :destroy
	belongs_to :theater
	belongs_to :movie
end
