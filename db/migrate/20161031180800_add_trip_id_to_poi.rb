class AddTripIdToPoi < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :trip_id, :integer
  end
end
