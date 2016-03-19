# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# seeds theaters
t1 = Theater.create(name: "Red", seats: 100)
t2 = Theater.create(name: "Yellow", seats: 120)
t3 = Theater.create(name: "Blue", seats: 98)

m1 = Movie.create(title: "Sherlock", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/sherlock-holmes.jpg", release_year: "2016", plot: "When a string of brutal murders terrorizes London, it doesn't take long for legendary detective Sherlock Holmes (Robert Downey Jr.) and ...", theater_id: t1.id)


m2 = Movie.create(title: "Closer", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/closer.jpg", release_year: "2016", plot: "Alice (Natalie Portman), who has moved to London, meets Dan (Jude Law) on the street. While looking at him, a taxi hits her. After taking ...", theater_id: t2.id)

m3 = Movie.create(title: "Interhill", image: "http://s3.amazonaws.com/codecademy-content/courses/learn-rails/img/interstellar.jpg", release_year: "2016", plot: "In Earth's future, a global crop blight and second Dust Bowl are slowly rendering the planet uninhabitable. Professor Brand Michael Cai...", theater_id: t3.id)
# seeds showtimes
s1 = Showtime.create(month: "12", date: "12", hour: "14:30", year: "2016", movie_id:m1.id, theater_id: t1.id)
s2= Showtime.create(month: "12", date: "12", hour: "16:30", year: "2016", movie_id:m1.id, theater_id: t1.id)

s3 = Showtime.create(month: "10", date: "23", hour: "13:50", year: "2016", movie_id:m2.id, theater_id: t2.id)
s4 = Showtime.create(month: "10", date: "23", hour: "15:50", year: "2016", movie_id:m2.id, theater_id: t2.id)

s5 = Showtime.create(month: "08", date: "15", hour: "10:40", year: "2016", movie_id:m3.id,theater_id: t3.id)
s6 = Showtime.create(month: "08", date: "15", hour: "12:40", year: "2016", movie_id:m3.id,theater_id: t3.id)


# seeds movie


# movie has many showtimes

m1.showtimes << [s1, s2]
m2.showtimes << [s3, s4]
m3.showtimes << [s5, s6]



# seeds orders

o1 = Order.create(first_name: "Tom", last_name:"Ford", email: "tom@me.com", credit_card:"4456788", expiration:"12-12-2016", age:18, order_quantity:2, movie_id: m1.id, showtime_id: s1.id)

o2 = Order.create(first_name: "Bob", last_name:"West", email: "bob@me.com", credit_card:"4456788", expiration:"12-12-2016", age:28, order_quantity:3, movie_id: m2.id, showtime_id: s2.id)






















