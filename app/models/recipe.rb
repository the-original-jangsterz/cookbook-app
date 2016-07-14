class Recipe < ActiveRecord::Base
  def ingredients_list
    list = []
    ingredients.split(', ').each do |ingredient|
      list << ingredient.upcase
    end
    list
  end
end
