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

	def new_root
	end

	def create_root
		# root = ArabicStem.new
		# if params[:root4].present?
		# 	root.root = [params[:root1].strip, params[:root2].strip, params[:root3].strip, params[:root4] ]
		# else
		# 	root.root = [ params[:root1].strip, params[:root2].strip, params[:root3].strip ]
		# end
		# root.forms = params[:word_forms].values.map { |value| value.strip }

		# if root.save
		# 	flash[:success] = "Root successfully added"
		# 	redirect_to new_root_url
		# else
		# 	flash[:error] = "ROOT WAS NOT SAVED"
		# 	redirect_to new_root_url
		# end
	end

end
