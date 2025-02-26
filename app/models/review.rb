class Review < ApplicationRecord
  belongs_to :restaurant

  # Un avis doit avoir un contenu et une note
  validates :content, presence: true
  validates :rating, presence: true

  # La note d’un avis doit être un entier entre 0 et 5
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
