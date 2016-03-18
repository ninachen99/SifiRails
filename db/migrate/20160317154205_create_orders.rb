class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :showtime, index: true
 
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.integer :order_quantity
      t.string :credit_card
      t.string :expiration
      t.integer :movie_id
      t.integer :showtime_id
      t.references :showtime  # Is this necessary here? 

      t.timestamps null: false
    end
  end
end
