# frozen_string_literal: true

class RecipesCategory < ApplicationRecord
  belongs_to :recipe
  belongs_to :category
end
