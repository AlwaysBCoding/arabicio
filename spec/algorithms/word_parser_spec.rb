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

			it "parses the root on the regular root (k sh f)" do
				arabic_word = %w[y s t k sh f]
				root = WordParser.parse_root(arabic_word)
				root.should eq %w[k sh f]
			end

			it "parses the form on the regular root (k sh f)" do
				arabic_word = %w[y s t k sh f]
				word_form = WordParser.parse_word_form(arabic_word)
				word_form.should eq 10
			end

			it "parses the root on the regular root (kh d m)" do
				arabic_word = %w[a s t kh d m]
				root = WordParser.parse_root(arabic_word)
				root.should eq %w[kh d m]
			end

			it "parses the form on the regular root (kh d m)" do
				arabic_word = %w[a s t kh d m]
				word_form = WordParser.parse_word_form(arabic_word)
				word_form.should eq 10
			end

			it "parses the root on the doubled root (D m m)" do
				arabic_word = %w[i s t D m aa m]
				root = WordParser.parse_root(arabic_word)
				root.should eq %w[D m m]
			end

			it "parses the form on the doubled root (D m m)" do
				arabic_word = %w[i s t D m aa m]
				word_form = WordParser.parse_word_form(arabic_word)
				word_form.should eq 10
			end

		end

	end

end

# HELPER METHODS
def create_ascii_from_arabizi(arabizi=[])
	return arabizi.map { |letter| ArabicLetter.find_by_english_symbol(letter).ascii_value }
end

def create_arabizi_from_ascii(ascii=[])
	return ascii.map { |code| ArabicLetter.find_by_ascii_value(code).english_symbol }
end
