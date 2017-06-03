require 'preparedata.rb'
require 'glycation.rb'
require 'bloodsugar.rb'
#When Running runprogram uncomment the require below and comment the above three lines
# require './preparedata'
# require './glycation'
# require './bloodsugar'

class Main	

	attr_accessor :input, :foods,:exercises,:bloodsugars,:glycations, :starttime

	def initialize(input)
		@data = Preparedata.new(input)
		@data.process
		@foods = @data.foods
		@exercises = @data.exercises
		@starttime = @data.starttime
		@endtime = @data.endtime
		@bloodsugars = []
		@glycations = []
	end

	def mainprocessor			
		time = @starttime
		glucose = 80
		glycation = 0

		while time <= @endtime

			#Get food in 2 hour range beforehand

			foods_considered = getfoods(time, @foods)			
			exercises_considered = getexercises(time, @exercises)

			# p time
			# p foods_considered.length
			# p exercises_considered.length


			if ((foods_considered.length == 0) and (exercises_considered.length == 0))
				
				glucose = 80  

			else

				foods_considered.each do |food|
					glucose = glucose + (((food.glycemic_index)*(time - food.timestamp))/60)					
				end

				#Get exercise in 1 hour range beforehand
				
				exercises_considered.each do |exercise|					
					glucose = glucose - (((exercise.exercise_index)*(time - exercise.timestamp))/60)
				end					
			end

			#store the new BloodSugar as object in an array

				newbloodsugar = BloodSugar.new(glucose, time)
				@bloodsugars << newbloodsugar

				#store the new Glycation as object in an array
				
				if (glucose > 150)					
					glycation = glycation + 1
					newglycation = Glycation.new(glycation, time)
					@glycations << newglycation
				end	

			time = time + 60
		end



	end

	def getfoods(time,foods)		
		farray = []
		foods.each do |food|
			if (food.timestamp > time )								
				return farray
			end

			if ((time - 7200) < food.timestamp) and (food.timestamp < time)				
				farray << food
			end 
		end			

		return farray
	end

	def getexercises(time,exercises)
		earray = []
		exercises.each do |exercise|
			if (exercise.timestamp > time )
				return earray
			end

			if ((time - 3600) < exercise.timestamp) and (exercise.timestamp < time)
				earray << exercise
			end 
		end

		return earray
	end



end