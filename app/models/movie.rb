class Movie < ActiveRecord::Base
	validates :title, :release_year, :plot, :theater_id, presence: true
	has_many :showtimes, dependent: :destroy
end
