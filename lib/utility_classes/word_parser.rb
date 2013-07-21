class WordParser

	def self.parse_root(parsed_word, original_word=parsed_word)
		# case parsed_word.length
		# # when 10
		# # when 9
		# # when 8
		# # when 7
		# when 6
		# 	parsed_word.delete_at(5) if %w[n].include?(parsed_word.last)
		# 	WordParser.parse_root(parsed_word, original_word)

		# when 5
		# 	parsed_word.delete_at(4) if %w[aa y w n m].include?(parsed_word.last)
		# 	parsed_word.delete_at(3) if %w[w].include?(parsed_word[3]) && parsed_word.length == 5
		# 	WordParser.parse_root(parsed_word, original_word)

		# when 4
		# 	parsed_word.delete_at(3) if %w[t n w].include?(parsed_word.last)
		# 	parsed_word.delete_at(0) if %w[a y t n m].include?(parsed_word.first) && parsed_word.length == 4
		# 	parsed_word.delete("aa") if parsed_word.count("aa") == 1 && parsed_word.length == 4
		# 	WordParser.parse_root(parsed_word, original_word)

		# when 3
		# 	if %w[a y n t].include?(parsed_word.first)
		# 		return [ parsed_word[1], parsed_word[2], parsed_word[2] ]
		# 	elsif %w[t w].include?(parsed_word.last)
		# 		return [ parsed_word[0], parsed_word[1], parsed_word[1] ]
		# 	else
		# 		return parsed_word
		# 	end

		# when 2
		# 	return [ parsed_word[0], parsed_word[1], parsed_word[1] ]

		# else
		# 	return parsed_word

		# end
	end

	def self.parse_word_form
	end

	def self.parse_subform_from_root(root=[])

		if root[0] == "hi" || root[0] == "a"
			if %w[w y].include?(root[2])
				return "hamzated-defective"
			else
				return "hamzated-initial"
			end

		elsif root[1] == "hi" || root[1] == "a"
			if %w[w y].include?(root[2])
				return "hamzated-defective"
			else
				return "hamzated-medial"
			end

		elsif root[2] == "hi" || root[2] == "a"
			if %w[w y].include?(root[1])
				return "hollow-hamzated"
			else
				return "hamzated-final"
			end

		elsif %w[w y amq].include?(root[2])
			if %w[w y aa].include?(root[0])
				return "assimilated-defective"
			elsif %w[w y].include?(root[1])
				return "hollow-defective"
			else
				return "defective"
			end

		elsif %w[w y aa].include?(root[0])
			return "assimilated"

		elsif %w[w y].include?(root[1])
			return "hollow"

		elsif root[1] == root[2]
			return "doubled"

		else
			return "sound"
		end

	end

end
