class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates_presence_of :name
  validates :name, uniqueness: { case_sensitive: false }
end
