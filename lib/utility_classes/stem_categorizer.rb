class StemCategorizer

  def self.categorize(stem)
    # QUADRILATERAL
    return {root_category: "quadrilateral", root_subcategory: nil} if stem.root.length == 4

    # MULTIPLE
    return {root_category: "hollow-hamzated", root_subcategory: "hollow-hamzated-final"} if stem.hollow? && stem.root[2] == "hmz"
    return {root_category: "assimilated-defective", root_subcategory: "assimilated-defective-y"} if stem.assimilated? && stem.root[2] == "y"
    return {root_category: "hollow-defective", root_subcategory: "hollow-defective-y"} if stem.hollow? && stem.root[2] == "y"

    # DOUBLED
    return {root_category: "doubled", root_subcategory: nil} if stem.root[1] == stem.root[2]

    # ASSIMILATED
    return {root_category: "assimilated", root_subcategory: "assimilated-y"} if stem.root[0] == "y" #-#
    return {root_category: "assimilated", root_subcategory: "assimilated-concatenation"} if stem.root[0] == "w" && %w[da ka].include?(stem.perfect_kicker)
    return {root_category: "assimilated", root_subcategory: "assimilated-deletion"} if stem.root[0] == "w" && stem.perfect_kicker == "fa"

    # HOLLOW
    if stem.hollow?
      return {root_category: "hollow", root_subcategory: "hollow-aa"} if stem.imperfect_kicker == "fa"
      return {root_category: "hollow", root_subcategory: "hollow-w"} if stem.imperfect_kicker == "da"
      return {root_category: "hollow", root_subcategory: "hollow-y"} if stem.imperfect_kicker == "ka"
    end

    # DEFECTIVE
    if stem.defective?
      return {root_category: "defective", root_subcategory: "defective-w"} if stem.root[2] == "w"
      return {root_category: "defective", root_subcategory: "defective-y-fa_ka"} if stem.root[2] == "y" && stem.perfect_kicker == "fa"
      return {root_category: "defective", root_subcategory: "defective-y-ka_fa"} if stem.root[2] == "y" && stem.perfect_kicker == "ka"
    end

    # HAMZATED
    if stem.hamzated?
      return {root_category: "hamzated", root_subcategory: "hamzated-initial"} if stem.root[0] == "hmz"
      return {root_category: "hamzated", root_subcategory: "hamzated-medial"} if stem.root[1] == "hmz"
      return {root_category: "hamzated", root_subcategory: "hamzated-final"} if stem.root[2] == "hmz"
    end

    # SOUND
    return {root_category: "sound", root_subcategory: nil} #-#
  end

end
