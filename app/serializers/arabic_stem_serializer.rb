class ArabicStemSerializer < ActiveModel::Serializer
  attributes :root, :measures, :perfect_kicker, :imperfect_kicker, :verbal_nouns, :notes

# API DISPLAY METHODS
  def perfect_kicker
    case object.perfect_kicker
    when "fa" then return "FATHA" ;
    when "ka" then return "KASRA" ;
    when "da" then return "DAMMA" ;
    end
  end

  def imperfect_kicker
    case object.imperfect_kicker
    when "fa" then return "FATHA" ;
    when "ka" then return "KASRA" ;
    when "da" then return "DAMMA" ;
    end
  end

end
