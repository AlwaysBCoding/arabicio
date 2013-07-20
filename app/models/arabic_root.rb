class ArabicRoot < ActiveRecord::Base
# ASSOCIATIONS

# VALIDATIONS
	validates :root, uniqueness: true, length: {mininum: 3, maximum: 4}

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
	def to_s
	end

	def to_param
	end

# CLASS METHODS

# INSTANCE METHODS

# PRIVATE METHODS
private

end
