require 'spec_helper'

describe ArabicStem do

  it "does not allow identical roots with the same vocalization" do
    stem = create(:arabic_stem, root: ["hi kh dh"], perfect_kicker: "fa", imperfect_kicker: "ka")
    stem2 = build(:arabic_stem, root: ["hi kh dh"], perfect_kicker: "fa", imperfect_kicker: "ka")
    stem2.save
    stem2.should have(1).error_on(:root)
  end

  it "allows identical roots with different vocalizations" do
    stem = create(:arabic_stem, root: ["hi kh dh"], perfect_kicker: "fa", imperfect_kicker: "ka")
    stem2 = build(:arabic_stem, root: ["hi kh dh"], perfect_kicker: "fa", imperfect_kicker: "da")
    stem2.should be_valid
  end

end
