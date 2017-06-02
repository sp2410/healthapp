require 'preparedata.rb'

describe "#initialize" do 

	it "should create a new prepration class"  do
		data = Preparedata.new("input.txt")
		expect(data).to be_an_instance_of(Preparedata)		
	end
	

end

describe "#process" do 

	it "should process data, give the foods as sorted array of objects"  do
		data = Preparedata.new("input.txt")
		data.process
		# p data.foods
		expect(data.foods[0].timestamp).to eq(1496401200)		
		
	end

	it "should process data, give the exercises as sorted array of objects"  do
		data = Preparedata.new("input.txt")
		data.process		
		# p data.exercises
		expect(data.exercises[0].timestamp).to eq(1496401911)		
	end
	

end