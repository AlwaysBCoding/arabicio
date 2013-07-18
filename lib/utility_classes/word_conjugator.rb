class WordConjugator

	def self.create_conjugations(root, form, subform)
		[
			ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], root[2], 'y', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
			ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1], root[2]], ['fa', 'sk', 'fa', nil] ),
			ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], root[2], 'w', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
			ArabicConjugation.new( 'entun', :present, ['t', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'fa', 'sk', 'fa'] ),
			ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], root[2], 'w', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
			ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'fa', 'sk', 'fa'] ),

			ArabicConjugation.new( 'ana', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'da'] ),
			ArabicConjugation.new( 'enta', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'fa'] ),
			ArabicConjugation.new( 'enti', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'ka'] ),
			ArabicConjugation.new( 'hooa', :past, [root[0], root[1], root[2]], ['fa', 'fa', 'fa'] ),
			ArabicConjugation.new( 'heea', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'fa', 'sk'] ),
			ArabicConjugation.new( 'nahn', :past, [root[0], root[1], root[2], 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
			ArabicConjugation.new( 'entum', :past, [root[0], root[1], root[2], 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
			ArabicConjugation.new( 'entun', :past, [root[0], root[1], root[2], 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
			ArabicConjugation.new( 'hoom', :past, [root[0], root[1], root[2], 'w', 'aa'], ['fa', 'fa', nil, nil, nil] ),
			ArabicConjugation.new( 'hoon', :past, [root[0], root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] )
		]
	end

private

end
