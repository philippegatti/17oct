class Boardcase
	attr_accessor :position
	attr_accessor :value

	def initialize(position)
		@position = position 
		@value = nil
	end

	def is_free? # permet de verifier si une case est déjà jouée ou non
		@value == nil
	end
end