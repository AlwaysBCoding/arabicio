require "spec_helper"

describe StemCategorizer do

  context "Sound Verb" do
    it "categorizes a base sound verb" do
      stem = create(:arabic_stem, root: ["d", "r", "s"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "sound", root_subcategory: nil}
    end
  end

  context "Doubled Verb" do
    it "categorizes a base doubled verb" do
      stem = create(:arabic_stem, root: ["q", "r", "r"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "doubled", root_subcategory: nil}
    end
  end

  context "Hollow Verb" do
    it "categorizes a hollow verb where root1 is 'w'" do
      stem = create(:arabic_stem, root: ["z", "w", "r"], vocalization: {"imperfect_kicker" => "da"})
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "hollow", root_subcategory: "hollow-w"}
    end

    it "categorizes a hollow verb where root1 is 'y" do
      stem = create(:arabic_stem, root: ["s", "y", "r"], vocalization: {"imperfect_kicker" => "ka"})
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "hollow", root_subcategory: "hollow-y"}
    end

    it "categorizes a hollow verb where root1 is 'y' or 'w' and imperfect-kicker is 'fa'" do
      stem = create(:arabic_stem, root: ["kh", "w", "f"], vocalization: {"imperfect_kicker" => "fa"})
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "hollow", root_subcategory: "hollow-aa"}
    end
  end

  context "Assimilated Verb" do
    it "categorizes an assimilated verb where root0 is 'y'" do
      stem = create(:arabic_stem, root: ["y", "s", "r"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "assimilated", root_subcategory: "assimilated-y"}
    end
    it "categorizes an assimilated verb where root0 is 'w' and perfect_kicker is 'ka'" do
      stem = create(:arabic_stem, root: ["w", "j", "d"], vocalization: {"perfect_kicker" => "ka", "imperfect_kicker" => "fa"})
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "assimilated", root_subcategory: "assimilated-concatenation"}
    end
    it "categorizes an assimilated verb where root0 is 'w' and perfect_kicker is 'fa'" do
      stem = create(:arabic_stem, root: ["w", "S", "l"], vocalization: {"perfect_kicker" => "fa", "imperfect_kicker" => "ka"})
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "assimilated", root_subcategory: "assimilated-deletion"}
    end
  end

  context "Defective Verb" do
    it "categorizes a defective verb where root2 is 'w'" do
      stem = create(:arabic_stem, root: ["n", "j", "w"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "defective", root_subcategory: "defective-w"}
    end

    it "categorizes a defective verb where root2 is 'y' and perfect_kicker is 'fa' and imperfect_kicker is 'ka'" do
      stem = create(:arabic_stem, root: ["b", "n", "y"], vocalization: {"perfect_kicker" => "fa", "imperfect_kicker" => "ka"})
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "defective", root_subcategory: "defective-y-fa_ka"}
    end

    it "categorizes a defective verb where root2 is 'y' and perfect_kicker is 'ka', and imperfect_kicker is 'fa'" do
      stem = create(:arabic_stem, root: ["n", "s", "y"], vocalization: {"perfect_kicker" => "ka", "imperfect_kicker" => "fa"})
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "defective", root_subcategory: "defective-y-ka_fa"}
    end
  end

  context "Hamzated Verb" do
    it "categorizes a hamzated verb where root0 is 'hmz'" do
      stem = create(:arabic_stem, root: ["hmz", "k", "l"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "hamzated", root_subcategory: "hamzated-initial"}
    end

    it "categorizes a hamzated verb where root1 is 'hmz'" do
      stem = create(:arabic_stem, root: ["s", "hmz", "l"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "hamzated", root_subcategory: "hamzated-medial"}
    end

    it "categorizes a hamzated verb where root2 is 'hmz'" do
      stem = create(:arabic_stem, root: ["q", "r", "hmz"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "hamzated", root_subcategory: "hamzated-final"}
    end
  end

  context "Quadrilateral Verb" do
    it "categorizes a base quadrilateral verb" do
      stem = create(:arabic_stem, root: ["t", "r", "j", "m"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "quadrilateral", root_subcategory: nil}
    end
  end

  context "Multiple" do
    it "categorizes a hollow-hamzated verb where root1 is hollow and root2 is hamzated" do
      stem = create(:arabic_stem, root: ["j", "y", "hmz"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "hollow-hamzated", root_subcategory: "hollow-hamzated-final"}
    end

    it "categorizes an assimilated-defective verb where root0 is 'w' amd root2 is defective" do
      stem = create(:arabic_stem, root: ["w", "3", "y"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "assimilated-defective", root_subcategory: "assimilated-defective-y"}
    end

    it "categorizes a hollow-defective verb where root0 is 'w' and root2 is defective" do
      stem = create(:arabic_stem, root: ["n", "w", "y"])
      categorization = StemCategorizer.categorize(stem)
      categorization.should == {root_category: "hollow-defective", root_subcategory: "hollow-defective-y"}
    end

  end

end
