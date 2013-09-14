class EnglishMeaning < ActiveRecord::Base
# ASSOCIATIONS
  belongs_to :arabic_stem

# VALIDATIONS
  validates :measure, uniqueness: { scope: :arabic_stem_id }

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
