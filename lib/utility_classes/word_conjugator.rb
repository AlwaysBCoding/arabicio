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
				case root[1]
				when "w"
					[
						ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], root[2], 'y', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], root[2], 'w', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'entun', :present, ['t', root[0], root[2], 'n'], ['fa', 'da', 'sk', 'fa'] ),
						ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], root[2], 'w', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[2], 'n'], ['fa', 'da', 'sk', 'fa'] ),

						ArabicConjugation.new( 'ana', :past, [root[0], root[2], 't'], ['da', 'sk', 'da'] ),
						ArabicConjugation.new( 'enta', :past, [root[0], root[2], 't'], ['da', 'sk', 'fa'] ),
						ArabicConjugation.new( 'enti', :past, [root[0], root[2], 't'], ['da', 'sk', 'ka'] ),
						ArabicConjugation.new( 'hooa', :past, [root[0], 'aa', root[2]], [nil, nil, 'fa'] ),
						ArabicConjugation.new( 'heea', :past, [root[0], 'aa', root[2], 't'], [nil, nil, 'fa', 'sk'] ),
						ArabicConjugation.new( 'nahn', :past, [root[0], root[2], 'n', 'aa'], ['da', 'sk', nil, nil] ),
						ArabicConjugation.new( 'entum', :past, [root[0], root[2], 't', 'm'], ['da', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'entun', :past, [root[0], root[2], 't', 'n'], ['da', 'sk', 'da', 'dd'] ),
						ArabicConjugation.new( 'hoom', :past, [root[0], 'aa', root[2], 'w', 'aa'], [nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hoon', :past, [root[0], root[2], 'n'], ['da', 'sk', 'fa'] )
					]
				when "y"
					[
						ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], root[2], 'y', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], root[2], 'w', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'entun', :present, ['t', root[0], root[2], 'n'], ['fa', 'ka', 'sk', 'fa'] ),
						ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], root[2], 'w', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[2], 'n'], ['fa', 'ka', 'sk', 'fa'] ),

						ArabicConjugation.new( 'ana', :past, [root[0], root[2], 't'], ['ka', 'sk', 'da'] ),
						ArabicConjugation.new( 'enta', :past, [root[0], root[2], 't'], ['ka', 'sk', 'fa'] ),
						ArabicConjugation.new( 'enti', :past, [root[0], root[2], 't'], ['ka', 'sk', 'ka'] ),
						ArabicConjugation.new( 'hooa', :past, [root[0], 'aa', root[2]], [nil, nil, 'fa'] ),
						ArabicConjugation.new( 'heea', :past, [root[0], 'aa', root[2], 't'], [nil, nil, 'fa', 'sk'] ),
						ArabicConjugation.new( 'nahn', :past, [root[0], root[2], 'n', 'aa'], ['ka', 'sk', nil, nil] ),
						ArabicConjugation.new( 'entum', :past, [root[0], root[2], 't', 'm'], ['ka', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'entun', :past, [root[0], root[2], 't', 'n'], ['ka', 'sk', 'da', 'dd'] ),
						ArabicConjugation.new( 'hoom', :past, [root[0], 'aa', root[2], 'w', 'aa'], [nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hoon', :past, [root[0], root[2], 'n'], ['ka', 'sk', 'fa'] )
					]
				when "aa"
					[
						ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], root[2], 'y', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1], root[2]], ['fa', nil, nil, nil] ),
						ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], root[2], 'w', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'entun', :present, ['t', root[0], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),
						ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], root[2], 'w', 'n'], ['fa', nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

						ArabicConjugation.new( 'ana', :past, [root[0], root[2], 't'], ['ka', 'sk', 'da'] ),
						ArabicConjugation.new( 'enta', :past, [root[0], root[2], 't'], ['ka', 'sk', 'fa'] ),
						ArabicConjugation.new( 'enti', :past, [root[0], root[2], 't'], ['ka', 'sk', 'ka'] ),
						ArabicConjugation.new( 'hooa', :past, [root[0], 'aa', root[2]], [nil, nil, 'fa'] ),
						ArabicConjugation.new( 'heea', :past, [root[0], 'aa', root[2], 't'], [nil, nil, 'fa', 'sk'] ),
						ArabicConjugation.new( 'nahn', :past, [root[0], root[2], 'n', 'aa'], ['ka', 'sk', nil, nil] ),
						ArabicConjugation.new( 'entum', :past, [root[0], root[2], 't', 'm'], ['ka', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'entun', :past, [root[0], root[2], 't', 'n'], ['ka', 'sk', 'da', 'dd'] ),
						ArabicConjugation.new( 'hoom', :past, [root[0], 'aa', root[2], 'w', 'aa'], [nil, nil, nil, nil, nil] ),
						ArabicConjugation.new( 'hoon', :past, [root[0], root[2], 'n'], ['ka', 'sk', 'fa'] )
					]
				end
			when "assimilated"
				[
					ArabicConjugation.new( 'ana', :present, ['a', root[1], root[2]], ['fa', 'fa', nil] ),
					ArabicConjugation.new( 'enta', :present, ['t', root[1], root[2]], ['fa', 'fa', nil] ),
					ArabicConjugation.new( 'enti', :present, ['t', root[1], root[2], 'y', 'n'], ['fa', 'fa', nil, nil, nil] ),
					ArabicConjugation.new( 'hooa', :present, ['y', root[1], root[2]], ['fa', 'fa', nil] ),
					ArabicConjugation.new( 'heea', :present, ['t', root[1], root[2]], ['fa', 'fa', nil] ),
					ArabicConjugation.new( 'nahn', :present, ['n', root[1], root[2]], ['fa', 'fa', nil] ),
					ArabicConjugation.new( 'entum', :present, ['t', root[1], root[2], 'w', 'n'], ['fa', 'fa', nil, nil, nil] ),
					ArabicConjugation.new( 'entun', :present, ['t', root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :present, ['y', root[1], root[2], 'w', 'n'], ['fa', 'fa', nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :present, ['y', root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

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
					ArabicConjugation.new( 'ana', :present, ['amd', root[1], root[2]], [nil, 'da', nil] ),
					ArabicConjugation.new( 'enta', :present, ['t', 'a', root[1], root[2]], ['fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'enti', :present, ['t', 'a', root[1], root[2], 'y', 'n'], ['fa', 'sk', 'da', nil, nil, nil] ),
					ArabicConjugation.new( 'hooa', :present, ['y', 'a', root[1], root[2]], ['fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'heea', :present, ['t', 'a', root[1], root[2]], ['fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'nahn', :present, ['n', 'a', root[1], root[2]], ['fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entum', :present, ['t', 'a', root[1], root[2], 'w', 'n'], ['fa', 'sk', 'da', nil, nil, nil] ),
					ArabicConjugation.new( 'entun', :present, ['t', 'a', root[1], root[2], 'n'], ['fa', 'sk', 'da', 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :present, ['y', 'a', root[1], root[2], 'w', 'n'], ['fa', 'sk', 'da', nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :present, ['y', 'a', root[1], root[2], 'n'], ['fa', 'sk', 'da', 'sk', 'fa'] ),

					ArabicConjugation.new( 'ana', :past, ['a', root[1], root[2], 't'], ['fa', 'fa', 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :past, ['a', root[1], root[2], 't'], ['fa', 'fa', 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :past, ['a', root[1], root[2], 't'], ['fa', 'fa', 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :past, ['a', root[1], root[2]], ['fa', 'fa', 'fa'] ),
					ArabicConjugation.new( 'heea', :past, ['a', root[1], root[2], 't'], ['fa', 'fa', 'fa', 'sk'] ),
					ArabicConjugation.new( 'nahn', :past, ['a', root[1], root[2], 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :past, ['a', root[1], root[2], 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :past, ['a', root[1], root[2], 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :past, ['a', root[1], root[2], 'w', 'aa'], ['fa', 'fa', nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :past, ['a', root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] )
				]
			when "hamzated-medial"
				[
					ArabicConjugation.new( 'ana', :present, ['a', root[0], 'a', root[2]], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'enta', :present, ['t', root[0], 'a', root[2]], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'enti', :present, ['t', root[0], 'a', root[2], 'y', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
					ArabicConjugation.new( 'hooa', :present, ['y', root[0], 'a', root[2]], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'heea', :present, ['t', root[0], 'a', root[2]], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'nahn', :present, ['n', root[0], 'a', root[2]], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'entum', :present, ['t', root[0], 'a', root[2], 'w', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
					ArabicConjugation.new( 'entun', :present, ['t', root[0], 'a', root[2], 'n'], ['fa', 'sk', 'fa', 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :present, ['y', root[0], 'a', root[2], 'w', 'n'], ['fa', 'sk', 'fa', nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :present, ['y', root[0], 'a', root[2], 'n'], ['fa', 'sk', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( 'ana', :past, [root[0], 'a', root[2], 't'], ['fa', 'fa', 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :past, [root[0], 'a', root[2], 't'], ['fa', 'fa', 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :past, [root[0], 'a', root[2], 't'], ['fa', 'fa', 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :past, [root[0], 'a', root[2]], ['fa', 'fa', 'fa'] ),
					ArabicConjugation.new( 'heea', :past, [root[0], 'a', root[2], 't'], ['fa', 'fa', 'fa', 'sk'] ),
					ArabicConjugation.new( 'nahn', :past, [root[0], 'a', root[2], 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :past, [root[0], 'a', root[2], 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :past, [root[0], 'a', root[2], 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :past, [root[0], 'a', root[2], 'w', 'aa'], ['fa', 'fa', nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :past, [root[0], 'a', root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] )
				]
			when "hamzated-final"
				[
					ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1], 'a'], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1], 'a'], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], 'hy', 'y', 'n'], ['fa', 'sk', 'fa', 'ka', nil, nil] ),
					ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1], 'a'], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1], 'a'], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1], 'a'], ['fa', 'sk', 'fa', nil] ),
					ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], 'o', 'w', 'n'], ['fa', 'sk', 'fa', 'da', nil, nil] ),
					ArabicConjugation.new( 'entun', :present, ['t', root[0], root[1], 'a', 'n'], ['fa', 'sk', 'fa', 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], 'o', 'w', 'n'], ['fa', 'sk', 'fa', 'da', nil, nil] ),
					ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[1], 'a', 'n'], ['fa', 'sk', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( 'ana', :past, [root[0], root[1], 'a', 't'], ['fa', 'fa', 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :past, [root[0], root[1], 'a', 't'], ['fa', 'fa', 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :past, [root[0], root[1], 'a', 't'], ['fa', 'fa', 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :past, [root[0], root[1], 'a'], ['fa', 'fa', 'fa'] ),
					ArabicConjugation.new( 'heea', :past, [root[0], root[1], 'a', 't'], ['fa', 'fa', 'fa', 'sk'] ),
					ArabicConjugation.new( 'nahn', :past, [root[0], root[1], 'a', 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :past, [root[0], root[1], 'a', 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :past, [root[0], root[1], 'a', 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :past, [root[0], root[1], 'o', 'w', 'aa'], ['fa', 'fa', 'da', nil, nil] ),
					ArabicConjugation.new( 'hoon', :past, [root[0], root[1], 'a', 'n'], ['fa', 'fa', 'sk', 'fa'] )
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
