require 'glycation.rb'

describe "#initialize" do 

	it "should create a new glycation instance"  do
		glycation = Glycation.new(40, 1496262317)
		expect(glycation).to be_an_instance_of(Glycation)		
	end
	
end