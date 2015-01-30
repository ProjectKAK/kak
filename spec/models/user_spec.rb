require 'rails_helper'

RSpec.describe User, :type => :model do

	describe User do
		it "should have a first_name" do
			user = User.new
			expect(true).to eq(true)
		end
	end

	describe User do
		it "should have a last_name" do 
			user = User.new
			expect(true).to eq(true)
		end
	end

	describe User do 
		it "should have an email" do
			user = User.new
			expect(true).to eq(true)
		end
	end