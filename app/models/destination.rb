class Destination < ApplicationRecord
  has_many :reviews
  validates :city, :country, :presence => true

  scope :search, -> (country){ where('country = ?', country)}
end
