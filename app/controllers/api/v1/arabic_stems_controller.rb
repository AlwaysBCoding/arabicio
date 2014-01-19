class Api::V1::ArabicStemsController < Api::V1::BaseController

  def show
    respond_with :api, :v1, ArabicStem.find(params[:id]), serializer: ArabicStemSerializer
  end

  def analyze_word
    roots = StemParser.parse_stem(params[:word])
    roots.map! { |root| ArabicStem.stem_for_root(root) }.compact!
    render json: roots, each_serializer: ArabicStemSerializer
  end

end
