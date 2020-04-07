class Cocktail < ApplicationRecord
  before_validation :normalize_name, on: :create

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates_presence_of :name
  validates :name, uniqueness: { case_sensitive: false }

  def normalize_name
    self.name = name.split.map(&:capitalize).join(' ')
  end
end
