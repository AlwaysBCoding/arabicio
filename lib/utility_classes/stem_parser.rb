class StemParser

	def self.parse_stem(input)
    candidates = []
    parsed_input = ArabicTranslator.arabic_to_english_symbol_array(input)
    candidates << self.guess_root(parsed_input)

    candidates.map! { |root| OpenStruct.new(root: root) }
    return candidates
	end

  def self.guess_root(input)
    return ["d", "r", "s"]
  end

end
