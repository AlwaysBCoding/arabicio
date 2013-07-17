class WordConjugator

	def self.create_conjugations(root, form, subform)
		[
			ArabicCongugation.new( 'ana', :present, ['a', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicCongugation.new( 'enta', :present, ['t', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicCongugation.new( 'enti', :present, ['t', root[0], root[1], root[2], 'y', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
			ArabicCongugation.new( 'hooa', :present, ['y', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicCongugation.new( 'heea', :present, ['t', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicCongugation.new( 'nahn', :present, ['n', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicCongugation.new( 'entum', :present, ['t', root[0], root[1], root[2], 'w', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
			ArabicCongugation.new( 'entun', :present, ['t', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'fa', 'sk', 'fa'] ),
			ArabicCongugation.new( 'hoom', :present, ['y', root[0], root[1], root[2], 'w', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
			ArabicCongugation.new( 'hoon', :present, ['y', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'fa', 'sk', 'fa'] ),

			ArabicCongugation.new( 'ana', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'da'] ),
			ArabicCongugation.new( 'enta', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'fa'] ),
			ArabicCongugation.new( 'enti', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'ka'] ),
			ArabicCongugation.new( 'hooa', :past, [root[0], root[1], root[2], ['fa', 'fa', 'fa'] ),
			ArabicCongugation.new( 'heea', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'fa', 'sk'] ),
			ArabicCongugation.new( 'nahn', :past, [root[0], root[1], root[2], 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
			ArabicCongugation.new( 'entum', :past, [root[0], root[1], root[2], 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
			ArabicCongugation.new( 'entun', :past, [root[0], root[1], root[2], 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
			ArabicCongugation.new( 'hoom', :past, [root[0], root[1], root[2], 'w', 'aa'], ['fa', 'fa', nil, nil, nil] ),
			ArabicCongugation.new( 'hoon', :past, [root[0], root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] )
		]
	end

private

end
