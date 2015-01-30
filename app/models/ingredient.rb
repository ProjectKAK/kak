class Ingredient < ActiveRecord::Base
	has_many :useringredients
	has_many :ingredients, :through => :useringredients

   def self.get_similar_ingredients(params)
    app_id=ENV["APP_ID"]
    app_key=ENV["APP_KEY"]
    yummly_api ="http://api.yummly.com/v1/api/recipes?_app_id="+app_id+"&_app_key="+app_key+"&"
    query_params = "q=" + params["searchbox"].gsub(/\s/, "+")
    # concatenating all the phrases into one long link
    link = yummly_api + query_params
    res = Typhoeus.get(link)
    results = JSON.parse(res.body)["matches"].inject([]) do |results, match|
    	unique_ingredients = match["ingredients"] - results
    	results + unique_ingredients
    end
  end

  def self.scrape(seed_term, curr_level=0, level_limit=0, prev_results = [])
  	new_results = Ingredient.get_similar_ingredients({"searchbox" => seed_term})  - prev_results
  	results = prev_results + new_results
  	results = results.inject(results) do |results, ingredient|
    	sleep(0.5)
    	results + (get_similar_ingredients({"searchbox" => ingredient}) - results)
    end
    if curr_level < level_limit
    	results = results.inject do |results, term|
    	 	results = Ingredient.scrape(term, curr_level + 1, level_limit, results)
    	end
    end
    results
  end
end
