class Food
	attr_accessor :name, :glycemic_index, :timestamp

	def initialize(name, glycemic_index, timestamp )
		@name = name
		@glycemic_index = glycemic_index
		@timestamp = timestamp
	end
	
end