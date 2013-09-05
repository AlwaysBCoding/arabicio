require "spec_helper"

describe ArabicTranslator do

  describe "#self.arabic_to_english_symbol_array" do

    it "converts a vocalized arabic word to an array of english consonants" do
      input = "أَكْتُبُ"
      parsed_input = ArabicTranslator.arabic_to_english_symbol_array(input)
      parsed_input.should eq ["a", "k", "t", "b"]

      input = "تَكْتُبُ"
      parsed_input = ArabicTranslator.arabic_to_english_symbol_array(input)
      parsed_input.should eq ["t", "k", "t", "b"]
    end

  end

end
