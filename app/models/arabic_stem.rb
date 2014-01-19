class ArabicStem < ActiveRecord::Base

# ASSOCIATIONS
  has_many :english_meanings, dependent: :destroy

# VALIDATIONS
	validates :root, uniqueness: {scope: [:perfect_kicker, :imperfect_kicker]}, length: {mininum: 3, maximum: 4}

# DELEGATIONS
  def measures
    self.english_meanings.map(&:measure)
  end

# CLASS METHODS
  def self.stem_for_root(root)
    ArabicStem.where("root[1] = ? AND root[2] = ? AND root[3] = ?", root[0], root[1], root[2]).first
  end

# INSTANCE METHODS
  def conjugations_in_measure(measure)
    return StemConjugator.conjugations_for_stem_in_measure(self, measure)
  end

# CONVENIENCE METHODS
  def hollow?
    return true if (self.root[1] == "w" || self.root[1] == "y") && self.root.length == 3
  end

  def assimilated?
    return true if (self.root[0] == "w" || self.root[0] == "y") && self.root.length == 3
  end

  def defective?
    return true if (self.root[2] == "w" || self.root[2] == "y") && self.root.length == 3
  end

  def hamzated?
    return true if (self.root[0] == "hmz" || self.root[1] == "hmz" || self.root[2] == "hmz") && self.root.length == 3
  end

  def exists_in_measure?(measure)
    return true if self.measures.include?(measure)
  end

end
