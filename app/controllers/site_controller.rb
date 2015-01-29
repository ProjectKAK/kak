class SiteController < ApplicationController
  attr_accessor :recipes

  def index
  end

  def search
    p params["searchbar"]
    p params(@useringredient)
    # Here we are breaking down a large URL into phrases
    app_id="f88952b0"
    app_key="1eb3af17b84ff91a766c56b3713d67d9"
    yummly_api ="http://api.yummly.com/v1/api/recipes?_app_id="+app_id+"&_app_key="+app_key+"&"
    query_params = "q=" + params["searchbar"].gsub(/\s/, "+")

    # concatenating all the phrases into one long link
    link = yummly_api + query_params

  	# NOTE - uncomment the code below when you are ready to make API calls
 #    response = Typhoeus.get(link)
	# parsed = JSON.parse(response.body) #this is a hash  	

 # 	@recipes = parsed["matches"]


 @recipes =
    [
        {
            "attributes"=> {
                "course"=> [
                    "Soups"
                ],
                "cuisine"=> [
                    "Italian"
                ]
            },
            "flavors"=> {
                "salty"=> 0.6666666666666666,
                "sour"=> 0.8333333333333334,
                "sweet"=> 0.6666666666666666,
                "bitter"=> 0.5,
                "meaty"=> 0.16666666666666666,
                "piquant"=> 0.5
            },
            "rating"=> 4.6,
            "id"=> "Vegetarian-Cabbage-Soup-Recipezaar",
            "smallImageUrls"=> [],
            "sourceDisplayName"=> "Food.com",
            "totalTimeInSeconds"=> 4500,
            "ingredients"=> [
                "garlic cloves",
                "ground pepper",
                "diced tomatoes",
                "celery",
                "tomato juice",
                "salt",
                "cabbage",
                "bell peppers",
                "oregano",
                "carrots",
                "basil",
                "vegetable broth",
                "chili pepper flakes",
                "green beans",
                "onions",
                "onion soup mix"
            ],
            "recipeName"=> "Vegetarian Cabbage Soup"
        } 
      ]
  	render :results

  end
	
  def results
  end

end
