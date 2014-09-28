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

	describe 'after_save' do
		it "calls `Post#update_rank` after save" do
			post = create(:post)
			vote = Vote.new(value: 1, post: post)
			expect(post).to receive(:update_rank)
			vote.save 
		end
	end							
end
