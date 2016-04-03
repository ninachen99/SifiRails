class Showtime < ActiveRecord::Base
	has_many :orders, dependent: :destroy
	belongs_to :theater
	belongs_to :movie

	validates :month, :date, :hour, :year, :movie_id, :theater_id, presence: true
end
