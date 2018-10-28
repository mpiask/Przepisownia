class Category < ApplicationRecord
  has_many :recipes_categories
  has_many :recipes, through: :recipes_categories
end
