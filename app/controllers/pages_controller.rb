class PagesController < ApplicationController

	def homepage
	end

	def parse_word
		character_array = params[:word].split("")
		ascii_array = character_array.map { |letter| letter.ord }
		raise ascii_array.inspect
	end

	def parse_subform
		character_array = params[:word].split("")
		root = character_array.map { |letter| ArabicLetter.find_by_ascii_value(letter.ord.to_s).english_symbol }
		form = "I"
		render json: ArabicWord.new(root, "I").to_json
	end

end
