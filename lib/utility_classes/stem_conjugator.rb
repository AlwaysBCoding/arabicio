class StemConjugator

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
					ArabicConjugation.new( 'hoon', :past, [root[0], root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', root[1], root[2]], [nil, nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', root[0], root[1], 'w', root[2]], ['fa', 'sk', nil, nil, nil] )

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
					ArabicConjugation.new( 'hoon', :past, [root[0], root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', root[1]], [nil, nil, 'dd'] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', root[0], root[1], 'w', root[2]], ['fa', 'sk', nil, nil, nil] )
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
						ArabicConjugation.new( 'hoon', :past, [root[0], root[2], 'n'], ['da', 'sk', 'fa'] ),

						ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', 'hy', root[2]], [nil, nil, 'ka', nil] ),
						ArabicConjugation.new( nil, :passive_participle, ['m', root[0], root[1], root[2]], ['fa', nil, nil, nil] )
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
						ArabicConjugation.new( 'hoon', :past, [root[0], root[2], 'n'], ['ka', 'sk', 'fa'] ),

						ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', 'hy', root[2]], [nil, nil, 'ka', nil] ),
						ArabicConjugation.new( nil, :passive_participle, ['m', root[0], root[1], root[2]], ['fa', nil, nil, nil] )
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
						ArabicConjugation.new( 'hoon', :past, [root[0], root[2], 'n'], ['ka', 'sk', 'fa'] ),

						ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', 'hy', root[2]], [nil, nil, 'ka', nil] ),
						ArabicConjugation.new( nil, :passive_participle, ['m', root[0], 'w', root[2]], ['fa', nil, nil, nil] )
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
					ArabicConjugation.new( 'hoon', :past, [root[0], root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', root[1], root[2]], [nil, nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', root[0], root[1], 'w', root[2]], ['fa', 'sk', nil, nil, nil] )
				]
			when "defective"
				case root[2]
				when "w"
					[
						ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1], root[2]], ['fa', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1], root[2]], ['fa', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], root[2], 'y', 'n'], ['fa', 'sk', 'ka', nil, nil, nil] ),
						ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1], root[2]], ['fa', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1], root[2]], ['fa', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1], root[2]], ['fa', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'da', nil, nil] ),
						ArabicConjugation.new( 'entun', :present, ['t', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'da', nil, 'fa'] ),
						ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'da', nil, nil] ),
						ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[1], root[2], 'n'], ['fa', 'sk', 'da', nil, 'fa'] ),

						ArabicConjugation.new( 'ana', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'da'] ),
						ArabicConjugation.new( 'enta', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'fa'] ),
						ArabicConjugation.new( 'enti', :past, [root[0], root[1], root[2], 't'], ['fa', 'fa', 'sk', 'ka'] ),
						ArabicConjugation.new( 'hooa', :past, [root[0], root[1], 'aa'], ['fa', 'fa', nil] ),
						ArabicConjugation.new( 'heea', :past, [root[0], root[1], 't'], ['fa', 'fa', 'sk'] ),
						ArabicConjugation.new( 'nahn', :past, [root[0], root[1], root[2], 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
						ArabicConjugation.new( 'entum', :past, [root[0], root[1], root[2], 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'entun', :past, [root[0], root[1], root[2], 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
						ArabicConjugation.new( 'hoom', :past, [root[0], root[1], root[2], 'aa'], ['fa', 'fa', 'sk', nil] ),
						ArabicConjugation.new( 'hoon', :past, [root[0], root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

						ArabicConjugation.new( nil, :active_participle, [root[0], root[1], 'aa'], [nil, nil, 'in'] ),
						ArabicConjugation.new( nil, :passive_participle, ['m', root[0], root[1], root[2]], ['fa', 'sk', 'da', 'dd'] )
					]
				when "y", "amq"
				### THIS CONJUGATION WILL DIFFER DEPENDING ON IF THE KICKER VOWEL IS FA OR KA
					[
						ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
						ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
						ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], 'y', 'n'], ['fa', 'sk', 'ka', nil, nil] ),
						ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
						ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
						ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1], root[2]], ['fa', 'sk', 'ka', nil] ),
						ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], 'w', 'n'], ['fa', 'sk', 'da', nil, nil] ),
						ArabicConjugation.new( 'entun', :present, ['t', root[0], root[1], 'y', 'n'], ['fa', 'sk', 'ka', nil, 'fa'] ),
						ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], 'w', 'n'], ['fa', 'sk', 'da', nil, nil] ),
						ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[1], 'y', 'n'], ['fa', 'sk', 'ka', nil, 'fa'] ),

						ArabicConjugation.new( 'ana', :past, [root[0], root[1], 'y', 't'], ['fa', 'fa', 'sk', 'da'] ),
						ArabicConjugation.new( 'enta', :past, [root[0], root[1], 'y', 't'], ['fa', 'fa', 'sk', 'fa'] ),
						ArabicConjugation.new( 'enti', :past, [root[0], root[1], 'y', 't'], ['fa', 'fa', 'sk', 'ka'] ),
						ArabicConjugation.new( 'hooa', :past, [root[0], root[1], 'amq'], ['fa', 'fa', nil] ),
						ArabicConjugation.new( 'heea', :past, [root[0], root[1], 't'], ['fa', 'fa', 'sk'] ),
						ArabicConjugation.new( 'nahn', :past, [root[0], root[1], 'y', 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
						ArabicConjugation.new( 'entum', :past, [root[0], root[1], 'y', 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'entun', :past, [root[0], root[1], 'y', 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
						ArabicConjugation.new( 'hoom', :past, [root[0], root[1], 'w', 'aa'], ['fa', 'fa', 'sk', nil] ),
						ArabicConjugation.new( 'hoon', :past, [root[0], root[1], 'y', 'n'], ['fa', 'fa', 'sk', 'fa'] ),

						ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', root[1]], [nil, nil, 'in'] ),
						ArabicConjugation.new( nil, :passive_participle, ['m', root[0], root[1], 'y'], ['fa', 'sk', 'ka', 'dd'] )
					]
				end
			when "hollow-defective"
				[
					ArabicConjugation.new( 'ana', :present, ['a', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
					ArabicConjugation.new( 'enta', :present, ['t', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
					ArabicConjugation.new( 'enti', :present, ['t', root[0], root[1], 'y', 'n'], ['fa', 'sk', 'ka', nil, nil] ),
					ArabicConjugation.new( 'hooa', :present, ['y', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
					ArabicConjugation.new( 'heea', :present, ['t', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
					ArabicConjugation.new( 'nahn', :present, ['n', root[0], root[1], 'y'], ['fa', 'sk', 'ka', nil] ),
					ArabicConjugation.new( 'entum', :present, ['t', root[0], root[1], 'w', 'n'], ['fa', 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( 'entun', :present, ['t', root[0], root[1], 'y', 'n'], ['fa', 'sk', 'ka', nil, 'fa'] ),
					ArabicConjugation.new( 'hoom', :present, ['y', root[0], root[1], 'w', 'n'], ['fa', 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( 'hoon', :present, ['y', root[0], root[1], 'y', 'n'], ['fa', 'sk', nil, nil, 'fa'] ),

					ArabicConjugation.new( 'ana', :past, [root[0], root[1], 'y', 't'], ['fa', 'fa', 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :past, [root[0], root[1], 'y', 't'], ['fa', 'fa', 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :past, [root[0], root[1], 'y', 't'], ['fa', 'fa', 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :past, [root[0], root[1], 'amq'], ['fa', 'fa', nil] ),
					ArabicConjugation.new( 'heea', :past, [root[0], root[1], 't'], ['fa', 'fa', 'sk'] ),
					ArabicConjugation.new( 'nahn', :past, [root[0], root[1], 'y', 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :past, [root[0], root[1], 'y', 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :past, [root[0], root[1], 'y', 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :past, [root[0], root[1], 'w', 'aa'], ['fa', 'fa', 'sk', nil] ),
					ArabicConjugation.new( 'hoon', :past, [root[0], root[1], 'y', 'n'], ['fa', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', 'w'], [nil, nil, 'in'] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', root[0], 'w', 'y'], ['fa', 'sk', nil, 'dd'] )
				]
			when "assimilated-defective"
				### Does this mean anything?
				[
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
					ArabicConjugation.new( 'hoon', :past, ['a', root[1], root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, ['amd', root[1], root[2]], [nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', 'a', root[1], 'w', root[2]], ['fa', 'sk', nil, nil, nil] )
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
					ArabicConjugation.new( 'hoon', :past, [root[0], 'a', root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', 'hy', root[2]], [nil, nil, nil, nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', root[0], 'o', 'w', root[2]], ['fa', 'sk', nil, nil, nil] )
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
					ArabicConjugation.new( 'hoon', :past, [root[0], root[1], 'a', 'n'], ['fa', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', root[1], 'hy'], [nil, nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', root[0], root[1], 'w', 'hi'], ['fa', 'sk', nil, nil, nil] )
				]
			when "hollow-hamzated"
				[
					ArabicConjugation.new( 'ana', :present, ['a', root[0], 'y', 'hi'], ['fa', 'ka', nil, nil] ),
					ArabicConjugation.new( 'enta', :present, ['t', root[0], 'y', 'hi'], ['fa', 'ka', nil, nil] ),
					ArabicConjugation.new( 'enti', :present, ['t', root[0], 'y', 'hy', 'y', 'n'], ['fa', 'ka', nil, nil, nil, nil] ),
					ArabicConjugation.new( 'hooa', :present, ['y', root[0], 'y', 'hi'], ['fa', 'ka', nil, nil] ),
					ArabicConjugation.new( 'heea', :present, ['t', root[0], 'y', 'hi'], ['fa', 'ka', nil, nil] ),
					ArabicConjugation.new( 'nahn', :present, ['n', root[0], 'y', 'hi'], ['fa', 'ka', nil, nil] ),
					ArabicConjugation.new( 'entum', :present, ['t', root[0], 'y', 'hy', 'w', 'n'], ['fa', 'ka', nil, nil, nil, nil] ),
					ArabicConjugation.new( 'entun', :present, ['t', root[0], 'hy', 'n'], ['fa', 'ka', 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :present, ['y', root[0], 'y', 'hy', 'w', 'n'], ['fa', 'ka', nil, nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :present, ['y', root[0], 'hy', 'n'], ['fa', 'ka', 'sk', 'fa'] ),

					ArabicConjugation.new( 'ana', :past, [root[0], 'hy', 't'], ['ka', 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :past, [root[0], 'hy', 't'], ['ka', 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :past, [root[0], 'hy', 't'], ['ka', 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :past, [root[0], 'aa', 'hi'], [nil, nil, 'fa'] ),
					ArabicConjugation.new( 'heea', :past, [root[0], 'aa', 'hi', 't'], [nil, nil, 'fa', 'sk'] ),
					ArabicConjugation.new( 'nahn', :past, [root[0], 'hy', 'n', 'aa'], ['ka', 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :past, [root[0], 'hy', 't', 'm'], ['ka', 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :past, [root[0], 'hy', 't', 'n'], ['ka', 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :past, [root[0], 'aa', 'hi', 'w', 'aa'], [nil, nil, nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :past, [root[0], 'hy', 'n'], ['ka', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', 'hi'], [nil, nil, 'in'] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', root[0], 'y', 'hi'], ['fa', 'ka', nil, nil] )
				]
			when "hamzated-defective"
				### CAN THERE BE A HAMZATED AT ROOT 0, + DEFECTIVE?
				case root[1]
				when "hi", "a"
					[
						ArabicConjugation.new( 'ana', :present, ['a', root[0], 'amq'], ['fa', nil, nil] ),
						ArabicConjugation.new( 'enta', :present, ['t', root[0], 'amq'], ['fa', nil, nil] ),
						ArabicConjugation.new( 'enti', :present, ['t', root[0], 'y', 'n'], ['fa', 'fa', 'sk', nil] ),
						ArabicConjugation.new( 'hooa', :present, ['y', root[0], 'amq'], ['fa', nil, nil] ),
						ArabicConjugation.new( 'heea', :present, ['t', root[0], 'amq'], ['fa', nil, nil] ),
						ArabicConjugation.new( 'nahn', :present, ['n', root[0], 'amq'], ['fa', nil, nil] ),
						ArabicConjugation.new( 'entum', :present, ['t', root[0], 'w', 'n'], ['fa', 'fa', 'sk', nil] ),
						ArabicConjugation.new( 'entun', :present, ['t', root[0], 'y', 'n'], ['fa', 'fa', 'sk', 'fa'] ),
						ArabicConjugation.new( 'hoom', :present, ['y', root[0], 'w', 'n'], ['fa', 'fa', 'sk', nil] ),
						ArabicConjugation.new( 'hoon', :present, ['y', root[0], 'y', 'n'], ['fa', 'fa', 'sk', 'fa'] ),

						ArabicConjugation.new( 'ana', :past, [root[0], 'a', 'y', 't'], ['fa', 'fa', 'sk', 'da'] ),
						ArabicConjugation.new( 'enta', :past, [root[0], 'a', 'y', 't'], ['fa', 'fa', 'sk', 'fa'] ),
						ArabicConjugation.new( 'enti', :past, [root[0], 'a', 'y', 't'], ['fa', 'fa', 'sk', 'ka'] ),
						ArabicConjugation.new( 'hooa', :past, [root[0], 'a', 'amq'], ['fa', 'fa', nil] ),
						ArabicConjugation.new( 'heea', :past, [root[0], 'a', 't'], ['fa', 'fa', 'sk'] ),
						ArabicConjugation.new( 'nahn', :past, [root[0], 'a', 'y', 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
						ArabicConjugation.new( 'entum', :past, [root[0], 'a', 'y', 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
						ArabicConjugation.new( 'entun', :past, [root[0], 'a', 'y', 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
						ArabicConjugation.new( 'hoom', :past, [root[0], 'a', 'w', 'aa'], ['fa', 'fa', 'sk', nil] ),
						ArabicConjugation.new( 'hoon', :past, [root[0], 'a', 'y', 'n'], ['fa', 'fa', 'sk', 'fa'] ),

						ArabicConjugation.new( nil, :active_participle, [root[0], 'aa', 'hi'], [nil, nil, 'in'] ),
						ArabicConjugation.new( nil, :passive_participle, ['m', root[0], 'hy', 'y'], ['fa', 'ka', nil, 'dd'] )
					]
				end
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
