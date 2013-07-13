class WordParser

	def self.parse_root(parsed_word, original_word=parsed_word)
		case parsed_word.length
		# when 10
		# when 9
		# when 8
		# when 7
		when 6
			parsed_word.delete_at(5) if %w[n].include?(parsed_word.last)
			WordParser.parse_root(parsed_word, original_word)

		when 5
			parsed_word.delete_at(4) if %w[aa y w n m].include?(parsed_word.last)
			parsed_word.delete_at(3) if %w[w].include?(parsed_word[3]) && parsed_word.length == 5
			WordParser.parse_root(parsed_word, original_word)

		when 4
			parsed_word.delete_at(3) if %w[t n w].include?(parsed_word.last)
			parsed_word.delete_at(0) if %w[a y t n m].include?(parsed_word.first) && parsed_word.length == 4
			parsed_word.delete("aa") if parsed_word.count("aa") == 1 && parsed_word.length == 4
			WordParser.parse_root(parsed_word, original_word)

		when 3
			return parsed_word

		else
			return original_word

		end
	end

	# def self.parse_word_form(arabic_word)

	# 	if arabic_word.length < 6
	# 		return 1
	# 	else
	# 		return 10
	# 	end

	# end

end
