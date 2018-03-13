class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :forecast_rating
      t.string :number_of_reviews
      t.float :google_rating
      t.string :opentable_rating
      t.string :infatuation_rating
      t.string :tripadvisor_rating
      t.string :yelp_rating
      t.string :eater_list
      t.string :infatuation_list
      t.string :other_top_list
      t.integer :neighborhood_id
      t.string :price
      t.integer :cuisine_id
      t.string :hours

      t.timestamps

    end
  end
end
