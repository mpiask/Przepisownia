class Category < ApplicationRecord
  has_many :recipes_categories
  has_many :recipes, through: :recipes_categories
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates_uniqueness_of :name
end
