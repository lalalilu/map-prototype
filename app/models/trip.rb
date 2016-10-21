class Trip < ActiveRecord::Base
  has_many :point_of_interests
  belongs_to :user
end
