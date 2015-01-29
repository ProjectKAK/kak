class SiteController < ApplicationController
<<<<<<< HEAD
  attr_accessor :recipes

  def index
  end

  def search
    p params["searchbar"]
    # Here we are breaking down a large URL into phrases
    app_id="f88952b0"
    app_key="1eb3af17b84ff91a766c56b3713d67d9"
    yummly_api ="http://api.yummly.com/v1/api/recipes?_app_id="+app_id+"&_app_key="+app_key+"&"
    query_params = "q=" + params["searchbar"].gsub(/\s/, "+")

    # concatenating all the phrases into one long link
    link = yummly_api + query_params

  	# NOTE - uncomment the code below when you are ready to make API calls
    response = Typhoeus.get(link)
	parsed = JSON.parse(response.body) #this is a hash  	

 	@recipes = parsed["matches"]

  	render :results

  end
	
  def results
  end

=======
  def index
  end

  def about
  end

  def contact
  end
>>>>>>> password_reset
end
