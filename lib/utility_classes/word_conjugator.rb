class WordConjugator

	def self.create_conjugations(root, form, subform)
		case form

		when "I"
			case subform
			when "sound"
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
			when "doubled"
				[
					ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1]], ['fa', 'da', 'dd'] ),
					ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1]], ['fa', 'da', 'dd'] ),
					ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], 'y', 'n'], ['fa', 'da', 'dd'] ),
					ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1]], ['fa', 'da', 'dd'] ),
					ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1]], ['fa', 'da', 'dd'] ),
					ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1]], ['fa', 'da', 'dd'] ),
					ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], 'w', 'n'], ['fa', 'da', 'dd'] ),
					ArabicConjugation.new( 'entun', :present, ['t', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'da', 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], 'w', 'n'], ['fa', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'da', 'sk', 'fa'] ),

					ArabicConjugation.new( 'ana', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :past, [root[0], root[1]], ['fa', 'dd'] ),
					ArabicConjugation.new( 'heea', :past, [root[0], root[1], 't'], ['fa', 'dd', 'sk'] ),
					ArabicConjugation.new( 'nahn', :past, [root[0], root[1], root[2], 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :past, [root[0], root[1], root[2], 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :past, [root[0], root[1], root[2], 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :past, [root[0], root[1], 'w', 'aa'], ['fa', 'dd', nil, nil] ),
					ArabicConjugation.new( 'hoon', :past, [root[0], root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] )
				]
			when "hollow"
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
			when "assimilated"
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
			when "defective"
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
			when "hollow-defective"
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
			when "assimilated-defective"
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
			when "hamzated-initial"
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
			when "hamzated-medial"
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
			when "hamzated-final"
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
			when "hollow-hamzated"
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
			when "hamzated-defective"
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

		when "II"
		when "III"
		when "IV"
		when "V"
		when "VI"
		when "VII"
		when "VIII"
		when "IX"
		when "X"
		end

	end

private

end
