require "spec_helper"

describe StemParser do

  context "Form I" do

    context "Sound Verb" do
      context "base sound verb" do
        it "correctly parses the stem from the base 55 conjugations ( less the verbal noun )" do
          stem = create(:sound_base) # "d", "r", "s"
          conjugations = stem.generate_conjugation_table_for_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation)
            candidates.should include(["d", "r", "s"])
          end
        end
      end

      context "sound verb with root0 'y'" do
        it "correctly parses the stem from the base 55 conjugations ( less the verbal noun )" do
        end
      end

    end

  end

end
