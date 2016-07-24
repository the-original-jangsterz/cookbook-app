class Category < ActiveRecord::Base
  has_many :categorized_recipes
  has_many :recipes, through: :categorized_recipes
end
