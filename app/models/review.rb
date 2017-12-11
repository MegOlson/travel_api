class Review < ApplicationRecord
  belongs_to :destination
  validates :author, :content, :rating, :presence => true

  scope :destinations_reviews, -> (destination_id) { where ("destination_id = ?", destination_id)}
end
