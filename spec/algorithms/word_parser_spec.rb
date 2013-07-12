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
				character_array = [1575, 1587, 1578, 1603, 1588, 1601]
				root = WordParser.parse_root(character_array)
				root.should eq [1603, 1588, 1601]
			end

			it "parses the form on a 'regular root'" do
				character_array = [1575, 1587, 1578, 1603, 1588, 1601]
				word_form = WordParser.parse_word_form(character_array)
				word_form.should eq 10
			end

			it "parses the root on a 'doubled root'" do
				character_array = [1575, 1587, 1578, 1590, 1605, 1575, 1605]
				root = WordParser.parse_root(character_array)
				root.should eq [1590, 1605, 1605]
			end

			it "parses the form on a 'doubled root'" do
				character_array = [1575, 1587, 1578, 1590, 1605, 1575, 1605]
				word_form = WordParser.parse_word_form(character_array)
				word_form.should eq 10
			end

		end

	end

end
