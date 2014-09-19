describe Vote do
	
	describe "validations" do

		before do
			@vote = Vote.create(title: 'vote title', body: 'vote body')
			3.times {@vote.valid.create(value: 1)}
			2.times {@vote.valid.create(value: -1)}
		end	
	
		describe "value validation" do
			it "only allows -1 or 1 as values" do
				expect( @vote.validations ).to eq(1),
				expect( @vote.validations ).to eq(-1)		
			end
		end
	end			
end