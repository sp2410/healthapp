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
		@foods = @data.foods #get food object array we got from input
		@exercises = @data.exercises #get exercise object array we got from input
		@starttime = @data.starttime #get minimum time
		@endtime = @data.endtime #get max time
		@bloodsugars = []
		@glycations = []
	end

	def mainprocessor			
		time = @starttime #start from starttime at start of day
		glucose = 80 #glucose at start of day
		glycation = 0 #glycation at start of day

		while time <= @endtime

			#Get food in 2 hour range beforehand
			foods_considered = getfoods(time, @foods)

			#Get exercise in 1 hour range beforehand			
			exercises_considered = getexercises(time, @exercises)

			#If there has been no exercise or food consumed in 1 and 2 hours respectively
			if ((foods_considered.length == 0) and (exercises_considered.length == 0))
				
				#set glucose to 80
				glucose = 80  

			else
			#Else 
				#Go through each food and calculate the glucose gain in that interval with respect to 
				#glycemic_index
				foods_considered.each do |food|
					glucose = glucose + (((food.glycemic_index)*(time - food.timestamp))/60)					
				end

				#Get exercise in 1 hour range beforehand
				#Go through each exercise and calculate the glucose loss in that interval with respect to 
				#exercise_index				
				exercises_considered.each do |exercise|					
					glucose = glucose - (((exercise.exercise_index)*(time - exercise.timestamp))/60)
				end					
			end

			#store the new BloodSugar as an object in an array

			newbloodsugar = BloodSugar.new(glucose, time)
			@bloodsugars << newbloodsugar


			#store the new Glycation as a new object in an array				
			if (glucose > 150)			
				# increment by one if glucose is above 150
				glycation = glycation + 1
				newglycation = Glycation.new(glycation, time)
				@glycations << newglycation
			end	

			#iterate by 1 minute
			time = time + 60
		end



	end

	def getfoods(time,foods)		
		farray = []
		foods.each do |food|
			if (food.timestamp > time )	
				#Since array is sorted, if we get a timestamp greater than given time, we need to return the array 
				# made so far							
				return farray
			end

			if (((time - 7200) < food.timestamp) and (food.timestamp < time))				
				#if the food had been consumed within last two hours according to given time add to array
				farray << food
			end 
		end			

		return farray
	end

	def getexercises(time,exercises)
		earray = []
		exercises.each do |exercise|
			if (exercise.timestamp > time )
				#Since array is sorted, if we get a timestamp greater than given time, we need to return the array 
				# made so far							
				return earray
			end

			if (((time - 3600) < exercise.timestamp) and (exercise.timestamp < time))
				#if the exercise had been done within last one hours according to given time add to array
				earray << exercise
			end 
		end

		return earray
	end



end