class CreateUserReviews < ActiveRecord::Migration
  def change
    create_table :user_reviews do |t|
      t.float :rating
      t.integer :user_id
      t.integer :restaurant_id
      t.string :comments

      t.timestamps

    end
  end
end
