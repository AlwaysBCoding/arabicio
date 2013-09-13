class PagesController < ApplicationController

	def homepage
	end

	def parse_stem
		arabic_word = params[:arabic_word]
		candidates = StemParser.parse_stem(arabic_word)
		render json: candidates
	end

	def parse_word
		character_array = params[:word].split("")
		ascii_array = character_array.map { |letter| letter.ord }
	end

	def parse_subform
		character_array = params[:word].split("")
		root = character_array.map { |letter| ArabicLetter.find_by_ascii_value(letter.ord.to_s).english_symbol }
		form = "I"
		render json: ArabicWord.new(root, "I").to_json
	end

	def new_stem
	end

	def create_stem
		stem = ArabicStem.new
		if params[:root4].present?
			stem.root = [params[:root1].strip, params[:root2].strip, params[:root3].strip, params[:root4].strip]
		else
			stem.root = [ params[:root1].strip, params[:root2].strip, params[:root3].strip ]
		end

		stem.measures = params[:measure].map { |key, value| value.strip }
		stem.vocalization = { perfect_kicker: params[:perfect_kicker], imperfect_kicker: params[:imperfect_kicker] }
		stem.verbal_nouns = params[:verbal_nouns].gsub(/[^a-zA-z,]/, "").split(",")
		stem.notes = params[:notes] if params[:notes].present?

		stem.save ? flash[:success] = "Stem successfully added" : flash[:error] = "STEM WAS NOT SAVED" ;
		redirect_to new_stem_url
	end

end
