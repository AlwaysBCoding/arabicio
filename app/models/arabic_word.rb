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
			conjugations: convert_conjugations_to_arabic(@conjugations)
		}
	end

private
	def convert_root_to_arabic(root)
		root.map { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value.to_i.chr }
	end

	def convert_conjugations_to_arabic(conjugations)
		hash = {
			present: {},
			past: {}
		}

		conjugations.each do |tense, value|
			value.each do |perspective, conjugation|
				hash[tense][perspective] = conjugation.map { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value.to_i.chr }.join("").inspect
			end
		end

		return hash

	end

end
