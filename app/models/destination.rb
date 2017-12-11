class Destination < ApplicationRecord
  has_many :reviews
  validates :city, :country, :presence => true
end
