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
      verbal_nouns ["drs"]
    end

    factory :assimilated_with_y_at_root0 do
      root ["y", "q", "DH"]
      vocalization ka_fa
      measures ["I", "II", "IV", "V", "X"]
      verbal_nouns ["yqDH"]
    end

    factory :assimilated_with_w_at_root0_perfect_kicker_ka do
      root ["w", "j", "3"]
      vocalization ka_fa
      measures ["I", "IV", "V"]
      verbal_nouns ["wj3"]
    end

    factory :assimilated_with_w_at_root0_perfect_kicker_fa do
      root ["w", "S", "l"]
      vocalization fa_ka
      measures ["I", "II", "III", "IV", "V", "VI", "VIII"]
      verbal_nouns ["wSl", "Sltm"]
    end

  end

end
