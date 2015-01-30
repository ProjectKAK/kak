class SiteController < ApplicationController
  attr_accessor :recipes
  skip_before_filter  :verify_authenticity_token
  
  def index
  end

def search
    # Here we are breaking down a large URL into phrases
    app_id=ENV["APP_ID"]
    app_key=ENV["APP_KEY"]
    yummly_api ="http://api.yummly.com/v1/api/recipes?_app_id="+app_id+"&_app_key="+app_key+"&"

    max_results = 12
    allowed_cuisines = "&allowedCuisine[]=cuisine^cuisine-american&allowedCuisine[]=cuisine^cuisine-italian"
    query_params = "q=" + params["searchbox"].gsub(/\s/, "+") + "&requirePictures=true&maxResult="+ max_results.to_s + allowed_cuisines
    # concatenating all the phrases into one long link
    link = yummly_api + query_params

    # NOTE - uncomment the code below when you are ready to make API calls
    response = Typhoeus.get(link)
    parsed = JSON.parse(response.body) #this is a hash    
    @recipes = parsed["matches"]

    p @recipes.length

    # get the images
    @recipes.each do | recipe |
        link = "http://api.yummly.com/v1/api/recipe/"+recipe["id"]+"?_app_id="+app_id+"&_app_key="+app_key
        # NOTE - uncomment the code below when you are ready to make API calls
        response = Typhoeus.get(link)
        parsed = JSON.parse(response.body) #this is a hash    
        p parsed["images"][0]["hostedLargeUrl"]
        p parsed["ingredientLines"]
        recipe["image"] = parsed["images"][0]["hostedMediumUrl"]
        recipe["ingredientLines"] = parsed["ingredientLines"]

    end


    @cuisines = ["American", "Italian", "Asian", "Mexican", "French", "Barbecue", "Indian", "Chinese", "Greek", "Spanish", "German", "Thai", "Japanese"]

    render :results
  end

#this feature is not fully implemented yet
  def sandbox
    @recipes = params[:recipes]

    temp = []

    @recipes.each do | recipe |
        if recipe[1]["attributes"]["cuisine"]
            recipe[1]["attributes"]["cuisine"].each do | c |
                if c == "American"

                end
            end
        end            
    end

    @recipes = temp

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
