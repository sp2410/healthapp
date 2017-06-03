require 'preparedata.rb'

describe "#initialize" do 

	it "should create a new prepration class"  do
		data = Preparedata.new("input.txt")
		expect(data).to be_an_instance_of(Preparedata)		
	end
	

end

describe "#process" do 

	before :each do
		@data = Preparedata.new("input.txt")
		@data.process
	end	

	it "should process data, give the foods as sorted array of objects"  do
		expect(@data.foods[0].timestamp).to eq(1496401200)		
	end

	it "should process data, give the exercises as sorted array of objects"  do				
		expect(@data.exercises[0].timestamp).to eq(1496401100)		
	end

	it "should set start and end timing needed for the dataset"  do				
		expect(@data.starttime).to eq(1496401100)		
		expect(@data.endtime).to eq(1496401999)		

	end
	

end
