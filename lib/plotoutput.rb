require 'gchart'
require './main'

class Plotoutput

	def initialize(input)
		@newmain = Main.new(input)
		@newmain.mainprocessor
		@starttime = @newmain.starttime
		@bloodsugars = @newmain.bloodsugars
		@glycations = @newmain.glycations
	end


	def plotbloodsugardata

			bloodsugar = []
			time = []

			@bloodsugars.each do |data|
				bloodsugar << (data.bloodsugar).to_i			
				time << (data.timestamp - @starttime)				
			end
			

			bar_chart = Gchart.new(
            :type => 'line',
            :size => '600x400',
            :bar_colors => ['000000', '0088FF'],
            :title => "Blood Sugar",
            :bg => 'EFEFEF',            
            :data => bloodsugar,
            :filename => 'bloodsugar.png',
            :stacked => false,            
            :legend_position => 'bottom',
            :axis_with_labels => 'x',            
            :axis_labels => [time]            
            )

			bar_chart.file


	end

	def plotglycationdata

			glycation = []
			time = []

			@glycations.each do |data|
				glycation << (data.glycation).to_i			
				time << (data.timestamp - @starttime)				
			end

			bar_chart = Gchart.new(
            :type => 'line',
            :size => '600x400',
            :bar_colors => ['000000', '0088FF'],
            :title => "Glycation",
            :bg => 'EFEFEF',            
            :data => glycation,
            :filename => 'glycations.png',
            :stacked => false,            
            :legend_position => 'bottom',
            :axis_with_labels => 'x',            
            :axis_labels => [time]            
            )

			bar_chart.file			

	end
	

end