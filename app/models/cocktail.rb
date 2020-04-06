class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  validates_presence_of :name
  validates :name, uniqueness: { case_sensitive: false }
end
