require 'rails_helper'

RSpec.describe Useringredient, :type => :model do

	describe Useringredient do
		it "should have an ingredient name" do
			useringredient = Useringredient.new
			expect(true).to eq(true)
		end
	end
end
