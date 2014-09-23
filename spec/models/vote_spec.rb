require 'rails_helper'

describe Vote do

	describe "validations" do

  		before do
  			@first_vote = Vote.new(value: -1)
  			@second_vote = Vote.new(value: 1)
		end	

		describe "first_validation" do
			it "only allows -1 as a value" do
				expect(@first_vote.value).to eq(-1)
			end
		end

		describe "second_validation" do
			it "only allows 1 as a value" do
				expect(@second_vote.value).to eq(1)
			end
		end
	end					
end
