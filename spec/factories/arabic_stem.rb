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
    end

    factory :doubled do
      root ["d", "l", "l"]
      vocalization fa_da
      measures ["I", "II", "VII"]
    end

    factory :assimilated_with_y_at_root0 do
      root ["y", "q", "DH"]
      vocalization ka_fa
      measures ["I", "II", "IV", "V", "X"]
    end

    factory :assimilated_with_w_at_root0_perfect_kicker_ka do
      root ["w", "j", "3"]
      vocalization ka_fa
      measures ["I", "IV", "V"]
    end

    factory :assimilated_with_w_at_root0_perfect_kicker_fa do
      root ["w", "S", "l"]
      vocalization fa_ka
      measures ["I", "II", "III", "IV", "V", "VI", "VIII"]
    end

    factory :hamzated_with_hmz_at_root0 do
      root ["hmz", "k", "l"]
      vocalization fa_da
      measures ["I", "II", "III", "IV", "V", "VI"]
    end

    factory :hamzated_with_hmz_at_root1 do
      root ["s", "hmz", "l"]
      vocalization fa_fa
      measures ["I", "III", "IV", "V", "VI"]
    end

    factory :hamzated_with_hmz_at_root2 do
      root ["q", "r", "hmz"]
      vocalization fa_fa
      measures ["I", "IV", "X"]
    end

    factory :hollow_with_w_at_root1_imperfect_kicker_da do
      root ["z", "w", "r"]
      vocalization fa_da
      measures ["I", "II", "IV", "VI", "IX", "X"]
    end

    factory :hollow_with_y_at_root1_imperfect_kicker_ka do
      root ["b", "y", "3"]
      vocalization fa_ka
      measures ["I", "III", "IV", "VI", "VII", "VIII"]
    end

    factory :hollow_with_w_at_root1_imperfect_kicker_fa do
      root ["kh", "w", "f"]
      vocalization fa_fa
      measures ["I", "II", "IV", "V"]
    end

    factory :defective_with_w_at_root2 do
      root ["d", "3", "w"]
      vocalization fa_da
      measures ["I", "III", "VI", "VIII", "X"]
    end

  end

end
