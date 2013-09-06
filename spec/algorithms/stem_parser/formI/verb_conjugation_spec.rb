require "spec_helper"

describe StemParser do

  context "Form I" do
    # BASE 60 Conjugations - NO Verbal Noun

    context "Sound Verb" do
      it "parses the stem of a base sound verb" do
        stem = create(:sound) # "d", "r", "s"
        conjugations = stem.conjugations_in_measure("I")
        conjugations.each do |conjugation|
          p conjugation.consonants
          candidates = StemParser.parse_stem(conjugation.to_arabic)
          candidates.map(&:root).should include(["d", "r", "s"])
        end
      end
    end

    context "Assimilated Verb" do
      it "parses the stem with 'y' at root0" do
        stem = create(:assimilated_with_y_at_root0) # "y", "q", "DH"
        conjugations = stem.conjugations_in_measure("I")
        conjugations.each do |conjugation|
          p conjugation.consonants
          candidates = StemParser.parse_stem(conjugation.to_arabic)
          candidates.map(&:root).should include(["y", "q", "DH"])
        end
      end
    end

  end

end
