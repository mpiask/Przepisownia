class Recipe < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :recipes_categories
  has_many :categories, through: :recipes_categories
end
