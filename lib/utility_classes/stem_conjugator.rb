class StemConjugator

	def self.conjugations_for_stem_in_measure(stem, measure)
		case measure

		when "I" # SHADDA FATHA NEEDED ON PERFECT ENTUN FOR SOUND/ASSIMILATED/HAMZATED
			case StemCategorizer.categorize(stem)
			when {root_category: "sound", root_subcategory: nil}, {root_category: "assimilated", root_subcategory: "assimilated-y"}, {root_category: "assimilated", root_subcategory: "assimilated-concatenation"}

				imperative_prefix, imperative_vowel = "aa", "fa"
				imperative_prefix, imperative_vowel = "aa", "ka" if stem.imperfect_kicker == "fa"
				imperative_prefix, imperative_vowel = "aa", "ka" if stem.imperfect_kicker == "ka"
				imperative_prefix, imperative_vowel = "aa", "da" if stem.imperfect_kicker == "da"

				return [
					ArabicConjugation.new( 'ana', :imperfect, ['a', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "da"] ),
					ArabicConjugation.new( 'enta', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "da"] ),
					ArabicConjugation.new( 'enti', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'y', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, "fa"] ),
					ArabicConjugation.new( 'hooa', :imperfect, ['y', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "da"] ),
					ArabicConjugation.new( 'heea', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "da"] ),
					ArabicConjugation.new( 'nahn', :imperfect, ['n', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "da"] ),
					ArabicConjugation.new( 'entum', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'w', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, "fa"] ),
					ArabicConjugation.new( 'entun', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :imperfect, ['y', stem.root[0], stem.root[1], stem.root[2], 'w', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, "fa"] ),
					ArabicConjugation.new( 'hoon', :imperfect, ['y', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'ka'] ),
					ArabicConjugation.new( 'hooma-m', :imperfect, ['y', stem.root[0], stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'ka'] ),
					ArabicConjugation.new( 'hooma-f', :imperfect, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'ka'] ),

					ArabicConjugation.new( 'ana', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :perfect, [stem.root[0], stem.root[1], stem.root[2]], ['fa', stem.perfect_kicker, 'fa'] ),
					ArabicConjugation.new( 'heea', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'fa', 'sk'] ),
					ArabicConjugation.new( 'nahn', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'n', 'aa'], ['fa', stem.perfect_kicker, 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'm'], ['fa', stem.perfect_kicker, 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'n'], ['fa', stem.perfect_kicker, 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', stem.perfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'm', 'aa'], ['fa', stem.perfect_kicker, 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( 'hooma-m', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', stem.perfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'hooma-f', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'aa'], ['fa', stem.perfect_kicker, 'fa', nil, nil] ),

					ArabicConjugation.new( 'ana', :jussive, ['a', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( 'enta', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( 'enti', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'y'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'hooa', :jussive, ['y', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( 'heea', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( 'nahn', :jussive, ['n', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( 'entum', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( 'entun', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :jussive, ['y', stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :jussive, ['y', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'hooma-m', :jussive, ['y', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'hooma-f', :jussive, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( 'enta', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2]], [imperative_vowel, "sk", stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( 'enti', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2], 'y'], [imperative_vowel, "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'entum', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], [imperative_vowel, "sk", stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( 'entun', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2], 'n'], [imperative_vowel, 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :imperative, [imperative_prefix, stem.root[0], stem.root[1], stem.root[2], "aa"], [imperative_vowel, "sk", stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( 'ana', :subjunctive, ['a', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( 'enta', :subjunctive, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( 'enti', :subjunctive, ['t', stem.root[0], stem.root[1], stem.root[2], 'y'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'hooa', :subjunctive, ['y', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( 'heea', :subjunctive, ['t', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( 'nahn', :subjunctive, ['n', stem.root[0], stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( 'entum', :subjunctive, ['t', stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( 'entun', :subjunctive, ['t', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'hoom', :subjunctive, ['y', stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :subjunctive, ['y', stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :subjunctive, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'hooma-m', :subjunctive, ['y', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'hooma-f', :subjunctive, ['t', stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( nil, :active_participle, [stem.root[0], 'aa', stem.root[1], stem.root[2]], [nil, nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', stem.root[0], stem.root[1], 'w', stem.root[2]], ['fa', 'sk', nil, nil, nil] )
				]
			when {root_category: "assimilated", root_subcategory: "assimilated-deletion"}
				return [
					# PERFECT conjugations is exactly the same as sound
					ArabicConjugation.new( "ana", :imperfect, ['a', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "enta", :imperfect, ['t', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "enti", :imperfect, ['t', stem.root[1], stem.root[2], 'y', 'n'], ["fa", stem.imperfect_kicker, nil, nil, "fa"] ),
					ArabicConjugation.new( "hooa", :imperfect, ['y', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "heea", :imperfect, ['t', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "nahn", :imperfect, ['n', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "entum", :imperfect, ['t', stem.root[1], stem.root[2], 'w', 'n'], ['fa', stem.imperfect_kicker, nil, nil, 'fa'] ),
					ArabicConjugation.new( "entun", :imperfect, ['t', stem.root[1], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :imperfect, ['y', stem.root[1], stem.root[2], 'w', 'n'], ['fa', stem.imperfect_kicker, nil, nil, 'fa'] ),
					ArabicConjugation.new( "hoon", :imperfect, ['y', stem.root[1], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :imperfect, ['t', stem.root[1], stem.root[2], 'aa', 'n'], ['fa', stem.imperfect_kicker, nil, nil, 'ka'] ),
					ArabicConjugation.new( "hooma-m", :imperfect, ['y', stem.root[1], stem.root[2], 'aa', 'n'], ['fa', stem.imperfect_kicker, nil, nil, 'ka'] ),
					ArabicConjugation.new( "hooma-f", :imperfect, ['t', stem.root[1], stem.root[2], 'aa', 'n'], ['fa', stem.imperfect_kicker, nil, nil, 'ka'] ),

					ArabicConjugation.new( 'ana', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'da'] ),
					ArabicConjugation.new( 'enta', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'enti', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'ka'] ),
					ArabicConjugation.new( 'hooa', :perfect, [stem.root[0], stem.root[1], stem.root[2]], ['fa', stem.perfect_kicker, 'fa'] ),
					ArabicConjugation.new( 'heea', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'fa', 'sk'] ),
					ArabicConjugation.new( 'nahn', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'n', 'aa'], ['fa', stem.perfect_kicker, 'sk', nil, nil] ),
					ArabicConjugation.new( 'entum', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'm'], ['fa', stem.perfect_kicker, 'sk', 'da', nil] ),
					ArabicConjugation.new( 'entun', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'n'], ['fa', stem.perfect_kicker, 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( 'hoom', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'w', 'aa'], ['fa', stem.perfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( 'hoon', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'n'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( 'entuma', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'm', 'aa'], ['fa', stem.perfect_kicker, 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( 'hooma-m', :perfect, [stem.root[0], stem.root[1], stem.root[2], 'aa'], ['fa', stem.perfect_kicker, nil, nil] ),
					ArabicConjugation.new( 'hooma-f', :perfect, [stem.root[0], stem.root[1], stem.root[2], 't', 'aa'], ['fa', stem.perfect_kicker, 'fa', nil, nil] ),

					ArabicConjugation.new( "ana", :jussive, ['a', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enta", :jussive, ['t', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enti", :jussive, ['t', stem.root[1], stem.root[2], 'y'], ["fa", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooa", :jussive, ['y', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "heea", :jussive, ['t', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "nahn", :jussive, ['n', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "entum", :jussive, ['t', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :jussive, ['t', stem.root[1], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :jussive, ['y', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :jussive, ['y', stem.root[1], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :jussive, ['t', stem.root[1], stem.root[2], 'aa'], ['fa', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-m", :jussive, ['y', stem.root[1], stem.root[2], 'aa'], ['fa', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :jussive, ['t', stem.root[1], stem.root[2], 'aa'], ['fa', stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( "enta", :imperative, [stem.root[1], stem.root[2]], [stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enti", :imperative, [stem.root[1], stem.root[2], 'y'], [stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entuma", :imperative, [stem.root[1], stem.root[2], 'aa'], [stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entum", :imperative, [stem.root[1], stem.root[2], 'w', 'aa'], [stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :imperative, [stem.root[1], stem.root[2], 'n'], [stem.imperfect_kicker, 'sk', 'fa'] ),

					ArabicConjugation.new( "ana", :subjunctive, ['a', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "enta", :subjunctive, ['t', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "enti", :subjunctive, ['t', stem.root[1], stem.root[2], 'y'], ["fa", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooa", :subjunctive, ['y', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "heea", :subjunctive, ['t', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "nahn", :subjunctive, ['n', stem.root[1], stem.root[2]], ['fa', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "entum", :subjunctive, ['t', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :subjunctive, ['t', stem.root[1], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :subjunctive, ['y', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :subjunctive, ['y', stem.root[1], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :subjunctive, ['t', stem.root[1], stem.root[2], 'aa'], ['fa', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-m", :subjunctive, ['y', stem.root[1], stem.root[2], 'aa'], ['fa', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :subjunctive, ['t', stem.root[1], stem.root[2], 'aa'], ['fa', stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( nil, :active_participle, [stem.root[0], 'aa', stem.root[1], stem.root[2]], [nil, nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', stem.root[0], stem.root[1], 'w', stem.root[2]], ['fa', 'sk', nil, nil, nil] )
				]
			when {root_category: "hamzated", root_subcategory: "hamzated-initial"}
				return [
					ArabicConjugation.new( "ana", :imperfect, ["amd", stem.root[1], stem.root[2]], [nil, stem.imperfect_kicker, "da"] ),
					ArabicConjugation.new( "enta", :imperfect, ["t", "a", stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "enti", :imperfect, ["t", "a", stem.root[1], stem.root[2], 'y', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, 'fa'] ),
					ArabicConjugation.new( "hooa", :imperfect, ['y', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "heea", :imperfect, ['t', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "nahn", :imperfect, ['n', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "entum", :imperfect, ['t', 'a', stem.root[1], stem.root[2], 'w', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'fa'] ),
					ArabicConjugation.new( "entun", :imperfect, ['t', 'a', stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :imperfect, ['y', 'a', stem.root[1], stem.root[2], 'w', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'fa'] ),
					ArabicConjugation.new( "hoon", :imperfect, ['y', 'a', stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :imperfect, ['t', 'a', stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'ka'] ),
					ArabicConjugation.new( "hooma-m", :imperfect, ['y', 'a', stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'ka'] ),
					ArabicConjugation.new( "hooma-f", :imperfect, ['t', 'a', stem.root[1], stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'ka'] ),

					ArabicConjugation.new( "ana", :perfect, ['a', stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'da'] ),
					ArabicConjugation.new( "enta", :perfect, ['a', stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "enti", :perfect, ['a', stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'ka'] ),
					ArabicConjugation.new( "hooa", :perfect, ['a', stem.root[1], stem.root[2]], ['fa', stem.perfect_kicker, 'fa'] ),
					ArabicConjugation.new( "heea", :perfect, ['a', stem.root[1], stem.root[2], 't'], ['fa', stem.perfect_kicker, 'fa', 'sk'] ),
					ArabicConjugation.new( "nahn", :perfect, ['a', stem.root[1], stem.root[2], 'n', 'aa'], ['fa', stem.perfect_kicker, 'sk', nil, nil] ),
					ArabicConjugation.new( "entum", :perfect, ['a', stem.root[1], stem.root[2], 't', 'm'], ['fa', stem.perfect_kicker, 'sk', 'da', nil] ),
					ArabicConjugation.new( "entun", :perfect, ['a', stem.root[1], stem.root[2], 't', 'n'], ['fa', stem.perfect_kicker, 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( "hoom", :perfect, ['a', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', stem.perfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :perfect, ['a', stem.root[1], stem.root[2], 'n'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :perfect, ['a', stem.root[1], stem.root[2], 't', 'm', 'aa'], ['fa', stem.perfect_kicker, 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( "hooma-m", :perfect, ['a', stem.root[1], stem.root[2], 'aa'], ['fa', stem.perfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :perfect, ['a', stem.root[1], stem.root[2], 't', 'aa'], ['fa', stem.perfect_kicker, 'fa', nil, nil] ),

					ArabicConjugation.new( "ana", :jussive, ["amd", stem.root[1], stem.root[2]], [nil, stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( "enta", :jussive, ["t", "a", stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enti", :jussive, ["t", "a", stem.root[1], stem.root[2], 'y'], ['fa', 'sk', stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "hooa", :jussive, ['y', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "heea", :jussive, ['t', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "nahn", :jussive, ['n', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "entum", :jussive, ['t', 'a', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :jussive, ['t', 'a', stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :jussive, ['y', 'a', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :jussive, ['y', 'a', stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :jussive, ['t', 'a', stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-m", :jussive, ['y', 'a', stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :jussive, ['t', 'a', stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( "enta", :imperative, [stem.root[1], stem.root[2]], [stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enti", :imperative, [stem.root[1], stem.root[2], 'y'], [stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entuma", :imperative, [stem.root[1], stem.root[2], 'aa'], [stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entum", :imperative, [stem.root[1], stem.root[2], 'w', 'aa'], [stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :imperative, [stem.root[1], stem.root[2], 'n'], [stem.imperfect_kicker, 'sk', 'fa'] ),

					ArabicConjugation.new( "ana", :subjunctive, ["amd", stem.root[1], stem.root[2]], [nil, stem.imperfect_kicker, "fa"] ),
					ArabicConjugation.new( "enta", :subjunctive, ["t", "a", stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "enti", :subjunctive, ["t", "a", stem.root[1], stem.root[2], 'y'], ['fa', 'sk', stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "hooa", :subjunctive, ['y', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "heea", :subjunctive, ['t', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "nahn", :subjunctive, ['n', 'a', stem.root[1], stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "entum", :subjunctive, ['t', 'a', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :subjunctive, ['t', 'a', stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :subjunctive, ['y', 'a', stem.root[1], stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :subjunctive, ['y', 'a', stem.root[1], stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :subjunctive, ['t', 'a', stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-m", :subjunctive, ['y', 'a', stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :subjunctive, ['t', 'a', stem.root[1], stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( nil, :active_participle, ["amd", stem.root[1], stem.root[2]], [nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ["m", "a", stem.root[1], 'w', stem.root[2]], ['fa', 'sk', nil, nil, nil] )
				]
			when {root_category: "hamzated", root_subcategory: "hamzated-medial"}

				imperative_prefix, imperative_vowel = "aa", "fa"
				imperative_prefix, imperative_vowel = "aa", "ka" if stem.imperfect_kicker == "fa"
				imperative_prefix, imperative_vowel = "aa", "ka" if stem.imperfect_kicker == "ka"
				imperative_prefix, imperative_vowel = "aa", "da" if stem.imperfect_kicker == "da"

				return [
					ArabicConjugation.new( "ana", :imperfect, ['a', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da']),
					ArabicConjugation.new( "enta", :imperfect, ['t', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da']),
					ArabicConjugation.new( "enti", :imperfect, ['t', stem.root[0], 'a', stem.root[2], 'y', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'fa']),
					ArabicConjugation.new( "hooa", :imperfect, ['y', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da']),
					ArabicConjugation.new( "heea", :imperfect, ['t', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da']),
					ArabicConjugation.new( "nahn", :imperfect, ['n', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'da']),
					ArabicConjugation.new( "entum", :imperfect, ['t', stem.root[0], 'a', stem.root[2], 'w', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'fa']),
					ArabicConjugation.new( "entun", :imperfect, ['t', stem.root[0], 'a', stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa']),
					ArabicConjugation.new( "hoom", :imperfect, ['y', stem.root[0], 'a', stem.root[2], 'w', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'fa']),
					ArabicConjugation.new( "hoon", :imperfect, ['y', stem.root[0], 'a', stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa']),
					ArabicConjugation.new( "entuma", :imperfect, ['t', stem.root[0], 'a', stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'fa']),
					ArabicConjugation.new( "hooma-m", :imperfect, ['y', stem.root[0], 'a', stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'ka']),
					ArabicConjugation.new( "hooma-f", :imperfect, ['t', stem.root[0], 'a', stem.root[2], 'aa', 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, 'fa']),

					ArabicConjugation.new( "ana", :jussive, ['a', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk']),
					ArabicConjugation.new( "enta", :jussive, ['t', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk']),
					ArabicConjugation.new( "enti", :jussive, ['t', stem.root[0], 'a', stem.root[2], 'y'], ['fa', 'sk', stem.imperfect_kicker, nil, nil]),
					ArabicConjugation.new( "hooa", :jussive, ['y', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk']),
					ArabicConjugation.new( "heea", :jussive, ['t', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk']),
					ArabicConjugation.new( "nahn", :jussive, ['n', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'sk']),
					ArabicConjugation.new( "entum", :jussive, ['t', stem.root[0], 'a', stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil]),
					ArabicConjugation.new( "entun", :jussive, ['t', stem.root[0], 'a', stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa']),
					ArabicConjugation.new( "hoom", :jussive, ['y', stem.root[0], 'a', stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil]),
					ArabicConjugation.new( "hoon", :jussive, ['y', stem.root[0], 'a', stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa']),
					ArabicConjugation.new( "entuma", :jussive, ['t', stem.root[0], 'a', stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil]),
					ArabicConjugation.new( "hooma-m", :jussive, ['y', stem.root[0], 'a', stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil]),
					ArabicConjugation.new( "hooma-f", :jussive, ['t', stem.root[0], 'a', stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil]),

					ArabicConjugation.new( "ana", :subjunctive, ['a', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa']),
					ArabicConjugation.new( "enta", :subjunctive, ['t', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa']),
					ArabicConjugation.new( "enti", :subjunctive, ['t', stem.root[0], 'a', stem.root[2], 'y'], ['fa', 'sk', stem.imperfect_kicker, nil, nil]),
					ArabicConjugation.new( "hooa", :subjunctive, ['y', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa']),
					ArabicConjugation.new( "heea", :subjunctive, ['t', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa']),
					ArabicConjugation.new( "nahn", :subjunctive, ['n', stem.root[0], 'a', stem.root[2]], ['fa', 'sk', stem.imperfect_kicker, 'fa']),
					ArabicConjugation.new( "entum", :subjunctive, ['t', stem.root[0], 'a', stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil]),
					ArabicConjugation.new( "entun", :subjunctive, ['t', stem.root[0], 'a', stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa']),
					ArabicConjugation.new( "hoom", :subjunctive, ['y', stem.root[0], 'a', stem.root[2], 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil, nil]),
					ArabicConjugation.new( "hoon", :subjunctive, ['y', stem.root[0], 'a', stem.root[2], 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa']),
					ArabicConjugation.new( "entuma", :subjunctive, ['t', stem.root[0], 'a', stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil]),
					ArabicConjugation.new( "hooma-m", :subjunctive, ['y', stem.root[0], 'a', stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil]),
					ArabicConjugation.new( "hooma-f", :subjunctive, ['t', stem.root[0], 'a', stem.root[2], 'aa'], ['fa', 'sk', stem.imperfect_kicker, nil, nil]),

					ArabicConjugation.new( "enta", :imperative, [imperative_prefix, stem.root[0], 'a', stem.root[2]], [imperative_vowel, 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enti", :imperative, [imperative_prefix, stem.root[0], 'a', stem.root[2], 'y'], [imperative_vowel, 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entuma", :imperative, [imperative_prefix, stem.root[0], 'a', stem.root[2], 'aa'], [imperative_vowel, 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entum", :imperative, [imperative_prefix, stem.root[0], 'a', stem.root[2], 'w', 'aa'], [imperative_vowel, 'sk', stem.imperfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :imperative, [imperative_prefix, stem.root[0], 'a', stem.root[2], 'n'], [imperative_vowel, 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),

					ArabicConjugation.new( "ana", :perfect, [stem.root[0], 'a', stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'da'] ),
					ArabicConjugation.new( "enta", :perfect, [stem.root[0], 'a', stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "enti", :perfect, [stem.root[0], 'a', stem.root[2], 't'], ['fa', stem.perfect_kicker, 'sk', 'ka'] ),
					ArabicConjugation.new( "hooa", :perfect, [stem.root[0], 'a', stem.root[2]], ['fa', stem.perfect_kicker, 'fa'] ),
					ArabicConjugation.new( "heea", :perfect, [stem.root[0], 'a', stem.root[2], 't'], ['fa', stem.perfect_kicker, 'fa', 'sk'] ),
					ArabicConjugation.new( "nahn", :perfect, [stem.root[0], 'a', stem.root[2], 'n', 'aa'], ['fa', stem.perfect_kicker, 'sk', nil, nil] ),
					ArabicConjugation.new( "entum", :perfect, [stem.root[0], 'a', stem.root[2], 't', 'm'], ['fa', stem.perfect_kicker, 'sk', 'da', nil] ),
					ArabicConjugation.new( "entun", :perfect, [stem.root[0], 'a', stem.root[2], 't', 'm'], ['fa', stem.perfect_kicker, 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( "hoom", :perfect, [stem.root[0], 'a', stem.root[2], 'w', 'aa'], ['fa', stem.perfect_kicker, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :perfect, [stem.root[0], 'a', stem.root[2], 'n'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :perfect, [stem.root[0], 'a', stem.root[2], 't', 'm', 'aa'], ['fa', stem.perfect_kicker, 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( "hooma-m", :perfect, [stem.root[0], 'a', stem.root[2], 'aa'], ['fa', stem.perfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :perfect, [stem.root[0], 'a', stem.root[2], 't', 'aa'], ['fa', stem.perfect_kicker, 'fa', nil, nil] ),

					ArabicConjugation.new( nil, :active_participle, [stem.root[0], 'aa', 'hy', stem.root[2]], [nil, nil, nil, nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', stem.root[0], 'hw', 'w', stem.root[2]], ['fa', 'sk', nil, nil, nil] )
				]
			when {root_category: "hamzated", root_subcategory: "hamzated-final"}

				imperative_prefix, imperative_vowel = "aa", "fa"
				imperative_prefix, imperative_vowel = "aa", "ka" if stem.imperfect_kicker == "fa"
				imperative_prefix, imperative_vowel = "aa", "ka" if stem.imperfect_kicker == "ka"
				imperative_prefix, imperative_vowel = "aa", "da" if stem.imperfect_kicker == "da"

				return [
					ArabicConjugation.new( "ana", :imperfect, ["a", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "enta", :imperfect, ["t", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "enti", :imperfect, ["t", stem.root[0], stem.root[1], "hy", 'y', 'n'], ['fa', 'sk', stem.imperfect_kicker, 'ka', nil, 'fa'] ),
					ArabicConjugation.new( "hooa", :imperfect, ["y", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "heea", :imperfect, ["t", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "nahn", :imperfect, ["n", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'da'] ),
					ArabicConjugation.new( "entum", :imperfect, ["t", stem.root[0], stem.root[1], "hw", 'w', 'n'], ['fa', 'sk', stem.imperfect_kicker, 'da', nil, 'fa'] ),
					ArabicConjugation.new( "entun", :imperfect, ["t", stem.root[0], stem.root[1], "a", 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :imperfect, ["y", stem.root[0], stem.root[1], "hw", 'w', 'n'], ['fa', 'sk', stem.imperfect_kicker, 'da', nil, 'fa'] ),
					ArabicConjugation.new( "hoon", :imperfect, ["y", stem.root[0], stem.root[1], "a", 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :imperfect, ["t", stem.root[0], stem.root[1], "amd", 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, 'ka'] ),
					ArabicConjugation.new( "hooma-m", :imperfect, ["y", stem.root[0], stem.root[1], "amd", 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, 'ka'] ),
					ArabicConjugation.new( "hooma-m", :imperfect, ["t", stem.root[0], stem.root[1], "amd", 'n'], ['fa', 'sk', stem.imperfect_kicker, nil, 'ka'] ),

					ArabicConjugation.new( "ana", :jussive, ["a", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enta", :jussive, ["t", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enti", :jussive, ["t", stem.root[0], stem.root[1], "hy", 'y'], ['fa', 'sk', stem.imperfect_kicker, 'ka', nil] ),
					ArabicConjugation.new( "hooa", :jussive, ["y", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "heea", :jussive, ["t", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "nahn", :jussive, ["n", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "entum", :jussive, ["t", stem.root[0], stem.root[1], "hw", 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, 'da', nil, nil] ),
					ArabicConjugation.new( "entun", :jussive, ["t", stem.root[0], stem.root[1], "a", 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :jussive, ["y", stem.root[0], stem.root[1], "hw", 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, 'da', nil, nil] ),
					ArabicConjugation.new( "hoon", :jussive, ["y", stem.root[0], stem.root[1], "a", 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :jussive, ["t", stem.root[0], stem.root[1], "amd"], ['fa', 'sk', stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "hooma-m", :jussive, ["y", stem.root[0], stem.root[1], "amd"], ['fa', 'sk', stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "hooma-m", :jussive, ["t", stem.root[0], stem.root[1], "amd"], ['fa', 'sk', stem.imperfect_kicker, nil] ),

					ArabicConjugation.new( "ana", :subjunctive, ["a", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "enta", :subjunctive, ["t", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "enti", :subjunctive, ["t", stem.root[0], stem.root[1], "hy", 'y'], ['fa', 'sk', stem.imperfect_kicker, 'ka', nil] ),
					ArabicConjugation.new( "hooa", :subjunctive, ["y", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "heea", :subjunctive, ["t", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "nahn", :subjunctive, ["n", stem.root[0], stem.root[1], "a"], ['fa', 'sk', stem.imperfect_kicker, 'fa'] ),
					ArabicConjugation.new( "entum", :subjunctive, ["t", stem.root[0], stem.root[1], "hw", 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, 'da', nil, nil] ),
					ArabicConjugation.new( "entun", :subjunctive, ["t", stem.root[0], stem.root[1], "a", 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :subjunctive, ["y", stem.root[0], stem.root[1], "hw", 'w', 'aa'], ['fa', 'sk', stem.imperfect_kicker, 'da', nil, nil] ),
					ArabicConjugation.new( "hoon", :subjunctive, ["y", stem.root[0], stem.root[1], "a", 'n'], ['fa', 'sk', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :subjunctive, ["t", stem.root[0], stem.root[1], "amd"], ['fa', 'sk', stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "hooma-m", :subjunctive, ["y", stem.root[0], stem.root[1], "amd"], ['fa', 'sk', stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "hooma-m", :subjunctive, ["t", stem.root[0], stem.root[1], "amd"], ['fa', 'sk', stem.imperfect_kicker, nil] ),

					ArabicConjugation.new( "enta", :imperative, [imperative_prefix, stem.root[0], stem.root[1], "a"], [imperative_vowel, 'sk', stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( "enti", :imperative, [imperative_prefix, stem.root[0], stem.root[1], "hy", 'y'], [imperative_vowel, 'sk', stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entuma", :imperative, [imperative_prefix, stem.root[0], stem.root[1], "amd"], [imperative_vowel, 'sk', stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "entum", :imperative, [imperative_prefix, stem.root[0], stem.root[1], "hw", "w", "n"], [imperative_vowel, 'sk', stem.imperfect_kicker, "da", nil, nil] ),
					ArabicConjugation.new( "entun", :imperative, [imperative_prefix, stem.root[0], stem.root[1], "a", "n"], [imperative_vowel, 'sk', stem.imperfect_kicker, "sk", "fa"] ),

					ArabicConjugation.new( "ana", :perfect, [stem.root[0], stem.root[1], 'a', 't'], ['fa', stem.perfect_kicker, 'sk', 'da'] ),
					ArabicConjugation.new( "enta", :perfect, [stem.root[0], stem.root[1], 'a', 't'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "enti", :perfect, [stem.root[0], stem.root[1], 'a', 't'], ['fa', stem.perfect_kicker, 'sk', 'ka'] ),
					ArabicConjugation.new( "hooa", :perfect, [stem.root[0], stem.root[1], 'a'], ['fa', stem.perfect_kicker, 'fa'] ),
					ArabicConjugation.new( "enti", :perfect, [stem.root[0], stem.root[1], 'a', 't'], ['fa', stem.perfect_kicker, 'fa', 'sk'] ),
					ArabicConjugation.new( "nahn", :perfect, [stem.root[0], stem.root[1], 'a', 'n', 'aa'], ['fa', stem.perfect_kicker, 'sk', nil, nil] ),
					ArabicConjugation.new( "entum", :perfect, [stem.root[0], stem.root[1], 'a', 't', 'm'], ['fa', stem.perfect_kicker, 'sk', 'da', nil] ),
					ArabicConjugation.new( "entun", :perfect, [stem.root[0], stem.root[1], 'a', 't', 'n'], ['fa', stem.perfect_kicker, 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( "hoom", :perfect, [stem.root[0], stem.root[1], 'hw', 'w', 'aa'], ['fa', stem.perfect_kicker, 'da', nil, nil] ),
					ArabicConjugation.new( "hoon", :perfect, [stem.root[0], stem.root[1], 'a', 'n'], ['fa', stem.perfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :perfect, [stem.root[0], stem.root[1], 'a', 't', 'm', 'aa'], ['fa', stem.perfect_kicker, 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( "hooma-m", :perfect, [stem.root[0], stem.root[1], 'amd'], ['fa', stem.perfect_kicker, nil] ),
					ArabicConjugation.new( "hooma-f", :perfect, [stem.root[0], stem.root[1], 'a', 't', 'aa'], ['fa', stem.perfect_kicker, 'fa', nil, nil] ),

					ArabicConjugation.new( nil, :active_participle, [stem.root[0], 'aa', stem.root[1], 'hy'], [nil, nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', stem.root[0], stem.root[1], 'w', 'hmz'], ['fa', 'sk', nil, nil, nil] )
				]
			when {root_category: "hollow", root_subcategory: "hollow-w"}, {root_category: "hollow", root_subcategory: "hollow-y"}, {root_category: "hollow", root_subcategory: "hollow-aa"}

				hollow_vowel, perfect_kicker_vowel = "fa", "fa"
				if stem.imperfect_kicker == "fa" then hollow_vowel = "aa" end
				if stem.imperfect_kicker == "da" then hollow_vowel = "w" end
				if stem.imperfect_kicker == "ka" then hollow_vowel = "y" end
				if stem.perfect_kicker == "fa" then perfect_kicker_vowel = "ka" end
				if stem.perfect_kicker == "da" then perfect_kicker_vowel = "da" end
				if stem.perfect_kicker == "ka" then perfect_kicker_vowel = "ka" end

				return [
					ArabicConjugation.new( "ana", :imperfect, ['a', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'da'] ),
					ArabicConjugation.new( "enta", :imperfect, ['t', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'da'] ),
					ArabicConjugation.new( "enti", :imperfect, ['t', stem.root[0], hollow_vowel, stem.root[2], 'y', 'n'], ['fa', nil, nil, nil, nil, 'fa'] ),
					ArabicConjugation.new( "hooa", :imperfect, ['y', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'da'] ),
					ArabicConjugation.new( "heea", :imperfect, ['t', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'da'] ),
					ArabicConjugation.new( "nahn", :imperfect, ['n', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'da'] ),
					ArabicConjugation.new( "entum", :imperfect, ['t', stem.root[0], hollow_vowel, stem.root[2], 'w', 'n'], ['fa', nil, nil, nil, nil, 'fa'] ),
					ArabicConjugation.new( "entun", :imperfect, ['t', stem.root[0], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :imperfect, ['y', stem.root[0], hollow_vowel, stem.root[2], 'w', 'n'], ['fa', nil, nil, nil, nil, 'fa'] ),
					ArabicConjugation.new( "hoon", :imperfect, ['y', stem.root[0], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :imperfect, ['t', stem.root[0], hollow_vowel, stem.root[2], 'aa', 'n'], ['fa', nil, nil, nil, nil, 'ka'] ),
					ArabicConjugation.new( "hooma-m", :imperfect, ['y', stem.root[0], hollow_vowel, stem.root[2], 'aa', 'n'], ['fa', nil, nil, nil, nil, 'ka'] ),
					ArabicConjugation.new( "hooma-f", :imperfect, ['t', stem.root[0], hollow_vowel, stem.root[2], 'aa', 'n'], ['fa', nil, nil, nil, nil, 'ka'] ),

					ArabicConjugation.new( "ana", :jussive, ['a', stem.root[0], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enta", :jussive, ['t', stem.root[0], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "enti", :jussive, ['t', stem.root[0], hollow_vowel, stem.root[2], 'y'], ['fa', nil, nil, nil, nil] ),
					ArabicConjugation.new( "hooa", :jussive, ['y', stem.root[0], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "heea", :jussive, ['t', stem.root[0], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "nahn", :jussive, ['n', stem.root[0], stem.root[2]], ['fa', stem.imperfect_kicker, 'sk'] ),
					ArabicConjugation.new( "entum", :jussive, ['t', stem.root[0], hollow_vowel, stem.root[2], 'w', 'aa'], ['fa', nil, nil, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :jussive, ['t', stem.root[0], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :jussive, ['y', stem.root[0], hollow_vowel, stem.root[2], 'w', 'aa'], ['fa', nil, nil, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :jussive, ['y', stem.root[0], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :jussive, ['t', stem.root[0], hollow_vowel, stem.root[2], 'aa'], ['fa', nil, nil, nil, nil] ),
					ArabicConjugation.new( "hooma-m", :jussive, ['y', stem.root[0], hollow_vowel, stem.root[2], 'aa'], ['fa', nil, nil, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :jussive, ['t', stem.root[0], hollow_vowel, stem.root[2], 'aa'], ['fa', nil, nil, nil, nil] ),

					ArabicConjugation.new( "ana", :subjunctive, ['a', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'fa'] ),
					ArabicConjugation.new( "enta", :subjunctive, ['t', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'fa'] ),
					ArabicConjugation.new( "enti", :subjunctive, ['t', stem.root[0], hollow_vowel, stem.root[2], 'y'], ['fa', nil, nil, nil, nil] ),
					ArabicConjugation.new( "hooa", :subjunctive, ['y', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'fa'] ),
					ArabicConjugation.new( "heea", :subjunctive, ['t', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'fa'] ),
					ArabicConjugation.new( "nahn", :subjunctive, ['n', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, 'fa'] ),
					ArabicConjugation.new( "entum", :jussive, ['t', stem.root[0], hollow_vowel, stem.root[2], 'w', 'aa'], ['fa', nil, nil, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :jussive, ['t', stem.root[0], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "hoom", :jussive, ['y', stem.root[0], hollow_vowel, stem.root[2], 'w', 'aa'], ['fa', nil, nil, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :jussive, ['y', stem.root[0], stem.root[2], 'n'], ['fa', stem.imperfect_kicker, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :jussive, ['t', stem.root[0], hollow_vowel, stem.root[2], 'aa'], ['fa', nil, nil, nil, nil] ),
					ArabicConjugation.new( "hooma-m", :jussive, ['y', stem.root[0], hollow_vowel, stem.root[2], 'aa'], ['fa', nil, nil, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :jussive, ['t', stem.root[0], hollow_vowel, stem.root[2], 'aa'], ['fa', nil, nil, nil, nil] ),

					ArabicConjugation.new( "enta", :imperative, [stem.root[0], stem.root[2]], [stem.imperfect_kicker, "sk"] ),
					ArabicConjugation.new( "enti", :imperative, [stem.root[0], hollow_vowel, stem.root[2], 'y'], [nil, nil, nil, nil] ),
					ArabicConjugation.new( "entuma", :imperative, [stem.root[0], hollow_vowel, stem.root[2], 'aa'], [nil, nil, nil, nil] ),
					ArabicConjugation.new( "entum", :imperative, [stem.root[0], hollow_vowel, stem.root[2], 'w', 'aa'], [nil, nil, nil, nil, nil] ),
					ArabicConjugation.new( "entun", :imperative, [stem.root[0], stem.root[2], 'n'], [stem.imperfect_kicker, 'sk', 'fa'] ),

					ArabicConjugation.new( "ana", :perfect, [stem.root[0], stem.root[2], 't'], [perfect_kicker_vowel, 'sk', 'da'] ),
					ArabicConjugation.new( "enta", :perfect, [stem.root[0], stem.root[2], 't'], [perfect_kicker_vowel, 'sk', 'fa'] ),
					ArabicConjugation.new( "enti", :perfect, [stem.root[0], stem.root[2], 't'], [perfect_kicker_vowel, 'sk', 'ka'] ),
					ArabicConjugation.new( "hooa", :perfect, [stem.root[0], "aa", stem.root[2]], [nil, nil, 'fa'] ),
					ArabicConjugation.new( "heea", :perfect, [stem.root[0], "aa", stem.root[2], 't'], [nil, nil, 'fa', 'sk'] ),
					ArabicConjugation.new( "nahn", :perfect, [stem.root[0], stem.root[2], 'n', 'aa'], [perfect_kicker_vowel, 'sk', nil, nil] ),
					ArabicConjugation.new( "entum", :perfect, [stem.root[0], stem.root[2], 't', 'm'], [perfect_kicker_vowel, 'sk', 'da', 'sk'] ),
					ArabicConjugation.new( "entun", :perfect, [stem.root[0], stem.root[2], 't', 'n'], [perfect_kicker_vowel, 'sk', 'da', 'dd'] ),
					ArabicConjugation.new( "hoom", :perfect, [stem.root[0], "aa", stem.root[2], 'w', 'aa'], [nil, nil, nil, nil, nil] ),
					ArabicConjugation.new( "hoon", :perfect, [stem.root[0], stem.root[2], 'n'], [perfect_kicker_vowel, 'sk', 'fa'] ),
					ArabicConjugation.new( "entuma", :perfect, [stem.root[0], stem.root[2], 't', 'm', 'aa'], [perfect_kicker_vowel, 'sk', 'da', nil, nil] ),
					ArabicConjugation.new( "hooma-m", :perfect, [stem.root[0], 'aa', stem.root[2], 'aa'], [nil, nil, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :perfect, [stem.root[0], 'aa', stem.root[2], 't', 'aa'], [nil, nil, 'fa', nil, nil] ),

					ArabicConjugation.new( nil, :active_participle, [stem.root[0], 'aa', 'hy', stem.root[2]], [nil, nil, 'ka', nil] ),
					ArabicConjugation.new( nil, :passive_participle, ['m', stem.root[0], hollow_vowel, stem.root[2]], ['fa', nil, nil, nil] )
				]
			when {root_category: "doubled", root_subcategory: nil}
				return [
					ArabicConjugation.new( "ana", :imperfect, ["a", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "enta", :imperfect, ["t", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "enti", :imperfect, ["t", stem.root[0], stem.root[1], "y", "n"], ["fa", stem.imperfect_kicker, "dd", nil, "fa"] ),
					ArabicConjugation.new( "hooa", :imperfect, ["y", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "heea", :imperfect, ["t", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "nahn", :imperfect, ["n", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "entum", :imperfect, ["t", stem.root[0], stem.root[1], "w", "n"], ["fa", stem.imperfect_kicker, "dd", nil, "fa"] ),
					ArabicConjugation.new( "hoom", :imperfect, ["y", stem.root[0], stem.root[1], "w", "n"], ["fa", stem.imperfect_kicker, "dd", nil, "fa"] ),
					ArabicConjugation.new( "entun", :imperfect, ["t", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "hoon", :imperfect, ["y", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "entuma", :imperfect, ["t", stem.root[0], stem.root[1], "aa", "n"], ["fa", stem.imperfect_kicker, nil, "dd", "ka"] ),
					ArabicConjugation.new( "hooma-m", :imperfect, ["y", stem.root[0], stem.root[1], "aa", "n"], ["fa", stem.imperfect_kicker, nil, "dd", "ka"] ),
					ArabicConjugation.new( "hooma-f", :imperfect, ["t", stem.root[0], stem.root[1], "aa", "n"], ["fa", stem.imperfect_kicker, nil, "dd", "ka"] ),

					ArabicConjugation.new( "ana", :jussive, ["a", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "enta", :jussive, ["t", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "enti", :jussive, ["t", stem.root[0], stem.root[1], "y"], ["fa", stem.imperfect_kicker, "dd", nil] ),
					ArabicConjugation.new( "hooa", :jussive, ["y", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "heea", :jussive, ["t", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "nahn", :jussive, ["n", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "entum", :jussive, ["t", stem.root[0], stem.root[1], "w", "aa"], ["fa", stem.imperfect_kicker, "dd", nil, nil] ),
					ArabicConjugation.new( "hoom", :jussive, ["y", stem.root[0], stem.root[1], "w", "aa"], ["fa", stem.imperfect_kicker, "dd", nil, nil] ),
					ArabicConjugation.new( "entun", :jussive, ["t", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "hoon", :jussive, ["y", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "entuma", :jussive, ["t", stem.root[0], stem.root[1], "aa"], ["fa", stem.imperfect_kicker, nil, "dd"] ),
					ArabicConjugation.new( "hooma-m", :jussive, ["y", stem.root[0], stem.root[1], "aa"], ["fa", stem.imperfect_kicker, nil, "dd"] ),
					ArabicConjugation.new( "hooma-f", :jussive, ["t", stem.root[0], stem.root[1], "aa"], ["fa", stem.imperfect_kicker, nil, "dd"] ),

					ArabicConjugation.new( "ana", :subjunctive, ["a", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "enta", :subjunctive, ["t", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "enti", :subjunctive, ["t", stem.root[0], stem.root[1], "y"], ["fa", stem.imperfect_kicker, "dd", nil] ),
					ArabicConjugation.new( "hooa", :subjunctive, ["y", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "heea", :subjunctive, ["t", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "nahn", :subjunctive, ["n", stem.root[0], stem.root[1]], ["fa", stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "entum", :subjunctive, ["t", stem.root[0], stem.root[1], "w", "aa"], ["fa", stem.imperfect_kicker, "dd", nil, nil] ),
					ArabicConjugation.new( "hoom", :subjunctive, ["y", stem.root[0], stem.root[1], "w", "aa"], ["fa", stem.imperfect_kicker, "dd", nil, nil] ),
					ArabicConjugation.new( "entun", :subjunctive, ["t", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "hoon", :subjunctive, ["y", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "entuma", :subjunctive, ["t", stem.root[0], stem.root[1], "aa"], ["fa", stem.imperfect_kicker, nil, "dd"] ),
					ArabicConjugation.new( "hooma-m", :subjunctive, ["y", stem.root[0], stem.root[1], "aa"], ["fa", stem.imperfect_kicker, nil, "dd"] ),
					ArabicConjugation.new( "hooma-f", :subjunctive, ["t", stem.root[0], stem.root[1], "aa"], ["fa", stem.imperfect_kicker, nil, "dd"] ),

					ArabicConjugation.new( "enta", :imperative, [stem.root[0], stem.root[1]], [stem.imperfect_kicker, "dd"] ),
					ArabicConjugation.new( "enti", :imperative, [stem.root[0], stem.root[1], "y"], [stem.imperfect_kicker, "dd", nil] ),
					ArabicConjugation.new( "entuma", :imperative, [stem.root[0], stem.root[1], "aa"], [stem.imperfect_kicker, nil, "dd"] ),
					ArabicConjugation.new( "entum", :imperative, [stem.root[0], stem.root[1], "w", "aa"], [stem.imperfect_kicker, "dd", nil, nil] ),
					ArabicConjugation.new( "entun", :imperative, ["aa", stem.root[0], stem.root[1], stem.root[2], "n"], [stem.imperfect_kicker, "sk", stem.imperfect_kicker, "sk", "fa"] ),

					ArabicConjugation.new( "ana", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", stem.perfect_kicker, "sk", "da"] ),
					ArabicConjugation.new( "enta", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", stem.perfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "enti", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", stem.perfect_kicker, "sk", "ka"] ),
					ArabicConjugation.new( "hooa", :perfect, [stem.root[0], stem.root[1]], ["fa", "dd"] ),
					ArabicConjugation.new( "heea", :perfect, [stem.root[0], stem.root[1], "t"], ["fa", "dd", "sk"] ),
					ArabicConjugation.new( "nahn", :perfect, [stem.root[0], stem.root[1], stem.root[2], "n", "aa"], ["fa", stem.perfect_kicker, "sk", nil, nil] ),
					ArabicConjugation.new( "entum", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "m"], ["fa", stem.perfect_kicker, "sk", "da", nil] ),
					ArabicConjugation.new( "entun", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "n"], ["fa", stem.perfect_kicker, "sk", "da", "dd"] ),
					ArabicConjugation.new( "hoom", :perfect, [stem.root[0], stem.root[1], "w", "aa"], ["fa", "dd", nil, nil] ),
					ArabicConjugation.new( "hoon", :perfect, [stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", stem.perfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "entuma", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "m", "aa"], ["fa", stem.perfect_kicker, "sk", "da", nil, nil] ),
					ArabicConjugation.new( "hooma-m", :perfect, [stem.root[0], stem.root[1], "aa"], ["fa", nil, "dd"] ),
					ArabicConjugation.new( "hooma-f", :perfect, [stem.root[0], stem.root[1], "t", "aa"], ["fa", "dd", nil, nil] )
				]
			when {root_category: "defective", root_subcategory: "defective-w"}, {root_category: "defective", root_subcategory: "defective-y-fa_ka"}
				merged_vowel = nil
				if stem.root[2] == "w" then merged_vowel = "da" end
				if stem.root[2] == "y" then merged_vowel = "ka" end

				merged_consonant = nil
				if stem.root[2] == "w" then merged_consonant = "aa" end
				if stem.root[2] == "y" then merged_consonant = "amq" end

				return [

					ArabicConjugation.new( "ana", :imperfect, ["a", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "enta", :imperfect, ["t", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "enti", :imperfect, ["t", stem.root[0], stem.root[1], "y", "n"], ["fa", "sk", "ka", nil, "fa"] ),
					ArabicConjugation.new( "hooa", :imperfect, ["y", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "heea", :imperfect, ["t", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "nahn", :imperfect, ["n", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, nil] ),
					ArabicConjugation.new( "entum", :imperfect, ["t", stem.root[0], stem.root[1], "w", "n"], ["fa", "sk", "da", nil, "fa"] ),
					ArabicConjugation.new( "hoom", :imperfect, ["y", stem.root[0], stem.root[1], "w", "n"], ["fa", "sk", "da", nil, "fa"] ),
					ArabicConjugation.new( "entun", :imperfect, ["t", stem.root[0], stem.root[1], "w", "n"], ["fa", "sk", stem.imperfect_kicker, nil, "fa"] ),
					ArabicConjugation.new( "hoon", :imperfect, ["y", stem.root[0], stem.root[1], "w", "n"], ["fa", "sk", stem.imperfect_kicker, nil, "fa"] ),
					ArabicConjugation.new( "entuma", :imperfect, ["t", stem.root[0], stem.root[1], stem.root[2], "aa", "n"], ["fa", "sk", stem.imperfect_kicker, nil, nil, "ka"] ),
					ArabicConjugation.new( "hooma-m", :imperfect, ["t", stem.root[0], stem.root[1], stem.root[2], "aa", "n"], ["fa", "sk", stem.imperfect_kicker, nil, nil, "ka"] ),
					ArabicConjugation.new( "hooma-f", :imperfect, ["y", stem.root[0], stem.root[1], stem.root[2], "aa", "n"], ["fa", "sk", stem.imperfect_kicker, nil, nil, "ka"] ),

					ArabicConjugation.new( "ana", :jussive, ["a", stem.root[0], stem.root[1]], ["fa", "sk", merged_vowel] ),
					ArabicConjugation.new( "enta", :jussive, ["t", stem.root[0], stem.root[1]], ["fa", "sk", merged_vowel] ),
					ArabicConjugation.new( "enti", :jussive, ["t", stem.root[0], stem.root[1], "y"], ["fa", "sk", "ka", nil] ),
					ArabicConjugation.new( "hooa", :jussive, ["y", stem.root[0], stem.root[1]], ["fa", "sk", merged_vowel] ),
					ArabicConjugation.new( "heea", :jussive, ["t", stem.root[0], stem.root[1]], ["fa", "sk", merged_vowel] ),
					ArabicConjugation.new( "nahn", :jussive, ["n", stem.root[0], stem.root[1]], ["fa", "sk", merged_vowel] ),
					ArabicConjugation.new( "entum", :jussive, ["t", stem.root[0], stem.root[1], "w", "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hoom", :jussive, ["y", stem.root[0], stem.root[1], "w", "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entun", :jussive, ["t", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, nil, "fa"] ),
					ArabicConjugation.new( "hoon", :jussive, ["y", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, nil, "fa"] ),
					ArabicConjugation.new( "entuma", :jussive, ["t", stem.root[0], stem.root[1], stem.root[2], "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-m", :jussive, ["t", stem.root[0], stem.root[1], stem.root[2], "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :jussive, ["y", stem.root[0], stem.root[1], stem.root[2], "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( "ana", :subjunctive, ["a", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, "fa"] ),
					ArabicConjugation.new( "enta", :subjunctive, ["a", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, "fa"] ),
					ArabicConjugation.new( "enti", :subjunctive, ["t", stem.root[0], stem.root[1], "y"], ["fa", "sk", "ka", nil] ),
					ArabicConjugation.new( "hooa", :subjunctive, ["y", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, "fa"] ),
					ArabicConjugation.new( "heea", :subjunctive, ["t", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, "fa"] ),
					ArabicConjugation.new( "nahn", :subjunctive, ["n", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", stem.imperfect_kicker, "fa"] ),
					ArabicConjugation.new( "entum", :subjunctive, ["t", stem.root[0], stem.root[1], "w", "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hoom", :subjunctive, ["y", stem.root[0], stem.root[1], "w", "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "entun", :subjunctive, ["t", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, nil, "fa"] ),
					ArabicConjugation.new( "hoon", :subjunctive, ["y", stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "sk", stem.imperfect_kicker, nil, "fa"] ),
					ArabicConjugation.new( "entuma", :subjunctive, ["t", stem.root[0], stem.root[1], stem.root[2], "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-m", :subjunctive, ["t", stem.root[0], stem.root[1], stem.root[2], "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),
					ArabicConjugation.new( "hooma-f", :subjunctive, ["y", stem.root[0], stem.root[1], stem.root[2], "aa"], ["fa", "sk", stem.imperfect_kicker, nil, nil] ),

					ArabicConjugation.new( "enta", :imperative, ["aa", stem.root[0], stem.root[1]], [stem.imperfect_kicker, "sk", merged_vowel] ),
					ArabicConjugation.new( "enti", :imperative, ["aa", stem.root[0], stem.root[1], "y"], [stem.imperfect_kicker, "sk", "ka", nil] ),
					ArabicConjugation.new( "entuma", :imperative, ["aa", stem.root[0], stem.root[1], stem.root[2], "aa"], [stem.imperfect_kicker, "sk", merged_vowel, "fa", nil] ),
					ArabicConjugation.new( "entum", :imperative, ["aa", stem.root[0], stem.root[1], "w", "aa"], [stem.imperfect_kicker, "sk", merged_vowel, nil, nil] ),
					ArabicConjugation.new( "entun", :imperative, ["aa", stem.root[0], stem.root[1], stem.root[2], "n"], [stem.imperfect_kicker, "sk", merged_vowel, nil, "fa"] ),

					ArabicConjugation.new( "ana", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", stem.perfect_kicker, "sk", "da"] ),
					ArabicConjugation.new( "enta", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", stem.perfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "enti", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", stem.perfect_kicker, "sk", "ka"] ),
					ArabicConjugation.new( "hooa", :perfect, [stem.root[0], stem.root[1], merged_consonant], ["fa", nil, nil] ),
					ArabicConjugation.new( "heea", :perfect, [stem.root[0], stem.root[1], "t"], ["fa", stem.perfect_kicker, "sk"] ),
					ArabicConjugation.new( "nahn", :perfect, [stem.root[0], stem.root[1], stem.root[2], "n", "aa"], ["fa", stem.perfect_kicker, "sk", nil, nil] ),
					ArabicConjugation.new( "entum", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "m"], ["fa", stem.perfect_kicker, "sk", "da", nil] ),
					ArabicConjugation.new( "entun", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "n"], ["fa", stem.perfect_kicker, "sk", "da", "dd"] ),
					ArabicConjugation.new( "hoom", :perfect, [stem.root[0], stem.root[1], "w", "aa"], ["fa", stem.perfect_kicker, "sk", nil] ),
					ArabicConjugation.new( "hoon", :perfect, [stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", stem.perfect_kicker, "sk", "fa"] ),
					ArabicConjugation.new( "entuma", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "m", "aa"], ["fa", stem.perfect_kicker, "sk", "da", nil, nil] ),
					ArabicConjugation.new( "hooma-m", :perfect, [stem.root[0], stem.root[1], stem.root[2], "aa"], ["fa", stem.perfect_kicker, "fa", nil] ),
					ArabicConjugation.new( "hooma-f", :perfect, [stem.root[0], stem.root[1], "t", "aa"], ["fa", stem.perfect_kicker, nil, nil] ),

					ArabicConjugation.new( nil, :active_participle, [stem.root[0], "aa", stem.root[1]], [nil, nil, "in"] ),
					ArabicConjugation.new( nil, :passive_participle, ["m", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", merged_vowel, "dd"] )
				]
			when {root_category: "defective", root_subcategory: "defective-y-ka_fa"}
				return [
					ArabicConjugation.new( "ana", :imperfect, ["a", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "enta", :imperfect, ["t", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "enti", :imperfect, ["t", stem.root[0], stem.root[1], "y", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "hooa", :imperfect, ["y", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "heea", :imperfect, ["t", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "nahn", :imperfect, ["n", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "entum", :imperfect, ["t", stem.root[0], stem.root[1], "w", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "hoom", :imperfect, ["y", stem.root[0], stem.root[1], "w", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "entun", :imperfect, ["t", stem.root[0], stem.root[1], "y", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "hoon", :imperfect, ["y", stem.root[0], stem.root[1], "y", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "entuma", :imperfect, ["t", stem.root[0], stem.root[1], "y", "aa", "n"], ["fa", "sk", "fa", "fa", nil, "ka"] ),
					ArabicConjugation.new( "hooma-m", :imperfect, ["y", stem.root[0], stem.root[1], "y", "aa", "n"], ["fa", "sk", "fa", "fa", nil, "ka"] ),
					ArabicConjugation.new( "hooma-f", :imperfect, ["t", stem.root[0], stem.root[1], "y", "aa", "n"], ["fa", "sk", "fa", "fa", nil, "ka"] ),

					ArabicConjugation.new( "ana", :jussive, ["a", stem.root[0], stem.root[1]], ["fa", "sk", "fa"] ),
					ArabicConjugation.new( "enta", :jussive, ["t", stem.root[0], stem.root[1]], ["fa", "sk", "fa"] ),
					ArabicConjugation.new( "enti", :jussive, ["t", stem.root[0], stem.root[1], "y"], ["fa", "sk", "fa", "sk"] ),
					ArabicConjugation.new( "hooa", :jussive, ["y", stem.root[0], stem.root[1]], ["fa", "sk", "fa"] ),
					ArabicConjugation.new( "heea", :jussive, ["t", stem.root[0], stem.root[1]], ["fa", "sk", "fa"] ),
					ArabicConjugation.new( "nahn", :jussive, ["n", stem.root[0], stem.root[1]], ["fa", "sk", "fa"] ),
					ArabicConjugation.new( "entum", :jussive, ["t", stem.root[0], stem.root[1], "w", "aa"], ["fa", "sk", "fa", "sk", nil] ),
					ArabicConjugation.new( "hoom", :jussive, ["y", stem.root[0], stem.root[1], "w", "aa"], ["fa", "sk", "fa", "sk", nil] ),
					ArabicConjugation.new( "entun", :jussive, ["t", stem.root[0], stem.root[1], "y", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "hoon", :jussive, ["y", stem.root[0], stem.root[1], "y", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "entuma", :jussive, ["t", stem.root[0], stem.root[1], "y", "aa"], ["fa", "sk", "fa", "fa", nil] ),
					ArabicConjugation.new( "hooma-m", :jussive, ["y", stem.root[0], stem.root[1], "y", "aa"], ["fa", "sk", "fa", "fa", nil] ),
					ArabicConjugation.new( "hooma-f", :jussive, ["t", stem.root[0], stem.root[1], "y", "aa"], ["fa", "sk", "fa", "fa", nil] ),

					ArabicConjugation.new( "ana", :imperfect, ["a", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "enta", :imperfect, ["t", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "hooa", :imperfect, ["y", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "heea", :imperfect, ["t", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "nahn", :imperfect, ["n", stem.root[0], stem.root[1], "amq"], ["fa", "sk", "fa", nil] ),
					ArabicConjugation.new( "enti", :subjunctive, ["t", stem.root[0], stem.root[1], "y"], ["fa", "sk", "fa", "sk"] ),
					ArabicConjugation.new( "entum", :subjunctive, ["t", stem.root[0], stem.root[1], "w", "aa"], ["fa", "sk", "fa", "sk", nil] ),
					ArabicConjugation.new( "hoom", :subjunctive, ["y", stem.root[0], stem.root[1], "w", "aa"], ["fa", "sk", "fa", "sk", nil] ),
					ArabicConjugation.new( "entun", :subjunctive, ["t", stem.root[0], stem.root[1], "y", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "hoon", :subjunctive, ["y", stem.root[0], stem.root[1], "y", "n"], ["fa", "sk", "fa", "sk", "fa"] ),
					ArabicConjugation.new( "entuma", :subjunctive, ["t", stem.root[0], stem.root[1], "y", "aa"], ["fa", "sk", "fa", "fa", nil] ),
					ArabicConjugation.new( "hooma-m", :subjunctive, ["y", stem.root[0], stem.root[1], "y", "aa"], ["fa", "sk", "fa", "fa", nil] ),
					ArabicConjugation.new( "hooma-f", :subjunctive, ["t", stem.root[0], stem.root[1], "y", "aa"], ["fa", "sk", "fa", "fa", nil] ),

					ArabicConjugation.new( "enta", :imperative, ["aa", stem.root[0], stem.root[1]], ["ka", "sk", "fa"] ),
					ArabicConjugation.new( "enti", :imperative, ["aa", stem.root[0], stem.root[1], "y"], ["ka", "sk", "fa", "sk"] ),
					ArabicConjugation.new( "entuma", :imperative, ["aa", stem.root[0], stem.root[1], "y", "aa"], ["ka", "sk", "fa", "fa", nil] ),
					ArabicConjugation.new( "entum", :imperative, ["aa", stem.root[0], stem.root[1], "w", "aa"], ["ka", "sk", "fa", "sk", nil] ),
					ArabicConjugation.new( "entun", :imperative, ["aa", stem.root[0], stem.root[1], "y", "n"], ["ka", "sk", "fa", "sk", "fa"] ),

					ArabicConjugation.new( "ana", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", "ka", nil, "da"] ),
					ArabicConjugation.new( "enta", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", "ka", nil, "fa"] ),
					ArabicConjugation.new( "enti", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", "ka", nil, "ka"] ),
					ArabicConjugation.new( "hooa", :perfect, [stem.root[0], stem.root[1], stem.root[2]], ["fa", "ka", "fa"] ),
					ArabicConjugation.new( "heea", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t"], ["fa", "ka", "fa", "sk"] ),
					ArabicConjugation.new( "nahn", :perfect, [stem.root[0], stem.root[1], stem.root[2], "n", "aa"], ["fa", "ka", nil, nil, nil] ),
					ArabicConjugation.new( "entum", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "m"], ["fa", "ka", nil, "da", nil] ),
					ArabicConjugation.new( "entun", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "n"], ["fa", "ka", nil, "da", "dd"] ),
					ArabicConjugation.new( "hoom", :perfect, [stem.root[0], stem.root[1], "w", "aa"], ["fa", "da", nil, nil] ),
					ArabicConjugation.new( "hoon", :perfect, [stem.root[0], stem.root[1], stem.root[2], "n"], ["fa", "ka", nil, "fa"] ),
					ArabicConjugation.new( "entuma", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "m", "aa"], ["fa", "ka", nil, "da", nil, nil] ),
					ArabicConjugation.new( "hooma-m", :perfect, [stem.root[0], stem.root[1], stem.root[2], "aa"], ["fa", "ka", "fa", nil] ),
					ArabicConjugation.new( "hooma-f", :perfect, [stem.root[0], stem.root[1], stem.root[2], "t", "aa"], ["fa", "ka", "fa", "fa", nil] ),

					ArabicConjugation.new( nil, :active_participle, [stem.root[0], "aa", stem.root[1]], [nil, nil, "ka"] ),
					ArabicConjugation.new( nil, :passive_participle, ["m", stem.root[0], stem.root[1], stem.root[2]], ["fa", "sk", "ka", "dd"] )
				]
			end
		end

	end

private

end
