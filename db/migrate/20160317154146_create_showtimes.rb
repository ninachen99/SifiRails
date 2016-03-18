class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :theater, index: true

      t.string :month
      t.string :date
      t.string :hour
      t.string :minute
      t.string :am_pm
      t.string :year
      t.integer :movie_id
      t.integer :theater_id
      t.references :movie
      t.timestamps null: false
    end
  end
end
