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
  def conjugations_in_measure(measure)
    return StemConjugator.conjugations_for_stem_in_measure(self, measure)
  end

# CONVENIENCE METHODS
  def hollow?
    return true if (self.root[1] == "w" || self.root[1] == "y") && self.root.length == 3
  end

  def assimilated?
    return true if self.root[0] == "w" && self.root.length == 3
  end

  def defective?
    return true if (self.root[2] == "w" || self.root[2] == "y") && self.root.length == 3
  end

  def hamzated?
    return true if (self.root[0] == "hmz" || self.root[1] == "hmz" || self.root[2] == "hmz") && self.root.length == 3
  end

# PRIVATE METHODS
private

end
