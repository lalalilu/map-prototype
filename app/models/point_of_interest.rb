class PointOfInterest < ActiveRecord::Base
  belongs_to :trip
  belongs_to :user
  geocoded_by :address

  def address
    [street, city, state, zipcode].compact.join(', ')
  end

  after_validation :geocode
end
