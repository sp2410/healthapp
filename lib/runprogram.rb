require "./plotoutput"

def runprogram
	plot = Plotoutput.new("input.txt")
	plot.plotbloodsugardata	
	plot.plotglycationdata
end

runprogram