class Api::V1::ArabicStemsController < Api::V1::BaseController

  def show
    respond_with :api, :v1, ArabicStem.find(params[:id]), serializer: ArabicStemSerializer
  end

end
