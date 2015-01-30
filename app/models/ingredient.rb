class Ingredient < ActiveRecord::Base
	has_many :useringredients
	has_many :ingredients, :through => :useringredients
end
