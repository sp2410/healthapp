require 'food.rb'
require 'exercise.rb'
#When Running runprogram uncomment the require below and comment the above two lines
# require './food'
# require './exercise'



class Preparedata

	attr_accessor :input, :foods, :exercises,:starttime, :endtime

	#Initializing as per the requirements and the best data structures which will be handy
	def initialize(input)		
		@foods = []
		@exercises = []
		@starttime = 9999999999
		@endtime = 0
		@input = input				
	end


				
	def sortfood		
		#Sort the food array according to timestamp in ascending order
			
		@foods.sort! { |a, b|  a.timestamp <=> b.timestamp}				
		@foods
				
	end

	def sortexercise		
		#Sort the exercise array according to timestamp in ascending order		
		@exercises.sort! { |a, b|  a.timestamp <=> b.timestamp}				
		@exercises
				
	end



	def process
		# Main function which reads the inputs, uses command for creating objects, and 
		# calculating the required paramerters for the objects
		begin

			File.open(@input.to_s).each do |line|

				arr = line.split("\t")	

				if arr[3].to_i < @starttime
					@starttime = arr[3].to_i
				end

				if arr[3].to_i > @endtime
					@endtime = arr[3].to_i
				end


				if (arr[0].to_s.eql? "Food")
					@foods << Food.new(arr[1].to_s, arr[2].to_f, arr[3].to_i)						
					 
				elsif (arr[0].to_s.eql? "Exercise")					
					@exercises << Exercise.new(arr[1].to_s, arr[2].to_f, arr[3].to_i)						
				end			
			end

			sortfood
			sortexercise
			
		rescue Errno::ENOENT => e
			#Error catching 
		  return false
		end				
	end



end
