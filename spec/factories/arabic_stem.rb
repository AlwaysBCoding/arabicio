fa_da = {"perfect_kicker" => "fa", "imperfect_kicker" => "da"}
ka_fa = {"perfect_kicker" => "ka", "imperfect_kicker" => "fa"}
fa_ka = {"perfect_kicker" => "fa", "imperfect_kicker" => "ka"}
fa_fa = {"perfect_kicker" => "fa", "imperfect_kicker" => "fa"}

FactoryGirl.define do

  factory :arabic_stem do

    factory :sound do
      root ["d", "r", "s"]
      vocalization fa_da
      measures ["I", "II", "III", "VI", "VII"]
      # verbal_nouns [["d", "r", "s"]]
    end

    factory :assimilated_with_y_at_root0 do
      root ["y", "q", "DH"]
      vocalization ka_fa
      measures ["I", "II", "IV", "V", "X"]
      # verbal_nouns [["y", "q", "DH"]]
    end

    factory :assimilated_with_w_at_root0_perfect_kicker_ka do
      root ["w", "j", "3"]
      vocalization ka_fa
      measures ["I", "IV", "V"]
      # verbal_nouns [["w", "j", "3"]]
    end

    factory :assimilated_with_w_at_root0_perfect_kicker_fa do
      root ["w", "S", "l"]
      vocalization fa_ka
      measures ["I", "II", "III", "IV", "V", "VI", "VIII"]
      # verbal_nouns [["w", "S", "l"], ["S", "l", "tm"]]
    end

    factory :hamzated_with_hmz_at_root0 do
      root ["hmz", "k", "l"]
      vocalization fa_da
      measures ["I", "II", "III", "IV", "V", "VI"]
      # verbal_nouns [["a", "k", "l"], ["m", "a", "k", "l"]]
    end

    factory :hamzated_with_hmz_at_root1 do
      root ["s", "hmz", "l"]
      vocalization fa_fa
      measures ["I", "III", "IV", "V", "VI"]
      # verbal_nouns [["s", "hw", "aa", "l"], ["m", "s", "a", "l", "tm"]]
    end

  end

end
