class WordParser

	def self.parse_root(arabic_word)
		parsed_word = arabic_word

		%w[an on in].each { |symbol| parsed_word.delete(symbol) }

		# while parsed_word.length > 3
		10.times do

			if parsed_word.length > 4
				parsed_word.delete("aa")
				if parsed_word[1] == "s" && parsed_word[2] == "t"
					parsed_word = parsed_word[3..parsed_word.length-1]
				end
			end

			if parsed_word.length == 4
				parsed_word.delete_at(3) if %w[t n].include?(parsed_word.last)
				parsed_word.delete_at(0) if parsed_word.first == "y"
			end

		end

		return parsed_word

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
