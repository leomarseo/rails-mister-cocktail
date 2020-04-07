class Review < ApplicationRecord
  belongs_to :cocktail
  validates_presence_of :content, :rating
  validates :rating, inclusion: { in: (0..5).to_a }

  default_scope { order(rating: :desc) }
end
