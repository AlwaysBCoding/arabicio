class WordParser

	def self.parse_root(parsed_word, original_word=parsed_word)
		case parsed_word.length
		# when 10
		# when 9
		# when 8
		# when 7
		# when 6
		when 5
			parsed_word.delete_at(4) if %w[aa n m].include?(parsed_word.last)
			WordParser.parse_root(parsed_word, original_word)

		when 4
			parsed_word.delete_at(3) if %w[t n w].include?(parsed_word.last)
			parsed_word.delete_at(0) if parsed_word.first == "y"
			parsed_word.delete("aa") if parsed_word.count("aa") == 1
			WordParser.parse_root(parsed_word, original_word)

		when 3
			return parsed_word

		else
			return original_word

		end
		# %w[an on in].each { |symbol| arabic_word.delete(symbol) }

		# while arabic_word.length > 3

		# 	if arabic_word.length > 4
		# 		arabic_word.delete("aa")
		# 		if arabic_word[1] == "s" && arabic_word[2] == "t"
		# 			arabic_word = arabic_word[3..arabic_word.length-1]
		# 		end
		# 	end

		# 	if arabic_word.length == 4
		# 		arabic_word.delete_at(3) if %w[t n].include?(arabic_word.last)
		# 		arabic_word.delete_at(0) if arabic_word.first == "y"
		# 	end

		# end

		# Won't work if ALIF is in root

	end

	def self.parse_word_form(arabic_word)

		if arabic_word.length < 6
			return 1
		else
			return 10
		end

	end

end
