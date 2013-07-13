require 'spec_helper'

describe WordParser do

	describe "#parse_root, #parse_form" do

		context "Form I" do

			context "regular root" do

				context "present tense" do
					it "parses the root (y H m 3)" do
						arabic_word = %w[y H m 3]
						root = WordParser.parse_root(arabic_word)
						root.should eq %w[H m 3]
					end

					it "parses the form (y H m 3)" do
						arabic_word = %w[y H m 3]
						word_form = WordParser.parse_word_form(arabic_word)
						word_form.should eq 1
					end
				end

				context "past tense" do
					it "parses the root (m l k t)" do
						arabic_word = %w[m l k t]
						root = WordParser.parse_root(arabic_word)
						root.should eq %w[m l k]
					end

					it "parses the form (m l k t)" do
						arabic_word = %w[m l k t]
						word_form = WordParser.parse_word_form(arabic_word)
						word_form.should eq 1
					end

					it "parses the root (sh r b n aa)" do
						arabic_word = %w[sh r b n aa]
						root = WordParser.parse_root(arabic_word)
						root.should eq %w[sh r b]
					end

					it "parses the form (sh r b n aa)" do
						arabic_word = %w[sh r b n aa]
						word_form = WordParser.parse_word_form(arabic_word)
						word_form.should eq 1
					end
				end

			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form II" do

			context "regular root" do
			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form III" do

			context "regular root" do
			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form IV" do

			context "regular root" do
			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form V" do

			context "regular root" do
			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form VI" do

			context "regular root" do
			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form VII" do

			context "regular root" do
			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form VIII" do

			context "regular root" do
			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form IX" do

			context "regular root" do
			end

			context "doubled root" do
			end

			context "hamzated root" do
			end

			context "assimilated root" do
			end

			context "hollow root" do
			end

			context "defective root" do
			end

			context "doubly weak root" do
			end

		end

		context "Form X" do

			context "regular root" do
				it "parses the root (y s t k sh f)" do
					arabic_word = %w[y s t k sh f]
					root = WordParser.parse_root(arabic_word)
					root.should eq %w[k sh f]
				end

				it "parses the form (y s t k sh f)" do
					arabic_word = %w[y s t k sh f]
					word_form = WordParser.parse_word_form(arabic_word)
					word_form.should eq 10
				end

				it "parses the root (a s t kh d m)" do
					arabic_word = %w[a s t kh d m]
					root = WordParser.parse_root(arabic_word)
					root.should eq %w[kh d m]
				end

				it "parses the form (a s t kh d m)" do
					arabic_word = %w[a s t kh d m]
					word_form = WordParser.parse_word_form(arabic_word)
					word_form.should eq 10
				end

				it "parses the root (i s t H s aa n aa)" do
					arabic_word = %w[i s t H s aa n aa]
					root = WordParser.parse_root(arabic_word)
					root.should eq %w[H s n]
				end

				it "parses the form (i s t H s aa n aa)" do
					arabic_word = %w[i s t H s aa n aa]
					word_form = WordParser.parse_word_form(arabic_word)
					word_form.should eq 10
				end
			end

			context "doubled root" do
				it "parses the root (i s t D m aa m)" do
					arabic_word = %w[i s t D m aa m]
					root = WordParser.parse_root(arabic_word)
					root.should eq %w[D m m]
				end

				it "parses the form (i s t D m aa m)" do
					arabic_word = %w[i s t D m aa m]
					word_form = WordParser.parse_word_form(arabic_word)
					word_form.should eq 10
				end

				context "with tanween" do
					it "parses the root (i s t 3 d aa d an)" do
						arabic_word = %w[i s t 3 d aa d an]
						root = WordParser.parse_root(arabic_word)
						root.should eq %w[3 d d]
					end

					it "parses the form (i s t 3 d aa d an) with tanween (an)" do
						arabic_word = %w[i s t 3 d aa d an]
						word_form = WordParser.parse_word_form(arabic_word)
						word_form.should eq 10
					end
				end

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
