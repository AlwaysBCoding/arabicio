FactoryGirl.define do

  factory :arabic_stem do

    factory :sound do
      root ["d", "r", "s"]
      perfect_kicker "fa"
      imperfect_kicker "da"
      measures ["I", "II", "III", "VI", "VII"]
    end

    factory :doubled do
      root ["d", "l", "l"]
      perfect_kicker "fa"
      imperfect_kicker "da"
      measures ["I", "II", "VII"]
    end

    factory :assimilated_with_y_at_root0 do
      root ["y", "q", "DH"]
      perfect_kicker "ka"
      imperfect_kicker "fa"
      measures ["I", "II", "IV", "V", "X"]
    end

    factory :assimilated_with_w_at_root0_perfect_kicker_ka do
      root ["w", "j", "3"]
      perfect_kicker "ka"
      imperfect_kicker "fa"
      measures ["I", "IV", "V"]
    end

    factory :assimilated_with_w_at_root0_perfect_kicker_fa do
      root ["w", "S", "l"]
      perfect_kicker "fa"
      imperfect_kicker "ka"
      measures ["I", "II", "III", "IV", "V", "VI", "VIII"]
    end

    factory :hamzated_with_hmz_at_root0 do
      root ["hmz", "k", "l"]
      perfect_kicker "fa"
      imperfect_kicker "da"
      measures ["I", "II", "III", "IV", "V", "VI"]
    end

    factory :hamzated_with_hmz_at_root1 do
      root ["s", "hmz", "l"]
      perfect_kicker "fa"
      imperfect_kicker "fa"
      measures ["I", "III", "IV", "V", "VI"]
    end

    factory :hamzated_with_hmz_at_root2 do
      root ["q", "r", "hmz"]
      perfect_kicker "fa"
      imperfect_kicker "fa"
      measures ["I", "IV", "X"]
    end

    factory :hollow_with_w_at_root1_imperfect_kicker_da do
      root ["z", "w", "r"]
      perfect_kicker "fa"
      imperfect_kicker "da"
      measures ["I", "II", "IV", "VI", "IX", "X"]
    end

    factory :hollow_with_y_at_root1_imperfect_kicker_ka do
      root ["b", "y", "3"]
      perfect_kicker "fa"
      imperfect_kicker "ka"
      measures ["I", "III", "IV", "VI", "VII", "VIII"]
    end

    factory :hollow_with_w_at_root1_imperfect_kicker_fa do
      root ["kh", "w", "f"]
      perfect_kicker "fa"
      imperfect_kicker "fa"
      measures ["I", "II", "IV", "V"]
    end

    factory :defective_with_w_at_root2 do
      root ["d", "3", "w"]
      perfect_kicker "fa"
      imperfect_kicker "da"
      measures ["I", "III", "VI", "VIII", "X"]
    end

    factory :defective_with_y_at_root2_vocalization_fa_ka do
      root ["b", "n", "y"]
      perfect_kicker "fa"
      imperfect_kicker "ka"
      measures ["I", "V", "VII", "VIII"]
    end

    factory :defective_with_y_at_root2_vocalization_ka_fa do
      root ["n", "s", "y"]
      perfect_kicker "ka"
      imperfect_kicker "fa"
      measures ["I", "IV", "VI"]
    end

  end

end
