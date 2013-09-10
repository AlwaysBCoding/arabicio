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
      context "with a base doubled pattern" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:doubled) # "d", "l", "l"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["d", "l", "l"])
          end
        end
      end
    end

    context "Assimilated Verb" do
      context "with 'y' at root0, root0 is not assimilated" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:assimilated_with_y_at_root0) # "y", "q", "DH"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["y", "q", "DH"])
          end
        end
      end

      context "with 'w' at root0, perfect kicker is 'ka', root0 is not assimilated" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:assimilated_with_w_at_root0_perfect_kicker_ka) # "w", "j", "3"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["w", "j", "3"])
          end
        end
      end

      context "with 'w' at root0, perfect kicker is 'fa', root0 is assimilated" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:assimilated_with_w_at_root0_perfect_kicker_fa) # "w", "S", "l"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["w", "S", "l"])
          end
        end
      end
    end

    context "Hollow Verb" do
      context "with 'w' at root1, imperfect_kicker is 'da'" do
        it "parses the stem from the base60 conjugations" do
          stem = create(:hollow_with_w_at_root1_imperfect_kicker_da) # "z", "w", "r"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["z", "w", "r"])
          end
        end
      end

      context "with 'y' at root1, imperfect_kicker is 'ka'" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:hollow_with_y_at_root1_imperfect_kicker_ka) # "b", "y", "3"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["b", "y", "3"])
          end
        end

        context "with 'w' at root1, imperfect_kicker is 'fa'" do
          it "parses the stem from the base 60 conjugations" do
            stem = create(:hollow_with_w_at_root1_imperfect_kicker_fa) # "kh", "w", "f"
            conjugations = stem.conjugations_in_measure("I")
            conjugations.each do |conjugation|
              candidates = StemParser.parse_stem(conjugation.to_arabic)
              candidates.map(&:root).should include(["kh", "w", "f"])
            end
          end
        end
      end

    end

    context "Defective Verb" do
      context "with 'w' at root2" do
        it "parses the stem from the base 60 conjugations", :focus do
          stem = create(:defective_with_w_at_root2)
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["d", "3", "w"])
          end
        end
      end

      context "with 'y' at root2, vocalization fa_ka" do
        it "parses the stem from the base 60 conjugations", :focus do
          stem = create(:defective_with_y_at_root2_vocalization_fa_ka)
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["b", "n", "y"])
          end
        end
      end

      context "with 'y' at root2, vocalization ka_fa" do
        it "parses the stem from the base 60 conjugations", :focus do
          stem = create(:defective_with_y_at_root2_vocalization_ka_fa)
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["n", "s", "y"])
          end
        end
      end
    end

    context "Hamzated Verb" do
      context "with 'hmz' at root0" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:hamzated_with_hmz_at_root0) # "hmz", "k", "l"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["hmz", "k", "l"])
          end
        end
      end

      context "with 'hmz' at root1" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:hamzated_with_hmz_at_root1) # "s", "hmz", "l"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["s", "hmz", "l"])
          end
        end
      end

      context "with 'hmz' at root2" do
        it "parses the stem from the base 60 conjugations" do
          stem = create(:hamzated_with_hmz_at_root2) # "q", "r", "hmz"
          conjugations = stem.conjugations_in_measure("I")
          conjugations.each do |conjugation|
            candidates = StemParser.parse_stem(conjugation.to_arabic)
            candidates.map(&:root).should include(["q", "r", "hmz"])
          end
        end
      end
    end

    context "Multiple Verb" do
    end

    context "Quadrilateral Verb" do
    end

  end

end
