require 'bloodsugar.rb'

describe "#initialize" do 

	it "should create a new bloodsugar instance"  do
		bloodsugar = BloodSugar.new(20, 1496262317)
		expect(bloodsugar).to be_an_instance_of(BloodSugar)		
	end
	

end