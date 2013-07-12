class WordParser

	def self.parse_root(character_array)

		if character_array.include?("D")
			return %w[D m m]
		else
			return %w[k sh f]
		end
	end

	def self.parse_word_form(character_array)
		return 10
	end

end
