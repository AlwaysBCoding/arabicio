class WordConjugator

	def self.create_conjugations(root, form, subform)
		{

			present: {
				ana: ['a', root[0], root[1], root[2]],
				enta: ['t', root[0], root[1], root[2]],
				enti: ['t', root[0], root[1], root[2], 'y', 'n'],
				hooa: ['y', root[0], root[1], root[2]],
				heea: ['t', root[0], root[1], root[2]],
				nahn: ['n', root[0], root[1], root[2]],
				entum: ['t', root[0], root[1], root[2], 'w', 'n'],
				entun: ['t', root[0], root[1], root[2], 'n'],
				hoom: ['y', root[0], root[1], root[2], 'w', 'n'],
				hoon: ['y', root[0], root[1], root[2], 'n']
			},

			past: {
				ana: [root[0], root[1], root[2], 't'],
				enta: [root[0], root[1], root[2], 't'],
				enti: [root[0], root[1], root[2], 't'],
				hooa: [root[0], root[1], root[2]],
				heea: [root[0], root[1], root[2], 't'],
				nahn: [root[0], root[1], root[2], 'n', 'aa'],
				entum: [root[0], root[1], root[2], 't', 'm'],
				entun: [root[0], root[1], root[2], 't', 'n'],
				hoom: [root[0], root[1], root[2], 'w', 'aa'],
				hoon: [root[0], root[1], root[2], 'n']
			}

		}
	end

private

end
