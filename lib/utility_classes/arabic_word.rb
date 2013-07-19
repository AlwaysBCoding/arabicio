class ArabicWord

	attr_accessor :root, :subform, :form, :conjugations

	def initialize(root, form)
		@root = root
		@form = form
		@subform = WordParser.parse_subform_from_root(root)
		@conjugations = WordConjugator.create_conjugations(root, form, subform)
	end

	def to_json
		{
			root: convert_root_to_arabic(@root),
			subform: @subform,
			form: @form,
			conjugations: format_conjugations_as_json(@conjugations)
		}
	end

private
	def convert_root_to_arabic(root)
		root.map { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value.to_i.chr }
	end

	def format_conjugations_as_json(conjugations)
		arabic_conjugations = convert_conjugations_to_arabic(conjugations)
		past_tense_json, present_tense_json, participle_json = {}, {}, {}

		present_tense_conjugations = arabic_conjugations.select { |conjugation| conjugation.tense == :present }
		past_tense_conjugations = arabic_conjugations.select { |conjugation| conjugation.tense == :past }
		participle_conjugations = arabic_conjugations.select { |conjugation| [:active_participle, :passive_participle, :verbal_noun].include?(conjugation.tense) }

		present_tense_conjugations.each { |conjugation| present_tense_json[conjugation.perspective] = conjugation.consonants.zip(conjugation.vowels).flatten.compact.join("") }
		past_tense_conjugations.each { |conjugation| past_tense_json[conjugation.perspective] = conjugation.consonants.zip(conjugation.vowels).flatten.compact.join("") }
		participle_conjugations.each { |conjugation| participle_json[conjugation.tense] = conjugation.consonants.zip(conjugation.vowels).flatten.compact.join("") }

		return { present: present_tense_json, past: past_tense_json, participles: participle_json }
	end

	def convert_conjugations_to_arabic(conjugations)
		conjugations.each do |conjugation|
			conjugation.consonants.map! { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value.to_i.chr }
			conjugation.vowels.map! { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value.to_i.chr if letter.present? }
		end
	end

end
