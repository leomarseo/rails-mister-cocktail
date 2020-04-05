class Ingredient < ApplicationRecord
  has_many :cocktails, through: :doses
  has_many :doses
  validates_presence_of :name
  validates :name, uniqueness: { case_sensitive: false }
end
