require "spec_helper"

describe StemParser do

  context "Measure I" do
    # BASE 60 Conjugations - NO Verbal Noun

    context "Sound Verb" do

      context "with a base trilateral pattern" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:sound) # "d", "r", "s"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["d", "r", "s"])
          end
        end
      end

    end

    context "Doubled Verb" do
    end

    context "Assimilated Verb" do

      context "with 'y' at root0" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:assimilated_with_y_at_root0) # "y", "q", "DH"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["y", "q", "DH"])
          end
        end
      end

      context "with 'w' at root0" do
      end

    end

    context "Hollow Verb" do
    end

    context "Defective Verb" do
    end

    context "Hamzated Verb" do
    end

    context "Multiple Verb" do
    end

    context "Quadrilateral Verb" do
    end

  end

end
