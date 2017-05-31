require 'exercise.rb'

describe "#initialize" do 

	it "should create a new exercise instance"  do
		exercise = Exercise.new("Crunches", 20, 1496262317)
		expect(exercise).to be_an_instance_of(Exercise)		
	end
	

end