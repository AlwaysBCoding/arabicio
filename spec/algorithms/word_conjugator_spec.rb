require 'spec_helper'

describe WordConjugator do

	describe "#create_conjugations" do

		context "Form I" do

			context "sound" do
				before(:all) do
					@root = %w[k t b]
					@form = "I"
					@subform = "sound"
					@conjugations = WordConjugator.create_conjugations(@root, @form, @subform)
				end

				it "returns the correct conjugations" do
					# conjugations = []
					# conjugations.format_for_test
					# conjugations.should eq expected
				end

			end

		end

	end

end
