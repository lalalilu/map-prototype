class AddUserIdToPoi < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :user_id, :integer
  end
end
