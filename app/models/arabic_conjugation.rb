class ArabicConjugation

	attr_accessor :consonants, :vowels, :perspective, :tense

	def initialize(perspective, tense, consonants, vowels)
		@perspective = perspective
		@tense = tense
		@consonants = consonants
		@vowels = vowels
	end

end
