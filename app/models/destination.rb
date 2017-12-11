class Destination < ApplicationRecord
  has_many :reviews
  validates :city, :country, :presence => true

  scope :search, -> (country){ where('country = ?', country)}

  def get_average_rating(destination)
    ratings = Review.destinations_reviews(self.id)
    if ratings.length > 0
      sum = 0
      ratings.each do |rating|
        sum = rating.rating += sum
      end
      if (sum / ratings.length) >= 3
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def self.popular_destinations(destinations)
    popular_destinations = []
    destinations.each do |destination|
      if destination.get_average_rating == true
        popular_destinations.push(destination)
      end
    end
    return popular_destinations
  end

end
