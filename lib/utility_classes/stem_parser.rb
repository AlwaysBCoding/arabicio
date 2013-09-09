class StemParser
  SOLID_LETTERS = %w[b th j H kh d dh r z sh S D DH 3 gh q]
  POROUS_LETTERS = %w[aa t s T f k l m n h w y a i]


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
      # ASSIMILATED
      candidates << ['w', input[0], input[1]] # [x, x] (w)

      # HAMZATED-INITIAL
      candidates << ["hmz", input[0], input[1]] # [x, x] (hmz)
    end

    if input.length == 3
      # ASSIMILATED
      if input[0] == "a" then candidates << ["w", input[1], input[2]] end #["a", x, x] (w)
      if input[0] == "t" then candidates << ["w", input[1], input[2]] end #["t", x, x] (w)
      if input[0] == "y" then candidates << ["w", input[1], input[2]] end #["y", x, x] (w)
      if input[0] == "n" then candidates << ["w", input[1], input[2]] end #["n", x, x] (w)
      if input[0] == "n" then candidates << ["w", input[1], input[2]] end #["n", x, x] (w)
      if input[2] == "y" then candidates << ["w", input[0], input[1]] end #[x, x, "y"] (w)
      if input[2] == "aa" then candidates << ["w", input[0], input[1]] end #[x, x, "aa"] (w)
      if input[2] == "n" then candidates << ["w", input[0], input[1]] end #[x, x, "n"] (w)

      # HAMZATED-INITIAL
      if input[0] == "amd" then candidates << ["hmz", input[1], input[2]] end #["amd", x, x] (hmz)
      if input[0] == "a" then candidates << ["hmz", input[1], input[2]] end #["a", x, x] (hmz)
      if input[2] == "y" then candidates << ["hmz", input[0], input[1]] end #[x, x, "y"] (hmz)
      if input[2] == "aa" then candidates << ["hmz", input[0], input[1]] end #[x, x, "aa"] (hmz)
      if input[2] == "n" then candidates << ["hmz", input[0], input[1]] end #[x, x, "n"] (hmz)

      # HAMZATED-MEDIAL
      if input[1] == "a" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x] (hmz)

      # SOLID
      candidates << input
    end

    if input.length == 4
      # SOLID
      if input[0] == "a" then candidates << [input[1], input[2], input[3]] end #["a", x, x, x]
      if input[0] == "aa" then candidates << [input[1], input[2], input[3]] end #["aa", x, x, x]
      if input[0] == "t" then candidates << [input[1], input[2], input[3]] end #["t", x, x, x]
      if input[0] == "y" then candidates << [input[1], input[2], input[3]] end #["y", x, x, x]
      if input[0] == "n" then candidates << [input[1], input[2], input[3]] end #["n", x, x, x]
      if input[1] == "aa" then candidates << [input[0], input[2], input[3]] end #[x, "aa", x, x]
      if input[3] == "t" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "t"]
      if input[3] == "n" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "n"]
      if input[3] == "aa" then candidates << [input[0], input[1], input[2]] end #[x, x, x, "aa"]

      # ASSIMILATED
      if input[0] == "t" && input[3] == "n" then candidates << ["w", input[1], input[2]] end #["t", x, x, "n"] (w)
      if input[0] == "y" && input[3] == "n" then candidates << ["w", input[1], input[2]] end #["y", x, x, "n"] (w)
      if input[0] == "t" && input[3] == "y" then candidates << ["w", input[1], input[2]] end #["t", x, x, "y"] (w)
      if input[0] == "t" && input[3] == "aa" then candidates << ["w", input[1], input[2]] end #["t", x, x, "aa"] (w)
      if input[0] == "y" && input[3] == "aa" then candidates << ["w", input[1], input[2]] end #["y", x, x, "aa"] (w)
      if input[2] == "w" && input[3] == "aa" then candidates << ["w", input[0], input[1]] end #[x, x, "w", "aa"] (w)

      # HAMZATED-INITIAL
      if input[0] == "t" && input[1] == "a" then candidates << ["hmz", input[2], input[3]] end #["t", "a", x, x] (hmz)
      if input[0] == "y" && input[1] == "a" then candidates << ["hmz", input[2], input[3]] end #["y", "a", x, x] (hmz)
      if input[0] == "n" && input[1] == "a" then candidates << ["hmz", input[2], input[3]] end #["n", "a", x, x] (hmz)
      if input[0] == "a" && input[3] == "t" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "t"] (hmz)
      if input[0] == "a" && input[3] == "n" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "n"] (hmz)
      if input[0] == "a" && input[3] == "aa" then candidates << ["hmz", input[1], input[2]] end #["a", x, x, "aa"] (hmz)
      if input[2] == "w" && input[3] == "aa" then candidates << ["hmz", input[0], input[1]] end #[x, x, "w", "aa"] (hmz)

      # HAMZATED-MEDIAL
      if input[0] == "a" && input[2] == "a" then candidates << [input[1], "hmz", input[3]] end #["a", x, "a", x] (hmz)
      if input[0] == "t" && input[2] == "a" then candidates << [input[1], "hmz", input[3]] end #["t", x, "a", x] (hmz)
      if input[0] == "y" && input[2] == "a" then candidates << [input[1], "hmz", input[3]] end #["y", x, "a", x] (hmz)
      if input[0] == "n" && input[2] == "a" then candidates << [input[1], "hmz", input[3]] end #["n", x, "a", x] (hmz)
      if input[0] == "aa" && input[2] == "a" then candidates << [input[1], "hmz", input[3]] end #["aa", x, "a", x] (hmz)
      if input[1] == "a" && input[3] == "t" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x, "t"] (hmz)
      if input[1] == "a" && input[3] == "n" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x, "n"] (hmz)
      if input[1] == "a" && input[3] == "aa" then candidates << [input[0], "hmz", input[2]] end #[x, "a", x, "aa"] (hmz)
      if input[1] == "aa" && input[2] == "hy" then candidates << [input[0], "hmz", input[3]] end #[x, "aa", "hy", x] (hmz)

      # HAMZATED-FINAL
      if input[0] == "a" && input[3] == "a" then candidates << [input[1], input[2], "hmz"] end #["a", x, x, "a"] (hmz)
      if input[0] == "t" && input[3] == "a" then candidates << [input[1], input[2], "hmz"] end #["t", x, x, "a"] (hmz)
      if input[0] == "y" && input[3] == "a" then candidates << [input[1], input[2], "hmz"] end #["y", x, x, "a"] (hmz)
      if input[0] == "n" && input[3] == "a" then candidates << [input[1], input[2], "hmz"] end #["n", x, x, "a"] (hmz)
      if input[0] == "t" && input[3] == "amd" then candidates << [input[1], input[2], "hmz"] end #["t", x, x, "amd"] (hmz)
      if input[0] == "y" && input[3] == "amd" then candidates << [input[1], input[2], "hmz"] end #["y", x, x, "amd"] (hmz)
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
  end
end
