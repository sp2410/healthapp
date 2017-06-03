require 'main.rb'

describe "#initialize" do 

	it "should call preparedata and set array fields"  do
		newmain = Main.new("input.txt")
		expect(newmain.foods[0].timestamp).to eq(1496401200)		
		expect(newmain.exercises[0].timestamp).to eq(1496401100)		
	end


	
end


describe "#initialize" do 
	it "should call do all the processing and set bloodglucose & glycation array"  do
		newmain = Main.new("input.txt")
		newmain.mainprocessor
		expect(newmain.bloodsugars[0].bloodsugar).to eq(80)		
		expect(newmain.glycations[0].glycation).to eq(1)		
	end

end