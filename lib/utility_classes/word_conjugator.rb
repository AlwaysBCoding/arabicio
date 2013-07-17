class WordConjugator

	def self.create_conjugations(root, form, subform)
		{

			present: {
				ana: %w[a k t b],
				enta: %w[t k t b],
				enti: %w[t k t b y n],
				hooa: %w[y k t b],
				heea: %w[t k t b],
				nahn: %w[n k t b],
				entum: %w[t k t b w n],
				entun: %w[t k t b n],
				hoom: %w[y k t b w n],
				hoon: %w[y k t b n]
			},

			past: {
				ana: %w[k t b t],
				enta: %w[k t b t],
				enti: %w[k t b t],
				hooa: %w[k t b],
				heea: %w[k t b t],
				nahn: %w[k t b n aa],
				entum: %w[k t b t m],
				entun: %w[k t b t n],
				hoom: %w[k t b w aa],
				hoon: %w[k t b n]
			}

		}
	end

private

end
