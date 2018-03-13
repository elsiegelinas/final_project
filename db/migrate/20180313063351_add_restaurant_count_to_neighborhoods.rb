class AddRestaurantCountToNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    add_column :neighborhoods, :restaurants_count, :integer
  end
end
