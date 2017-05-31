require 'food.rb'

describe "#initialize" do 

	it "should create a new food instance"  do
		food = Food.new("Banana cake, made with sugar", 47, 1496262317)
		expect(food).to be_an_instance_of(Food)		
	end	

end