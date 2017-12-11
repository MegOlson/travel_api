class Review < ApplicationRecord
  belongs_to :destination
  validates :author, :content, :rating, :presence => true
end
