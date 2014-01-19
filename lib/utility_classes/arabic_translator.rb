class ArabicTranslator

  def self.arabic_to_english_symbol_array(input)
    parsed_input = input.split("").map { |letter| ArabicLetter.find_by_ascii_value(letter.ord.to_s).english_symbol }
    return parsed_input
  end

end
