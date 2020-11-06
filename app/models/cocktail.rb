class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy # when I destroy a cocktail, associated doses are destroyed too
  has_many :ingredients, through: :doses
  has_one_attached :photo # cloudinary
  validates :name, presence: true, uniqueness: true
end
