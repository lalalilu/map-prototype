class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :latitude, :float
    add_column :point_of_interests, :longitude, :float
  end
end
