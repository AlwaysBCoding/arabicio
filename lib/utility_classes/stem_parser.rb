class StemParser
  BIG5_CONJUGATION_PREFIXES = %w[a t y n]

  def self.parse_stem(input)
    parsed_input = ArabicTranslator.arabic_to_english_symbol_array(input)
    remove_short_vowels(parsed_input)

    candidates = self.guess_root(parsed_input)
    candidates.map! { |root| OpenStruct.new(root: root) }
    return candidates
  end

  def self.guess_root(input)
    candidates = []

    if input.length == 2
      candidates << ['w', input[0], input[1]]           #[x, x] (w) - ASSIMILATED
      candidates << ["hmz", input[0], input[1]]         #[x, x] (hmz) - HAMZATED-INITIAL
      candidates << [input[0], "w", input[1]]           #[x, x] (w) - HOLLOW
      candidates << [input[0], "y", input[1]]           #[x, x] (y) - HOLLOW
      candidates << [input[0], input[1], input[1]]      #[x, x] (dd) - DOUBLED
    end

    if input.length == 3
      candidates << input #[x, x, x] - SOLID

      candidates << ["w", input[0], input[1]] if ( %w[aa n y].include?(input[2]) ) #[x, x, "?"] (w) - ASSIMILATED
      candidates << ["w", input[1], input[2]] if ( %w[a n t y].include?(input[0]) ) #["?", x, x] (w) - ASSIMILATED

      candidates << [input[0], "w", input[1]] if ( %w[n t].include?(input[2]) ) #[x, x, "?"] (w) - HOLLOW
      candidates << [input[0], "y", input[1]] if ( %w[n t].include?(input[2]) ) #[x, x, "?"] (y) - HOLLOW
      candidates << [input[0], "w", input[2]] if ( input[1] == "aa" ) #[x, "aa", x] (w) - HOLLOW
      candidates << [input[0], "y", input[2]] if ( input[1] == "aa" ) #[x, "aa", x] (y) - HOLLOW
      candidates << [input[1], "w", input[2]] if ( %w[a n t y].include?(input[0]) ) #["?", x, x] (w) - HOLLOW
      candidates << [input[1], "y", input[2]] if ( %w[a n t y].include?(input[0]) ) #["?", x, x] (y) - HOLLOW

      candidates << [input[1], input[2], input[2]]if ( %w[a n t y].include?(input[0]) ) #["?", x, x] (dd) - DOUBLED

      candidates << [input[0], input[1], "w"] if ( %w[aa t].include?(input[2]) ) #[x, x, "?"] (w) - DEFECTIVE
      candidates << [input[0], input[1], "y"] if ( %w[aa amq t].include?(input[2]) ) #[x, x, "?"] (y) - DEFECTIVE
      candidates << [input[0], input[2], "w"] if ( input[1] == "aa" ) #[x, "aa", x] (w) - DEFECTIVE
      candidates << [input[0], input[2], "y"] if ( input[1] == "aa" ) #[x, "aa", x] (y) - DEFECTIVE
      candidates << [input[1], input[2], "w"] if ( %w[a aa n t y].include?(input[0]) ) #["?", x, x] (w) - DEFECTIVE
      candidates << [input[1], input[2], "y"] if ( %w[a aa n t y].include?(input[0]) ) #["?", x, x] (y) - DEFECTIVE

      candidates << ["hmz", input[0], input[1]] if ( %w[aa n y].include?(input[2]) ) #[x, x, "?"] (hmz) - HAMZATED-INITIAL
      candidates << ["hmz", input[1], input[2]] if ( %w[a amd].include?(input[0]) ) #["?", x, x] (hmz) - HAMZATED-INITIAL
      candidates << [input[0], "hmz", input[2]] if ( input[1] == "a" ) #[x, "a", x] (hmz) - HAMZATED-MEDIAL
      candidates << [input[0], input[1], "hmz"] if ( %w[a amd].include?(input[2]) ) #[x, x, "?"] (hmz) - HAMZATED-FINAL

      candidates << [input[0], input[1], input[1]] if ( %w[aa t y].include?(input[2]) ) #[x, x, "?"] (dd) - DOUBLED
    end

    if input.length == 4
      candidates << [input[1], input[2], input[3]] if ( %w[a aa m n t y].include?(input[0]) || input[1] == "aa" ) #["?", x, x, x] - SOLID
      candidates << [input[0], input[1], input[2]] if ( %w[aa n t].include?(input[3]) ) #[x, x, x, "?"] - SOLID
      candidates << [input[0], input[2], input[3]] if ( input[1] == "aa" ) #[x, "aa, x, x] - SOLID

      candidates << ["hmz", input[0], input[1]] if ( input[2] == "w" && input[3] == "aa") #[x, x, "w", "aa"] (hmz) - HAMZATED-INITIAL
      candidates << ["hmz", input[1], input[2]] if ( input[0] == "a" && %w[aa n t].include?(input[3]) ) # ["a", x, x, "?"] - HAMZATED-INITIAL
      candidates << ["hmz", input[2], input[3]] if ( %w[n t y].include?(input[0]) && input[1] == "a" ) # ["?", "aa", x, x] - HAMZATED-INITIAL

      candidates << [input[0], "hmz", input[2]] if ( input[1] == "aa" && input[3] == "aa" ) #[x, "aa", x, "aa"] (hmz) - HAMZATED-MEDIAL
      candidates << [input[0], "hmz", input[2]] if ( input[1] == "a" && %w[aa n t].include?(input[3]) ) #[x, "a", x, "?"] (hmz) - HAMZATED-MEDIAL
      candidates << [input[0], "hmz", input[3]] if ( input[1] == "aa" && input[2] == "hy" ) #[x, "aa", "hy", x] (hmz) - HAMZATED-MEDIAL
      candidates << [input[1], "hmz", input[3]] if ( %w[a aa n t y].include?(input[0]) && input[2] == "a" ) #["?", x, "a", x] (hmz) - HAMZATED-MEDIAL

      candidates << [input[0], input[1], "hmz"] if ( input[2] == "a" && %w[n t].include?(input[3]) ) #[x, x, "a", "?"] (hmz) - HAMZATED-FINAL
      candidates << [input[0], input[2], "hmz"] if ( input[1] == "aa" && input[3] == "hy") #[x, "aa", x, "hy"] (hmz) - HAMZATED-FINAL
      candidates << [input[1], input[2], "hmz"] if ( %w[a aa n t y].include?(input[0]) && input[3] == "a") # ["?", x, x, "a"] (hmz) - HAMZATED-FINAL
      candidates << [input[1], input[2], "hmz"] if ( %w[aa amd t y].include?(input[0]) && input[3] == "amd" ) # ["?", x, x, "amd"] (hmz) - HAMZATED-FINAL

      candidates << [input[0], "w", input[1]] if ( input[2] == "n" && input[3] == "aa" ) # [x, x, "n", "aa"] (w) - HOLLOW
      candidates << [input[0], "y", input[1]] if ( input[2] == "n" && input[3] == "aa" ) # [x, x, "n", "aa"] (y) - HOLLOW
      candidates << [input[0], "w", input[1]] if ( input[2] == "t" && %w[n m].include?(input[3]) ) # [x, x, "t", "?"] (w) - HOLLOW
      candidates << [input[0], "y", input[1]] if ( input[2] == "t" && %w[n m].include?(input[3]) ) # [x, x, "t", "?"] (y) - HOLLOW
      candidates << [input[0], "w", input[2]] if ( input[1] == "aa" && %w[aa t y].include?(input[3]) ) #[x, "aa", x, "?"] (w) - HOLLOW
      candidates << [input[0], "w", input[2]] if ( input[1] == "w" && input[3] == "y" ) #[x, "w", x, "y"] (w) - HOLLOW
      candidates << [input[0], "y", input[2]] if ( input[1] == "aa" && %w[aa t].include?(input[3]) ) #[x, "aa", x, "?"] (y) - HOLLOW
      candidates << [input[0], "y", input[2]] if ( input[1] == "y" && input[3] == "y" ) #[x, "y", x, "y"] (y) - HOLLOW
      candidates << [input[0], "w", input[3]] if ( input[1] == "aa" && input[2] == "hy" ) #[x, "aa", "hy", x] (w) - HOLLOW
      candidates << [input[0], "y", input[3]] if ( input[1] == "aa" && input[2] == "hy" ) #[x, "aa", "hy", x] (y) - HOLLOW
      candidates << [input[1], "w", input[2]] if ( %w[t y].include?(input[0]) && input[3] == "n" ) # ["?", x, x, "n"] (w) - HOLLOW
      candidates << [input[1], "y", input[2]] if ( %w[t y].include?(input[0]) && input[3] == "n" ) # ["?", x, x, "n"] (y) - HOLLOW
      candidates << [input[1], "w", input[3]] if ( %w[a m n t y].include?(input[0]) && input[2] == "aa" ) # ["?", x, "aa", x] (w) - HOLLOW-AA

      candidates << [input[0], input[1], "w"] if ( input[2] == "t" && input[3] == "aa" ) #[x, x, "t", "aa"] (w) - DEFECTIVE
      candidates << [input[0], input[1], "y"] if ( %w[t w].include?(input[2]) && input[3] == "aa" ) #[x, x, "?", "aa"] (y) - DEFECTIVE
      candidates << [input[1], input[2], "y"] if input[3] == "amq" #["?", x, x, "amq"] (y) - DEFECTIVE
      candidates << [input[1], input[2], "w"] if ( %w[aa t].include?(input[0]) && input[3] == "y" ) #["?", x, x, "y"] (w) - DEFECTIVE

      candidates << ["w", input[0], input[1]] if ( input[2] == "w" && input[3] == "aa" ) #[x, x, "w", "aa"] (w) - ASSIMILATED
      candidates << ["w", input[1], input[2]] if ( input[0] == "t" && %w[aa n y].include?(input[3]) ) #["t", x, x, "?"] (w) - ASSIMILATED
      candidates << ["w", input[1], input[2]] if ( input[0] == "y" && %w[aa n].include?(input[3]) ) #["y", x, x, "?"] (w) - ASSIMILATED

      candidates << [input[0], input[1], input[1]] if ( %w[t w].include?(input[2]) && input[3] == "aa") #[x, x, "?", "aa"](dd) - DOUBLED
      candidates << [input[1], input[2], input[2]] if ( input[0] == "t" && %w[aa y].include?(input[3]) ) #["t", x, x, "?"] (dd) - DOUBLED
      candidates << [input[1], input[2], input[2]] if ( input[0] == "y" && input[3] == "aa" ) #["y", x, x, "aa"] (dd) - DOUBLED
     end

    if input.length == 5
      # SOLID
      if input[0] == "t" && input[4] == "n" then candidates << [input[1], input[2], input[3]] end #["t", x, x, x, "n"]
      if input[0] == "y" && input[4] == "n" then candidates << [input[1], input[2], input[3]] end #["y", x, x, x, "n"]
      if input[0] == "t" && input[4] == "y" then candidates << [input[1], input[2], input[3]] end #["t", x, x, x, "y"]
      if input[0] == "t" && input[4] == "aa" then candidates << [input[1], input[2], input[3]] end #["t", x, x, x, "aa"]
      if input[0] == "y" && input[4] == "aa" then candidates << [input[1], input[2], input[3]] end #["y", x, x, x, "aa"]
      if input[0] == "a" && input[4] == "y" then candidates << [input[1], input[2], input[3]] end #["a", x, x, x, "y"]
      if input[0] == "a" && input[4] == "n" then candidates << [input[1], input[2], input[3]] end #["a", x, x, x, "n"]
      if input[0] == "a" && input[4] == "aa" then candidates << [input[1], input[2], input[3]] end #["a", x, x, x, "aa"]
      if input[0] == "aa" && input[4] == "y" then candidates << [input[1], input[2], input[3]] end #["aa", x, x, x, "y"]
      if input[0] == "aa" && input[4] == "n" then candidates << [input[1], input[2], input[3]] end #["aa", x, x, x, "n"]
      if input[0] == "aa" && input[4] == "aa" then candidates << [input[1], input[2], input[3]] end #["aa", x, x, x, "aa"]
      if input[3] == "n" && input[4] == "aa" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "n", "aa"]
      if input[3] == "t" && input[4] == "m" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "t", "m"]
      if input[3] == "t" && input[4] == "n" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "t", "n"]
      if input[3] == "w" && input[4] == "aa" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "w", "aa"]
      if input[3] == "t" && input[4] == "aa" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "t", "aa"]
      if input[0] == "m" && input[3] == "w" then candidates << [input[1], input[2], input[4]] end #["m", x, x, "w", x]

      # ASSIMILATED
      if input[0] == "t" && input[3] == "y" && input[4] == "n" then candidates << ["w", input[1], input[2]] end #["t", x, x, "y", "n"] (w)
      if input[0] == "t" && input[3] == "w" && input[4] == "n" then candidates << ["w", input[1], input[2]] end #["t", x, x, "w", "n"] (w)
      if input[0] == "y" && input[3] == "w" && input[4] == "n" then candidates << ["w", input[1], input[2]] end #["y", x, x, "w", "n"] (w)
      if input[0] == "t" && input[3] == "aa" && input[4] == "n" then candidates << ["w", input[1], input[2]] end #["t", x, x, "aa", "n"] (w)
      if input[0] == "y" && input[3] == "aa" && input[4] == "n" then candidates << ["w", input[1], input[2]] end #["y", x, x, "aa", "n"] (w)
      if input[0] == "t" && input[3] == "w" && input[4] == "aa" then candidates << ["w", input[1], input[2]] end #["t", x, x, "w", "aa"] (w)
      if input[0] == "y" && input[3] == "w" && input[4] == "aa" then candidates << ["w", input[1], input[2]] end #["y", x, x, "w", "aa"] (w)

      # HAMZATED-INITIAL
      if input[0] == "t" && input[1] == "a" && input[4] == "n" then candidates << ["hmz", input[2], input[3]] end #["t", "a", x, x, "n"] (hmz)
      if input[0] == "y" && input[1] == "a" && input[4] == "n" then candidates << ["hmz", input[2], input[3]] end #["y", "a", x, x, "n"] (hmz)
      if input[0] == "a" && input[3] == "n" && input[4] == "aa" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "n", "aa"] (hmz)
      if input[0] == "a" && input[3] == "t" && input[4] == "m" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "t", "m"] (hmz)
      if input[0] == "a" && input[3] == "t" && input[4] == "n" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "t", "n"] (hmz)
      if input[0] == "a" && input[3] == "w" && input[4] == "aa" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "w", "aa"] (hmz)
      if input[0] == "a" && input[3] == "t" && input[4] == "aa" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "t", "aa"] (hmz)
      if input[0] == "t" && input[1] == "a" && input[4] == "y" then candidates << ["hmz", input[2], input[3]] end #["t", "a", x, x, "y"] (hmz)
      if input[0] == "t" && input[1] == "a" && input[4] == "aa" then candidates << ["hmz", input[2], input[3]] end #["t", "a", x, x, "aa"] (hmz)
      if input[0] == "y" && input[1] == "a" && input[4] == "aa" then candidates << ["hmz", input[2], input[3]] end #["y", "a", x, x, "aa"] (hmz)
      if input[0] == "m" && input[1] == "a" && input[3] == "w" then candidates << ["hmz", input[2], input[4]] end #["m", "a", x, "w", x] (hmz)

      # HAMZATED-MEDIAL
      if input[0] == "t" && input[2] == "a" && input[4] == "n" then candidates << [input[1], "hmz", input[3]] end #["t", x, "a", x, "n"] (hmz)
      if input[0] == "y" && input[2] == "a" && input[4] == "n" then candidates << [input[1], "hmz", input[3]] end #["y", x, "a", x, "n"] (hmz)
      if input[0] == "t" && input[2] == "a" && input[4] == "y" then candidates << [input[1], "hmz", input[3]] end #["t", x, "a", x, "y"] (hmz)
      if input[0] == "t" && input[2] == "a" && input[4] == "aa" then candidates << [input[1], "hmz", input[3]] end #["t", x, "a", x, "aa"] (hmz)
      if input[0] == "y" && input[2] == "a" && input[4] == "aa" then candidates << [input[1], "hmz", input[3]] end #["y", x, "a", x, "aa"] (hmz)
      if input[0] == "aa" && input[2] == "a" && input[4] == "y" then candidates << [input[1], "hmz", input[3]] end #["aa", x, "a", x, "y"] (hmz)
      if input[0] == "aa" && input[2] == "a" && input[4] == "aa" then candidates << [input[1], "hmz", input[3]] end #["aa", x, "a", x, "aa"] (hmz)
      if input[0] == "aa" && input[2] == "a" && input[4] == "n" then candidates << [input[1], "hmz", input[3]] end #["aa", x, "a", x, "n"] (hmz)
      if input[1] == "a" && input[3] == "n" && input[4] == "aa" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x, "n", "aa"] (hmz)
      if input[1] == "a" && input[3] == "t" && input[4] == "m" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x, "t", "m"] (hmz)
      if input[1] == "a" && input[3] == "w" && input[4] == "aa" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x, "w", "aa"] (hmz)
      if input[1] == "a" && input[3] == "t" && input[4] == "aa" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x, "t", "aa"] (hmz)
      if input[0] == "m" && input[2] == "hw" && input[3] == "w" then candidates << [input[1], "hmz", input[4]] end #["m", x, "hw", "w", x] (hmz)

      # HAMZATED-FINAL
      if input[0] == "t" && input[3] == "a" && input[4] == "n" then candidates << [input[1], input[2], "hmz"] end #["t", x, x, "a", "n"] (hmz)
      if input[0] == "y" && input[3] == "a" && input[4] == "n" then candidates << [input[1], input[2], "hmz"] end #["y", x, x, "a", "n"] (hmz)
      if input[0] == "t" && input[3] == "amd" && input[4] == "n" then candidates << [input[1], input[2], "hmz"] end #["t", x, x, "amd", "n"] (hmz)
      if input[0] == "y" && input[3] == "amd" && input[4] == "n" then candidates << [input[1], input[2], "hmz"] end #["y", x, x, "amd", "n"] (hmz)
      if input[0] == "t" && input[3] == "hy" && input[4] == "y" then candidates << [input[1], input[2], "hmz"] end #["t", x, x, "hy", "y"] (hmz)
      if input[0] == "aa" && input[3] == "hy" && input[4] == "y" then candidates << [input[1], input[2], "hmz"] end #["aa", x, x, "hy", "y"] (hmz)
      if input[0] == "aa" && input[3] == "a" && input[4] == "n" then candidates << [input[1], input[2], "hmz"] end #["aa", x, x, "a", "n"] (hmz)
      if input[2] == "a" && input[3] == "n" && input[4] == "aa" then candidates << [input[0], input[1], "hmz"] end #[x, x, "a", "n", "aa"] (hmz)
      if input[2] == "a" && input[3] == "t" && input[4] == "m" then candidates << [input[0], input[1], "hmz"] end #[x, x, "a", "t", "m"] (hmz)
      if input[2] == "a" && input[3] == "t" && input[4] == "n" then candidates << [input[0], input[1], "hmz"] end #[x, x, "a", "t", "n"] (hmz)
      if input[2] == "hw" && input[3] == "w" && input[4] == "aa" then candidates << [input[0], input[1], "hmz"] end #[x, x, "a", "w", "aa"] (hmz)
      if input[2] == "a" && input[3] == "t" && input[4] == "aa" then candidates << [input[0], input[1], "hmz"] end #[x, x, "a", "t", "aa"] (hmz)

      # HOLLOW
      if input[1] == "aa" && input[3] == "w" && input[4] == "aa" then candidates << [input[0], "w", input[2]] end #[x, "aa", x, "w", "aa"] (w)
      if input[1] == "aa" && input[3] == "w" && input[4] == "aa" then candidates << [input[0], "y", input[2]] end #[x, "aa", x, "w", "aa"] (y)
      if input[2] == "t" && input[3] == "m" && input[4] == "aa" then candidates << [input[0], "w", input[1]] end #[x, x, "t", "m", "aa"] (w)
      if input[2] == "t" && input[3] == "m" && input[4] == "aa" then candidates << [input[0], "y", input[1]] end #[x, x, "t", "m", "aa"] (y)
      if input[1] == "aa" && input[3] == "t" && input[4] == "aa" then candidates << [input[0], "w", input[2]] end #[x, "aa", x, "t", "aa"] (w)
      if input[1] == "aa" && input[3] == "t" && input[4] == "aa" then candidates << [input[0], "y", input[2]] end #[x, "aa", x, "t", "aa"] (y)

      # HOLLOW-AA
      if input[0] == "t" && input[2] == "aa" && input[4] == "y" then candidates << [input[1], "w", input[3]] end #["t", x, "aa", x, "y"] (w)
      if input[0] == "t" && input[2] == "aa" && input[4] == "aa" then candidates << [input[1], "w", input[3]] end #["t", x, "aa", x, "aa"] (w)
      if input[0] == "y" && input[2] == "aa" && input[4] == "aa" then candidates << [input[1], "w", input[3]] end #["y", x, "aa", x, "aa"] (w)

      # DOUBLED
      if input[0] == "t" && input[3] == "y" && input[4] == "n" then candidates << [input[1], input[2], input[2]] end #["t", x, x, "y", "n"] (dd)
      if input[0] == "t" && input[3] == "w" && input[4] == "n" then candidates << [input[1], input[2], input[2]] end #["t", x, x, "w", "n"] (dd)
      if input[0] == "y" && input[3] == "w" && input[4] == "n" then candidates << [input[1], input[2], input[2]] end #["y", x, x, "w", "n"] (dd)
      if input[0] == "t" && input[3] == "aa" && input[4] == "n" then candidates << [input[1], input[2], input[2]] end #["t", x, x, "aa", "n"] (dd)
      if input[0] == "y" && input[3] == "aa" && input[4] == "n" then candidates << [input[1], input[2], input[2]] end #["y", x, x, "aa", "n"] (dd)
      if input[0] == "t" && input[3] == "w" && input[4] == "aa" then candidates << [input[1], input[2], input[2]] end #["t", x, x, "w", "aa"] (dd)
      if input[0] == "y" && input[3] == "w" && input[4] == "aa" then candidates << [input[1], input[2], input[2]] end #["y", x, x, "w", "aa"] (dd)

      # DEFECTIVE
      if input[0] == "t" && input[3] == "y" && input[4] == "n" then candidates << [input[1], input[2], "w"] end #["t", x, x, "y", "n"] (w)
      if input[0] == "t" && input[3] == "w" && input[4] == "n" then candidates << [input[1], input[2], "y"] end #["t", x, x, "w", "n"] (y)
      if input[0] == "y" && input[3] == "w" && input[4] == "n" then candidates << [input[1], input[2], "y"] end #["y", x, x, "w", "n"] (y)
      if input[0] == "t" && input[3] == "w" && input[4] == "aa" then candidates << [input[1], input[2], "y"] end #["t", x, x, "w", "aa"] (y)
      if input[0] == "y" && input[3] == "w" && input[4] == "aa" then candidates << [input[1], input[2], "y"] end #["y", x, x, "w", "aa"] (y)
      if input[0] == "aa" && input[3] == "w" && input[4] == "aa" then candidates << [input[1], input[2], "y"] end #["aa", x, x, "w", "aa"] (y)
    end

    if input.length == 6
      # SOLID
      if input[0] == "t" && input[4] == "y" && input[5] == "n" then candidates << [input[1], input[2], input[3]] end #["t", x, x, x, "y", "n"]
      if input[0] == "t" && input[4] == "w" && input[5] == "n" then candidates << [input[1], input[2], input[3]] end #["t", x, x, x, "w", "n"]
      if input[0] == "y" && input[4] == "w" && input[5] == "n" then candidates << [input[1], input[2], input[3]] end #["y", x, x, x, "w", "n"]
      if input[0] == "t" && input[4] == "aa" && input[5] == "n" then candidates << [input[1], input[2], input[3]] end #["t", x, x, x, "aa", "n"]
      if input[0] == "y" && input[4] == "aa" && input[5] == "n" then candidates << [input[1], input[2], input[3]] end #["y", x, x, x, "aa", "n"]
      if input[3] == "t" && input[4] == "m" && input[5] == "aa" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "t", "m", "aa"]
      if input[0] == "t" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], input[2], input[3]] end #["t", x, x, x, "w", "aa"]
      if input[0] == "y" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], input[2], input[3]] end #["y", x, x, x, "w", "aa"]
      if input[0] == "a" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], input[2], input[3]] end #["a", x, x, x, "w", "aa"]
      if input[0] == "aa" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], input[2], input[3]] end #["aa", x, x, x, "w", "aa"]

      # HAMZATED-INITIAL
      if input[0] == "t" && input[1] == "a" && input[4] == "y" && input[5] == "n" then candidates << ["hmz", input[2], input[3]] end #["t", "a", x, x, "y", "n"] (hmz)
      if input[0] == "t" && input[1] == "a" && input[4] == "w" && input[5] == "n" then candidates << ["hmz", input[2], input[3]] end #["t", "a", x, x, "w", "n"] (hmz)
      if input[0] == "y" && input[1] == "a" && input[4] == "w" && input[5] == "n" then candidates << ["hmz", input[2], input[3]] end #["y", "a", x, x, "w", "n"] (hmz)
      if input[0] == "t" && input[1] == "a" && input[4] == "aa" && input[5] == "n" then candidates << ["hmz", input[2], input[3]] end #["t", "a", x, x, "aa", "n"] (hmz)
      if input[0] == "y" && input[1] == "a" && input[4] == "aa" && input[5] == "n" then candidates << ["hmz", input[2], input[3]] end #["y", "a", x, x, "aa", "n"] (hmz)
      if input[0] == "a" && input[3] == "t" && input[4] == "m" && input[5] == "aa" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "t", "m", "a"] (hmz)
      if input[0] == "t" && input[1] == "a" && input[4] == "w" && input[5] == "aa" then candidates << ["hmz", input[2], input[3]] end #["t", "a", x, x, "w", "aa"] (hmz)
      if input[0] == "y" && input[1] == "a" && input[4] == "w" && input[5] == "aa" then candidates << ["hmz", input[2], input[3]] end #["y", "a", x, x, "w", "aa"] (hmz)

      # HAMZATED-MEDIAL
      if input[0] == "t" && input[2] == "a" && input[4] == "y" && input[5] == "n" then candidates << [input[1], "hmz", input[3]] end #["t", x, "a", x, "y", "n"] (hmz)
      if input[0] == "t" && input[2] == "a" && input[4] == "w" && input[5] == "n" then candidates << [input[1], "hmz", input[3]] end #["t", x, "a", x, "w", "n"] (hmz)
      if input[0] == "y" && input[2] == "a" && input[4] == "w" && input[5] == "n" then candidates << [input[1], "hmz", input[3]] end #["y", x, "a", x, "w", "n"] (hmz)
      if input[0] == "t" && input[2] == "a" && input[4] == "aa" && input[5] == "n" then candidates << [input[1], "hmz", input[3]] end #["t", x, "a", x, "aa", "n"] (hmz)
      if input[0] == "y" && input[2] == "a" && input[4] == "aa" && input[5] == "n" then candidates << [input[1], "hmz", input[3]] end #["y", x, "a", x, "aa", "n"] (hmz)
      if input[0] == "t" && input[2] == "a" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], "hmz", input[3]] end #["t", x, "a", x, "w", "aa"] (hmz)
      if input[0] == "y" && input[2] == "a" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], "hmz", input[3]] end #["y", x, "a", x, "w", "aa"] (hmz)
      if input[0] == "aa" && input[2] == "a" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], "hmz", input[3]] end #["aa", x, "a", x, "w", "aa"] (hmz)
      if input[1] == "a" && input[3] == "t" && input[4] == "m" && input[5] == "aa" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x, "t", "m", "aa"] (hmz)

      # HAMZATED-FINAL
      if input[0] == "t" && input[3] == "hy" && input[4] == "y" && input[5] == "n" then candidates << [input[1], input[2], "hmz"] end #["t", x, x, "hy", "y", "n"] (hmz)
      if input[0] == "t" && input[3] == "hw" && input[4] == "w" && input[5] == "n" then candidates << [input[1], input[2], "hmz"] end #["t", x, x, "hw", "w", "n"] (hmz)
      if input[0] == "y" && input[3] == "hw" && input[4] == "w" && input[5] == "n" then candidates << [input[1], input[2], "hmz"] end #["y", x, x, "hw", "w", "n"] (hmz)
      if input[0] == "t" && input[3] == "hw" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], input[2], "hmz"] end #["t", x, x, "hw", "w", "aa"] (hmz)
      if input[0] == "y" && input[3] == "hw" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], input[2], "hmz"] end #["y", x, x, "hw", "w", "aa"] (hmz)
      if input[0] == "aa" && input[3] == "hw" && input[4] == "w" && input[5] == "n" then candidates << [input[1], input[2], "hmz"] end #["aa", x, x, "hw", "w", "n"] (hmz)
      if input[2] == "a" && input[3] == "t" && input[4] == "m" && input[5] == "aa" then candidates << [input[0], input[1], "hmz"] end #[x, x, "a", "t", "m", "aa"] (hmz)

      # HOLLOW-AA
      if input[0] == "t" && input[2] == "aa" && input[4] == "y" && input[5] == "n" then candidates << [input[1], "w", input[3]] end #["t", x, "aa", x, "y", "n"] (w)
      if input[0] == "t" && input[2] == "aa" && input[4] == "w" && input[5] == "n" then candidates << [input[1], "w", input[3]] end #["t", x, "aa", x, "w", "n"] (w)
      if input[0] == "y" && input[2] == "aa" && input[4] == "w" && input[5] == "n" then candidates << [input[1], "w", input[3]] end #["y", x, "aa", x, "w", "n"] (w)
      if input[0] == "t" && input[2] == "aa" && input[4] == "aa" && input[5] == "n" then candidates << [input[1], "w", input[3]] end #["t", x, "aa", x, "aa", "n"] (w)
      if input[0] == "y" && input[2] == "aa" && input[4] == "aa" && input[5] == "n" then candidates << [input[1], "w", input[3]] end #["y", x, "aa", x, "aa", "n"] (w)
      if input[0] == "t" && input[2] == "aa" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], "w", input[3]] end #["t", x, "aa", x, "w", "aa"] (w)
      if input[0] == "y" && input[2] == "aa" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], "w", input[3]] end #["y", x, "aa", x, "w", "aa"] (w)
    end

    if input.length == 7
    end

    if input.length == 8
    end

    if input.length == 9
    end

    if input.length == 10
    end

    return candidates
  end

private
  def self.remove_short_vowels(input)
    input.delete("fa")
    input.delete("da")
    input.delete("ka")
    input.delete("sk")
    input.delete("dd")
    input.delete("in")
    input.delete("an")
    input.delete("on")
  end
end
