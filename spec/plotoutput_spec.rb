require "plotoutput.rb"
require 'pathname'

describe "#initialize" do 

	it "should initialize plotouput with required data"  do
		plot = Plotoutput.new("input.txt")
		expect(plot).to be_an_instance_of(Plotoutput)						
	end
	
end

describe "#plotbloodsugardata" do 

	it "should plot data and plot output"  do
		plot = Plotoutput.new("input.txt")
		plot.plotbloodsugardata	
		expect(Pathname.new("bloodsugar.png")).to exist			
	end
end

describe "#plotglycationdata" do 

	it "should call plot data and plot output"  do
		plot = Plotoutput.new("input.txt")		
		plot.plotglycationdata
		expect(Pathname.new("glycations.png")).to exist								
	end
	
end



