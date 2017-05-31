class Exercise
	attr_accessor :name, :exercise_index, :timestamp

	def initialize(name, exercise_index, timestamp )
		@name = name
		@exercise_index = exercise_index
		@timestamp = timestamp
	end
end