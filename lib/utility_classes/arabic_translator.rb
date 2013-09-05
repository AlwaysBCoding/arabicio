class ArabicTranslator

  def self.arabic_to_english_symbol_array(input)
    parsed_input = input.split("").map { |letter| ArabicLetter.find_by_ascii_value(letter.ord.to_s).english_symbol }
    # parsed_input.delete("fa")
    # parsed_input.delete("da")
    # parsed_input.delete("ka")
    # parsed_input.delete("sk")
    return parsed_input
  end

end
