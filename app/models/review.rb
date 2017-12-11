class Review < ApplicationRecord
  belongs_to :destination
  validates :author, :content, :rating, :presence => true

  scope :reviews, -> (destination_id){ where "destination_id = ?", destination_id }
  scope :by_author, -> (author){ where "author = ?", author}

  # scope :destinations_reviews, -> (destination_id) { where ("destination_id = ?", destination_id)}
end
