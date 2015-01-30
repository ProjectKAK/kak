class User < ActiveRecord::Base
	has_many :useringredients
	has_many :ingredients, :through => :useringredients

	#Validates email works, the code in front of with: is called an anchor
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	#checks if password confirmation macth
	validates :password, confirmation: true
	# validates :password, length: 8..20
	# must have a lenth of 8 character include one number and one letter /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/
	validates :password, :format => { :with => /[a-z]/, on: :create}

	# validates :city, :format => { :with => /[a-z]/, on: :create}

	# # validates :gender, inclusion: %w(male female)

	# validates :state, :format => { :with => /[a-z]/, on: :create} 

 


  	has_secure_password

  def self.confirm(email_param, password_param)
    user = User.find_by({email: email_param})
    user.authenticate(password_param)
  end

  def set_password_reset
	self.code = SecureRandom.urlsafe_base64
	self.expires_at = 4.hours.from_now
	self.save!
  end

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
  	new_results = User.get_similar_ingredients({"searchbox" => seed_term})  - prev_results
  	results = prev_results + new_results
  	results = results.inject(results) do |results, ingredient|
    	sleep(0.5)
    	results + (get_similar_ingredients({"searchbox" => ingredient}) - results)
    end
    if curr_level < level_limit
    	results = results.inject do |results, term|
    	 	results = User.scrape(term, curr_level + 1, level_limit, results)
    	end
    end
    results
  end
end

