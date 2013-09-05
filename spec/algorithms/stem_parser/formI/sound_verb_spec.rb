require "spec_helper"

describe StemParser do

  context "Form I" do

    context "Sound Verb" do
      context "base sound verb" do
        it "correctly parses the stem from the base 55 conjugations ( less the verbal noun )" do
          stem = create(:sound_base) # "d", "r", "s"
          conjugations = stem.conjugation_table_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
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
