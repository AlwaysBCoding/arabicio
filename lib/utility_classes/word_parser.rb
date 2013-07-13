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
			if %w[a y n t].include?(parsed_word.first)
				return [ parsed_word[1], parsed_word[2], parsed_word[2] ]
			elsif %w[t w].include?(parsed_word.last)
				return [ parsed_word[0], parsed_word[1], parsed_word[1] ]
			else
				return parsed_word
			end

		when 2
			return [ parsed_word[0], parsed_word[1], parsed_word[1] ]

		else
			return parsed_word

		end
	end

	def self.parse_word_form
	end

	def self.parse_subform_from_root(root=[])

		if root[0] == "hi"
			return "hamzated-initial"

		elsif root[1] == "hi"
			return "hamzated-medial"

		elsif root[2] == "hi"
			return "hamzated-final"

		elsif root[1] == root[2]
			return "doubled"

		else
			return "regular"
		end

		# return "assimilated"
		# return "hollow"
		# return "defective"
		# # MIXED
		# return "hollow-hamzated"
		# return "hamzated-defective"
		# return "assimilated-defective"
		# return "hollow-defective"
	end

end
