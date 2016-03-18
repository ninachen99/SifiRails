class Showtime < ActiveRecord::Base
	has_many :orders, dependent: :destroy
	belongs_to :theater
	belongs_to :movie
end
