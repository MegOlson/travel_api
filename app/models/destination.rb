class Destination < ApplicationRecord
  validates :city, :country, :presence => true
end
