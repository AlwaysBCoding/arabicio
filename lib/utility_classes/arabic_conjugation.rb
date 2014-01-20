class ArabicConjugation

	attr_accessor :consonants, :vowels, :perspective, :tense

	def initialize(perspective, tense, consonants, vowels)
		@perspective = perspective
		@tense = tense
		@consonants = consonants
		@vowels = vowels
    @unvocalized_arabic = consonants.flatten.compact.map { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value.to_i.chr }.join("")
    @vocalized_arabic = consonants.zip(vowels).flatten.compact.map { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value.to_i.chr }.join("")
	end

end
