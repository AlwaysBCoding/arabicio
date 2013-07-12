require 'spec_helper'

describe WordParser do

	describe "#parse_root" do

		context "Form I" do
		end

		context "Form II" do
		end

		context "Form III" do
		end

		context "Form IV" do
		end

		context "Form V" do
		end

		context "Form VI" do
		end

		context "Form VII" do
		end

		context "Form VIII" do
		end

		context "Form IX" do
		end

		context "Form X" do

			it "parses the root on a 'regular root'" do
				character_array = %w[i s t k sh f]
				root = WordParser.parse_root(character_array)
				root.should eq %w[k sh f]
			end

			# it "parses the form on a 'regular root'" do
			# 	character_array = [1575, 1587, 1578, 1603, 1588, 1601]
			# 	word_form = WordParser.parse_word_form(character_array)
			# 	word_form.should eq 10
			# end

			# it "parses the root on a 'doubled root'" do
			# 	character_array = [1575, 1587, 1578, 1590, 1605, 1575, 1605]
			# 	root = WordParser.parse_root(character_array)
			# 	root.should eq [1590, 1605, 1605]
			# end

			# it "parses the form on a 'doubled root'" do
			# 	character_array = [1575, 1587, 1578, 1590, 1605, 1575, 1605]
			# 	word_form = WordParser.parse_word_form(character_array)
			# 	word_form.should eq 10
			# end

		end

	end

end

def create_ascii_from_arabizi(arabizi=[])
	return arabizi.map { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value }
end

def create_arabizi_from_ascii(ascii=[])
	return ascii.map { |code| ArabicLetter.find_by_ascii_value(code).english_symbol }
end
