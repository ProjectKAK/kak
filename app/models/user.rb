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
end

