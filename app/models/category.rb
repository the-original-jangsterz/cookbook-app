class Category < ActiveRecord::Base
  has_many :categorized_recipes
end
