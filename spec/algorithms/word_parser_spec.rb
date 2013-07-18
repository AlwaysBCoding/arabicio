require 'spec_helper'

describe WordParser do

	describe "#parse_root" do

		# context "Form I" do

		# 	context "regular root" do

		# 		context "present tense" do
		# 			it "parses the root for i" do
		# 				arabic_word = %w[a H m 3]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 			it "parses the root for you(s-m) / she" do
		# 				arabic_word = %w[t H m 3]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 			it "parses the root for you(s-f)" do
		# 				arabic_word = %w[t H m 3 y n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 			it "parses the root for he" do
		# 				arabic_word = %w[y H m 3]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 			it "parses the root for we" do
		# 				arabic_word = %w[n H m 3]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 			it "parses the root for you(p-m)" do
		# 				arabic_word = %w[t H m 3 w n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 			it "parses the root for you(p-f)" do
		# 				arabic_word = %w[t H m 3 n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 			it "parses the root for they(m)" do
		# 				arabic_word = %w[y H m 3 w n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 			it "parses the root for they(f)" do
		# 				arabic_word = %w[y H m 3 n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[H m 3]
		# 			end

		# 		end

		# 		context "past tense" do
		# 			it "parses the root for he" do
		# 				arabic_word = %w[m l k]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[m l k]
		# 			end

		# 			it "parses the root for i / you(s-m) / you(s-f) / she" do
		# 				arabic_word = %w[m l k t]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[m l k]
		# 			end

		# 			it "parses the root for we(p)" do
		# 				arabic_word = %w[m l k n aa]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[m l k]
		# 			end

		# 			it "parses the root for you(p-m)" do
		# 				arabic_word = %w[m l k t m]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[m l k]
		# 			end

		# 			it "parses the root for you(p-f)" do
		# 				arabic_word = %w[m l k t n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[m l k]
		# 			end

		# 			it "parses the root for they(m)" do
		# 				arabic_word = %w[m l k w aa]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[m l k]
		# 			end

		# 			it "parses the root for they(f)" do
		# 				arabic_word = %w[m l k n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[m l k]
		# 			end

		# 		end

		# 	end

		# 	context "doubled root" do

		# 		context "present tense" do
		# 			it "parses the root for i" do
		# 				arabic_word = %w[a d l]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for you(s-m) / she" do
		# 				arabic_word = %w[t d l l]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for you(s-f)" do
		# 				arabic_word = %w[t d l l y n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for he" do
		# 				arabic_word = %w[y d l]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for we" do
		# 				arabic_word = %w[n d l]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for you(p-m)" do
		# 				arabic_word = %w[t d l w n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for you(p-f)" do
		# 				arabic_word = %w[t d l l n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for they(m)" do
		# 				arabic_word = %w[y d l w n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for they(f)" do
		# 				arabic_word = %w[y d l l n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end
		# 		end

		# 		context "past tense" do
		# 			it "parses the root for he" do
		# 				arabic_word = %w[d l]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for i / you(s-m) / you(s-f)" do
		# 				arabic_word = %w[d l l t]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for she" do
		# 				arabic_word = %w[d l t]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for we(p)" do
		# 				arabic_word = %w[d l l n aa]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for you(p-m)" do
		# 				arabic_word = %w[d l l t m]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for you(p-f)" do
		# 				arabic_word = %w[d l l t n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for they(m)" do
		# 				arabic_word = %w[d l w aa]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end

		# 			it "parses the root for they(f)" do
		# 				arabic_word = %w[d l l n]
		# 				root = WordParser.parse_root(arabic_word)
		# 				root.should eq %w[d l l]
		# 			end
		# 		end

		# 	end

		# 	context "hamzated root" do

		# 		context "hamza-initial root" do

		# 			context "present tense" do

		# 				it "parses the root for i" do
		# 					arabic_word = %w[a k l]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for you(s-m) / she" do
		# 					arabic_word = %w[t a k l]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for you(s-f)" do
		# 					arabic_word = %w[t a k l y n]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for he" do
		# 					arabic_word = %w[y a k l]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for we" do
		# 					arabic_word = %w[n a k l]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for you(p-m)" do
		# 					arabic_word = %w[t a k l w n]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for you(p-f)" do
		# 					arabic_word = %w[t a k l n]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for they(m)" do
		# 					arabic_word = %w[y a k l w n]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for they(f)" do
		# 					arabic_word = %w[y a k l n]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end
		# 			end

		# 			context "past tense" do
		# 				it "parses the root for he" do
		# 					arabic_word = %w[a k l]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for i / you(s-m) / you(s-f) / she" do
		# 					arabic_word = %w[a k l t]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for we(p)" do
		# 					arabic_word = %w[a k l n aa]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for you(p-m)" do
		# 					arabic_word = %w[a k l t m]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for you(p-f)" do
		# 					arabic_word = %w[a k l t n]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for they(m)" do
		# 					arabic_word = %w[a k l w aa]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end

		# 				it "parses the root for they(f)" do
		# 					arabic_word = %w[a k l n]
		# 					root = WordParser.parse_root(arabic_word)
		# 					root.should eq %w[a k l]
		# 				end
		# 			end

		# 		end

		# 	end

		# 	context "assimilated root" do
		# 	end

		# 	context "hollow root" do
		# 	end

		# 	context "defective root" do
		# 	end

		# 	context "doubly weak root" do
		# 	end

		# end

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
		end

	end

	describe "#parse_form" do
	end

	describe "#parse_subform_from_root" do

		context "regular" do
			it "parses subform (k t b)" do
				root = %w[k t b]
				subform_of(root).should eq "sound"
			end

			it "parses suboform (m l k)" do
				root = %w[m l k]
				subform_of(root).should eq "sound"
			end
		end

		context "doubled" do
			it "parses subform (d m m)" do
				root = %w[d m m]
				subform_of(root).should eq "doubled"
			end

			it "parses subform (d l l)" do
				root = %w[d l l]
				subform_of(root).should eq "doubled"
			end
		end

		context "hamzated-initial" do
			it "parses suboform (hi k l)" do
				root = %w[hi k l]
				subform_of(root).should eq "hamzated-initial"
			end

			it "parses subform (hi kh dh)" do
				root = %w[hi kh dh]
				subform_of(root).should eq "hamzated-initial"
			end
		end

		context "hamzated-medial" do
			it "parses subform (s hi l)" do
				root = %w[s hi l]
				subform_of(root).should eq "hamzated-medial"
			end
			it "parses subform (l hi m)" do
				root = %w[l hi m]
				subform_of(root).should eq "hamzated-medial"
			end
		end

		context "hamzated-final" do
			it "parses subform (b d hi)" do
				root = %w[b d hi]
				subform_of(root).should eq "hamzated-final"
			end
			it "parses subform (q r hi)" do
				root = %w[q r hi]
				subform_of(root).should eq "hamzated-final"
			end
		end

		context "assimilated" do

			context "with waaw" do
				it "parses subform (w S l)" do
					root = %w[w S l]
					subform_of(root).should eq "assimilated"
				end
				it "parses subform (w s 3)" do
					root = %w[w s 3]
					subform_of(root).should eq "assimilated"
				end
			end

			context "with yaa" do
				it "parses subform (y s r)" do
					root = %w[y s r]
					subform_of(root).should eq "assimilated"
				end
				it "parses subform (y q DH)" do
					root = %w[y q DH]
					subform_of(root).should eq "assimilated"
				end
			end

		end

		context "hollow" do

			context "with waaw" do
				it "parses subform (q w l)" do
					root = %w[q w l]
					subform_of(root).should eq "hollow"
				end
				it "parses subform (z w r)" do
					root = %w[z w r]
					subform_of(root).should eq "hollow"
				end
			end

			context "with yaa" do
				it "parses subform (3 y sh)" do
					root = %w[3 y sh]
					subform_of(root).should eq "hollow"
				end
				it "parses subform (b y 3)" do
					root = %w[b y 3]
					subform_of(root).should eq "hollow"
				end
			end

		end

		context "defective" do

			context "with waaw" do
				it "parses subform (b d w)" do
					root = %w[b d w]
					subform_of(root).should eq "defective"
				end
				it "parses subform (d 3 w)" do
					root = %w[d 3 w]
					subform_of(root).should eq "defective"
				end
			end

			context "with yaa" do
				it "parses subform (m sh y)" do
					root = %w[m sh y]
					subform_of(root).should eq "defective"
				end
				it "parses subform (b q y)" do
					root = %w[b q y]
					subform_of(root).should eq "defective"
				end
			end

		end

		context "hollow-hamzated" do
			it "parses subform (j y hi)" do
				root = %w[j y hi]
				subform_of(root).should eq "hollow-hamzated"
			end
		end

		context "hamzated-defective" do
			it "parses subform (r hi y)" do
				root = %w[r hi y]
				subform_of(root).should eq "hamzated-defective"
			end
			it "parses subform (hi t y)" do
				root = %w[hi t y]
				subform_of(root).should eq "hamzated-defective"
			end
		end

		context "assimilated-defective" do
			it "parses subform (w l y)" do
				root = %w[w l y]
				subform_of(root).should eq "assimilated-defective"
			end
			it "parses subform (w 3 y)" do
				root = %w[w 3 y]
				subform_of(root).should eq "assimilated-defective"
			end
		end

		context "hollow-defective" do
			it "parses subform (n w y)" do
				root = %w[n w y]
				subform_of(root).should eq "hollow-defective"
			end
			it "parses subform (r w y)" do
				root = %w[r w y]
				subform_of(root).should eq "hollow-defective"
			end
		end

	end

def subform_of(root)
	return WordParser.parse_subform_from_root(root)
end

end
