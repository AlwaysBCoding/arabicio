class PagesController < ApplicationController

	def homepage
	end

	def parse_word
		character_array = params[:word].split("")
		ascii_array = character_array.map { |letter| letter.ord }
		raise ascii_array.inspect
	end

end
