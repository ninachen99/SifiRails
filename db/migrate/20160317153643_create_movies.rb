class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image
      t.string :release_year
      t.string :plot
      t.integer :theater_id
      t.integer :showtime_id
      t.timestamps null: false
    end
  end
end
