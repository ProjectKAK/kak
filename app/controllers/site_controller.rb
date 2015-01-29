class SiteController < ApplicationController
  attr_accessor :recipes
  skip_before_filter  :verify_authenticity_token
  
  def index
  end

def search
    # Here we are breaking down a large URL into phrases
    app_id="d571fa4e"
    app_key="4dfecc754af1efd478079989e96ef7b8"
    yummly_api ="http://api.yummly.com/v1/api/recipes?_app_id="+app_id+"&_app_key="+app_key+"&"
    query_params = "q=" + params["searchbox"].gsub(/\s/, "+")
    # concatenating all the phrases into one long link
    link = yummly_api + query_params

    # NOTE - uncomment the code below when you are ready to make API calls
    # response = Typhoeus.get(link)
    # parsed = JSON.parse(response.body) #this is a hash    
    # @recipes = parsed["matches"]
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
            },
            {
                "attributes"=> {
                    "course"=> [
                        "Soups"
                    ],
                    "cuisine"=> [
                        "Moroccan",
                        "Asian"
                    ]
                },
                "flavors"=> {
                    "salty"=> 0.6666666666666666,
                    "sour"=> 0.6666666666666666,
                    "sweet"=> 0.5,
                    "bitter"=> 0.5,
                    "meaty"=> 0.3333333333333333,
                    "piquant"=> 0.6666666666666666
                },
                "rating"=> 5,
                "id"=> "Oriental-Inspired-Vegetable-Soup-Recipezaar",
                "smallImageUrls"=> [],
                "sourceDisplayName"=> "Food.com",
                "totalTimeInSeconds"=> 24300,
                "ingredients"=> [
                    "tamari",
                    "rice vinegar",
                    "bamboo shoots",
                    "lime juice",
                    "pepper",
                    "vegetable bouillon",
                    "sesame oil",
                    "salt",
                    "carrots",
                    "yellow onions",
                    "red pepper",
                    "garlic",
                    "fish",
                    "baby corn",
                    "crushed red pepper",
                    "spinach",
                    "cremini mushrooms",
                    "ginger",
                    "peanut oil",
                    "water",
                    "raw sugar",
                    "ketchup",
                    "chives",
                    "cabbage",
                    "water chestnuts",
                    "hot chili oil"
                ],
                "recipeName"=> "Oriental Inspired Vegetable Soup"
            },
            {
                "attributes"=> {
                    "course"=> [
                        "Main Dishes",
                        "Soups"
                    ],
                    "cuisine"=> [
                        "Italian"
                    ]
                },
                "flavors"=> {
                    "salty"=> 0.6666666666666666,
                    "sour"=> 0.5,
                    "sweet"=> 0.5,
                    "bitter"=> 0.8333333333333334,
                    "meaty"=> 0.6666666666666666,
                    "piquant"=> 0.6666666666666666
                },
                "rating"=> 5,
                "id"=> "Chunky-Rice-And-Bean-Soup-Recipezaar",
                "smallImageUrls"=> [],
                "sourceDisplayName"=> "Food.com",
                "totalTimeInSeconds"=> 2700,
                "ingredients"=> [
                    "dried oregano",
                    "chili powder",
                    "chopped celery",
                    "long grain rice",
                    "kidney beans",
                    "shredded cabbage",
                    "red pepper",
                    "carrot",
                    "onion",
                    "minced garlic",
                    "green beans",
                    "olive oil",
                    "pepper",
                    "vegetable stock"
                ],
                "recipeName"=> "Chunky Rice and Bean Soup"
            },
            {
                "attributes"=> {
                    "course"=> [
                        "Soups",
                        "Appetizers"
                    ],
                    "cuisine"=> [
                        "German"
                    ]
                },
                "flavors"=> {
                    "salty"=> 0.16666666666666666,
                    "sour"=> 0.6666666666666666,
                    "sweet"=> 0.3333333333333333,
                    "bitter"=> 0.16666666666666666,
                    "meaty"=> 0.16666666666666666,
                    "piquant"=> 0.5
                },
                "rating"=> 5,
                "id"=> "7-Samurai-Vegan-Soup-Recipezaar",
                "smallImageUrls"=> [],
                "sourceDisplayName"=> "Food.com",
                "totalTimeInSeconds"=> 3000,
                "ingredients"=> [
                    "carrots",
                    "cauliflower",
                    "water",
                    "onions",
                    "garlic cloves",
                    "pepper",
                    "potatoes",
                    "brussels sprouts",
                    "salt",
                    "olive oil",
                    "celery ribs",
                    "curry powder"
                ],
                "recipeName"=> "7 Samurai Vegan Soup"
            },
            {
                "attributes"=> {
                    "course"=> [
                        "Main Dishes",
                        "Soups"
                    ]
                },
                "flavors"=> {
                    "salty"=> 0.6666666666666666,
                    "sour"=> 0.8333333333333334,
                    "sweet"=> 0.6666666666666666,
                    "bitter"=> 0.5,
                    "meaty"=> 0.3333333333333333,
                    "piquant"=> 0.5
                },
                "rating"=> 5,
                "id"=> "Tomato-Lentil-Soup-Recipezaar_3",
                "smallImageUrls"=> [],
                "sourceDisplayName"=> "Food.com",
                "totalTimeInSeconds"=> 4500,
                "ingredients"=> [
                    "salt",
                    "onions",
                    "broccoli",
                    "celery",
                    "carrots",
                    "lentils",
                    "green pepper",
                    "tomato juice",
                    "tomato puree",
                    "apple cider vinegar",
                    "clove garlic",
                    "red cabbage",
                    "olive oil",
                    "zucchini",
                    "tamari",
                    "water",
                    "bay leaf"
                ],
                "recipeName"=> "Tomato Lentil Soup"
            }
          ]

    @cuisines = ["American", "Italian", "Asian", "Mexican", "Southern/Soul Food", "French", "Southwestern", "Barbecue", "Indian", "Chinese", "Cajun/Creole", "English", "Mediterranean", "Greek", "Spanish", "German", "Thai", "Moroccan", "Irish", "Japanese", "Cuban", "Hawaiian", "Swedish", "Hungarian", "Portugese"]

    render :results
  end

  def sandbox
    @recipes = params[:recipes]


    app_id="d571fa4e"
    app_key="4dfecc754af1efd478079989e96ef7b8"

    @recipes.each do | recipe |
        if recipe[1]["attributes"]["cuisine"]
            recipe[1]["attributes"]["cuisine"].each do | c |
                if c == "Italian"
                    link = "http://api.yummly.com/v1/api/recipe/"+recipe[1]["id"]+"?_app_id="+app_id+"&_app_key="+app_key
                    # NOTE - uncomment the code below when you are ready to make API calls
                    response = Typhoeus.get(link)
                    parsed = JSON.parse(response.body) #this is a hash    
                    ingredients = parsed["ingredientLines"]   
                    recipe[1]["ingredientLines"] = ingredients 
                    p recipe[1]["ingredientLines"]
                end
            end
        end            
    end

    respond_to do |f|
      # note how for HTML requests we still want to redirect
      f.html { render :results }
      # we send back the new restraunt as JSON.
      f.json { render json: @recipes }
    end    
  end
	
  def results
  end

  def index
  end

  def about
  end

  def contact
  end
end
