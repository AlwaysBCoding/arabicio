sound_vocalization = {"perfect_kicker" => "fa", "imperfect_kicker" => "da"}
assimilated_with_y_at_root0_vocalization = {"perfect_kicker" => "ka", "imperfect_kicker" => "fa"}

FactoryGirl.define do

  factory :arabic_stem do

    factory :sound do
      root ["d", "r", "s"]
      vocalization sound_vocalization
      measures ["I", "II", "III", "VI", "VII"]
      verbal_nouns ["drs"]
    end

    factory :assimilated_with_y_at_root0 do
      root ["y", "q", "DH"]
      vocalization assimilated_with_y_at_root0_vocalization
      measures ["I", "II", "IV", "V", "X"]
      verbal_nouns ["yqDH"]
    end

  end

end
