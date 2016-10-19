class CreatePointOfInterests < ActiveRecord::Migration
  def change
    create_table :point_of_interests do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
