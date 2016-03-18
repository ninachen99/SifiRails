class Movie < ActiveRecord::Base
	has_many :showtimes, dependent: :destroy
end
