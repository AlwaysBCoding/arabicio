class StemConjugator

	def self.conjugations_for_stem_in_measure(stem, measure)
		case measure

		when "I"
			case StemCategorizer.categorize(stem)
			when {root_category: "sound", root_subcategory: nil}

				imperative_prefix, imperative_vowel = "i", "ka" if stem.vocalization["imperfect_kicker"] == "fa"
				imperative_prefix, imperative_vowel = "i", "ka" if stem.vocalization["imperfect_kicker"] == "ka"
				imperative_prefix, imperative_vowel = "a", "da" if stem.vocalization["imperfect_kicker"] == "da"

				return [
					ArabicConjugation.new( 'ana', :imperfect, ['a', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "da"] ),
					ArabicConjugation.new( 'enta', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "da"] ),
					ArabicConjugation.new( 'enti', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'y', 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil, "fa"] ),
					ArabicConjugation.new( 'hooa', :imperfect, ['y', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "da"] ),
					ArabicConjugation.new( 'heea', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "da"] ),
					ArabicConjugation.new( 'nahn', :imperfect, ['n', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "da"] ),
					ArabicConjugation.new( 'entum', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'w', 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil, "fa"] ),
					ArabicConjugation.new( 'entun', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :imperfect, ['y', stem.root[0], stem.root[1], stem.root[2], 'w', 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil, "fa"] ),
					ArabicConjugation.new( 'hoon', :imperfect, ['y', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil, 'ka'] ),
					ArabicConjugation.new( 'hooma-m', :imperfect, ['y', stem.root[0], stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil, 'ka'] ),
					ArabicConjugation.new( 'hooma-f', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil, 'ka'] ),

					ArabicConjugation.new( 'ana', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.vocalization["perfect_kicker"], 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.vocalization["perfect_kicker"], 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.vocalization["perfect_kicker"], 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :perfect, [stem.root[0], stem.root[1], stem.root[2]], ['fa', stem.vocalization["perfect_kicker"], 'fa'] ),
					ArabicConjugation.new( 'heea', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.vocalization["perfect_kicker"], 'fa', 'sk'] ),
					ArabicConjugation.new( 'nahn', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'n', 'aa'], ['fa', stem.vocalization["perfect_kicker"], 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'm'], ['fa', stem.vocalization["perfect_kicker"], 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'n'], ['fa', stem.vocalization["perfect_kicker"], 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', stem.vocalization["perfect_kicker"], nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', stem.vocalization["perfect_kicker"], 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'm', 'aa'], ['fa', stem.vocalization["perfect_kicker"], 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( 'hooma-m', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', stem.vocalization["perfect_kicker"], nil, nil] ),
					ArabicConjugation.new( 'hooma-f', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'aa'], ['fa', stem.vocalization["prefect_kicker"], 'fa', nil, nil] ),

					ArabicConjugation.new( 'ana', :jussive, ['a', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "sk"] ),
					ArabicConjugation.new( 'enta', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "sk"] ),
					ArabicConjugation.new( 'enti', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'y'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil] ),
					ArabicConjugation.new( 'hooa', :jussive, ['y', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "sk"] ),
					ArabicConjugation.new( 'heea', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "sk"] ),
					ArabicConjugation.new( 'nahn', :jussive, ['n', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.vocalization["imperfect_kicker"], "sk"] ),
					ArabicConjugation.new( 'entum', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil, nil] ),
					ArabicConjugation.new( 'entun', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :jussive, ['y', stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :jussive, ['y', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil] ),
					ArabicConjugation.new( 'hooma-m', :jussive, ['y', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil] ),
					ArabicConjugation.new( 'hooma-f', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.vocalization["imperfect_kicker"], nil, nil] ),

					ArabicConjugation.new( 'enta', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2]], [imperative_vowel, "sk", stem.vocalization["imperfect_kicker"], "sk"])
					ArabicConjugation.new( 'enti', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2], 'y'], [imperative_vowel, "sk", stem.vocalization["imperfect_kicker"], nil, nil] )
					ArabicConjugation.new( 'entum', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], [imperative_vowel, "sk", stem.vocalization["imperfect_kicker"], nil, nil, nil] )
					ArabicConjugation.new( 'entun', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2], 'n'], [imperative_vowel, 'sk', stem.vocalization["imperfect_kicker"], 'sk', 'fa'] )
					ArabicConjugation.new( 'entuma', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2], "aa"], [imperative_vowel, "sk", stem.vocalization["imperfect_kicker"], nil, nil] )

					# ArabicConjugation.new( 'ana', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', 'fa', 'sk', 'da'] ),
					# ArabicConjugation.new( 'enta', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', 'fa', 'sk', 'fa'] ),
					# ArabicConjugation.new( 'enti', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', 'fa', 'sk', 'ka'] ),
					# ArabicConjugation.new( 'hooa', :subjunctive, [stem.root[0], stem.root[1], stem.root[2]], ['fa', 'fa', 'fa'] ),
					# ArabicConjugation.new( 'heea', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', 'fa', 'fa', 'sk'] ),
					# ArabicConjugation.new( 'nahn', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 'n', 'aa'], ['fa', 'fa', 'sk', nil, nil] ),
					# ArabicConjugation.new( 'entum', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 't', 'm'], ['fa', 'fa', 'sk', 'da', nil] ),
					# ArabicConjugation.new( 'entun', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 't', 'n'], ['fa', 'fa', 'sk', 'da', 'dd'] ),
					# ArabicConjugation.new( 'hoom', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'fa', nil, nil, nil] ),
					# ArabicConjugation.new( 'hoon', :subjunctive, [stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'fa', 'sk', 'fa'] ),

					ArabicConjugation.new( nil, :active_participle, [stem.root[0], 'aa', stem.root[1], stem.root[2]], [nil, nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', stem.root[0], stem.root[1], 'w', stem.root[2]], ['fa', 'sk', nil, nil, nil] )
				]
			end
		end

	end

private

end
