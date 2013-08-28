class ArabicStem < ActiveRecord::Base
# ASSOCIATIONS

# VALIDATIONS
	validates :root, uniqueness: {scope: :vocalization}, length: {mininum: 3, maximum: 4}

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
	def to_s
	end

# CLASS METHODS

# INSTANCE METHODS

# PRIVATE METHODS
private

end
