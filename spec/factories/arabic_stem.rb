sound_base_vocalization = {"perfect_kicker" => "fa", "imperfect_kicker" => "da"}

FactoryGirl.define do

  factory :arabic_stem do

    factory :sound_base do
      root ["d", "r", "s"]
      vocalization sound_base_vocalization
      measures ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"]
      verbal_nouns ["drs"]
    end

  end

end
