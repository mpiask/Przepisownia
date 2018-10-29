# frozen_string_literal: true

class Recipe < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :recipes_categories
  has_many :categories, through: :recipes_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true
  validates :user_id, presence: true
end
