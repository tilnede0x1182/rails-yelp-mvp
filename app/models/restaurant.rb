class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # Un restaurant doit avoir un nom, une adresse et une catégorie
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true

  # La catégorie du restaurant doit appartenir à cette liste fixe
  CATEGORIES = %w[chinese italian japanese french belgian]
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} n'est pas une catégorie valide" }
end
