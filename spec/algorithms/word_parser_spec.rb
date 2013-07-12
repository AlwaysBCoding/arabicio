require 'spec_helper'

describe WordParser do

	describe "#parse_root" do

		it "runs the test correctly" do
			parser = WordParser.new
			parser.parse_root(50).should eq 5
		end

	end

end
