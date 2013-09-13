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
      candidates << input                               #[x, x, x] - SOLID

      %w[a t y n].each do |letter|
        if input[0] == letter
          candidates << ["w", input[1], input[2]]       #["t", x, x] (w) - ASSIMILATED
          candidates << [input[1], "w", input[2]]       #["t", x, x] (w) - HOLLOW
          candidates << [input[1], "y", input[2]]       #["t", x, x] (y) - HOLLOW
          candidates << [input[1], input[2], input[2]]  #["t", x, x] (dd) - DOUBLED
          candidates << [input[1], input[2], "w"]       #["t", x, x] (w) - DEFECTIVE
          candidates << [input[1], input[2], "y"]       #["t", x, x] (y) - DEFECTIVE
        end
      end
      if input[0] == "a" then candidates << ["hmz", input[1], input[2]] end    #["a", x, x] (hmz) - HAMZATED-INITIAL

      if input[0] == "amd" then candidates << ["hmz", input[1], input[2]] end  #["amd", x, x] (hmz) - HAMZATED-INITIAL
      if input[0] == "aa"
        candidates << [input[1], input[2], "w"]       #["a", x, x] (w) - DEFECTIVE
        candidates << [input[1], input[2], "y"]       #["a", x, x] (y) - DEFECTIVE
      end

      if input[1] == "a" then candidates << [input[0], "hmz", input[2]] end   #[x, "a", x] (hmz) - HAMZATED-MEDIAL

      if input[1] == "aa"
        candidates << [input[0], "w", input[2]]       #[x, "aa", x] (w) - HOLLOW
        candidates << [input[0], "y", input[2]]       #[x, "aa", x] (y) - HOLLOW
        candidates << [input[0], input[2], "w"]       #[x, "aa", x] (w) - DEFECTIVE
        candidates << [input[0], input[2], "y"]       #[x, "aa", x] (y) - DEFECTIVE
      end

      if input[2] == "y"
        candidates << ["w", input[0], input[1]]       #[x, x, "y"] (w) - ASSIMILATED
        candidates << ["hmz", input[0], input[1]]     #[x, x, "y"] (hmz) - HAMZATED-INITIAL
        candidates << [input[0], input[1], input[1]]  #[x, x, "y"] (dd) - DOUBLED
      end

      if input[2] == "aa"
        candidates << ["w", input[0], input[1]]       #[x, x, "aa"] (w) - ASSIMILATED
        candidates << ["hmz", input[0], input[1]]     #[x, x, "aa"] (hmz) - HAMZATED-INITIAL
        candidates << [input[0], input[1], input[1]]  #[x, x, "aa"] (dd) - DOUBLED
        candidates << [input[0], input[1], "w"]       #[x, x, "aa"] (w) - DEFECTIVE
        candidates << [input[0], input[1], "y"]       #[x, x, "aa"] (y) - DEFECTIVE
      end

      if input[2] == "n"
        candidates << ["w", input[0], input[1]]       #[x, x, "n"] (w) - ASSIMILATED
        candidates << ["hmz", input[0], input[1]]     #[x, x, "n"] (hmz) - HAMZATED-INITIAL
        candidates << [input[0], "w", input[1]]       #[x, x, "n"] (w) - HOLLOW
        candidates << [input[0], "y", input[1]]       #[x, x, "n"] (y) - HOLLOW
      end

      if input[2] == "a"
        candidates << [input[0], input[1], "hmz"]     #[x, x, "a"] (hmz) - HAMZATED-FINAL
      end

      if input[2] == "amd"
        candidates << [input[0], input[1], "hmz"]     #[x, x, "amd"] (hmz) - HAMZATED-FINAL
      end

      if input[2] == "t"
        candidates << [input[0], "w", input[1]]       #[x, x, "t"] (w) - HOLLOW
        candidates << [input[0], "y", input[1]]       #[x, x, "t"] (y) - HOLLOW
        candidates << [input[0], input[1], input[1]]  #[x, x, "t"] (dd) - DOUBLED
        candidates << [input[0], input[1], "w"]       #[x, x, "t"] (w) - DEFECTIVE
        candidates << [input[0], input[1], "y"]       #[x, x, "t"] (y) - DEFECTIVE
      end

      if input[2] == "amq"
        candidates << [input[0], input[1], "y"]       #[x, x, "amq"] (y) - DEFECTIVE
      end
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
      if input[0] == "aa" && input[3] == "a" then candidates << [input[1], input[2], "hmz"] end #["aa", x, x, "a"] (hmz)
      if input[0] == "aa" && input[3] == "amd" then candidates << [input[1], input[2], "hmz"] end #["aa", x, x, "amd"] (hmz)
      if input[2] == "a" && input[3] == "t" then candidates << [input[0], input[1], "hmz"] end #[x, x, "a", "t"] (hmz)
      if input[2] == "a" && input[3] == "n" then candidates << [input[0], input[1], "hmz"] end #[x, x, "a", "n"] (hmz)
      if input[1] == "aa" && input[3] == "hy" then candidates << [input[0], input[2], "hmz"] end #[x, "aa", x, "hy"] (hmz)

      # HOLLOW
      if input[0] == "t" && input[3] == "n" then candidates << [input[1], "w", input[2]] end #["t", x, x, "n"] (w)
      if input[0] == "t" && input[3] == "n" then candidates << [input[1], "y", input[2]] end #["t", x, x, "n"] (y)
      if input[0] == "y" && input[3] == "n" then candidates << [input[1], "w", input[2]] end #["y", x, x, "n"] (w)
      if input[0] == "y" && input[3] == "n" then candidates << [input[1], "y", input[2]] end #["y", x, x, "n"] (y)
      if input[1] == "w" && input[3] == "y" then candidates << [input[0], "w", input[2]] end #[x, "w", x, "y"] (w)
      if input[1] == "y" && input[3] == "y" then candidates << [input[0], "y", input[2]] end #[x, "y", x, "y"] (y)
      if input[1] == "aa" && input[3] == "t" then candidates << [input[0], "w", input[2]] end #[x, "aa", x, "t"] (w)
      if input[1] == "aa" && input[3] == "t" then candidates << [input[0], "y", input[2]] end #[x, "aa", x, "t"] (y)
      if input[2] == "n" && input[3] == "aa" then candidates << [input[0], "w", input[1]] end #[x, x, "n", "aa"] (w)
      if input[2] == "n" && input[3] == "aa" then candidates << [input[0], "y", input[1]] end #[x, x, "n", "aa"] (y)
      if input[2] == "t" && input[3] == "m" then candidates << [input[0], "w", input[1]] end #[x, x, "t", "m"] (w)
      if input[2] == "t" && input[3] == "m" then candidates << [input[0], "y", input[1]] end #[x, x, "t", "m"] (y)
      if input[2] == "t" && input[3] == "n" then candidates << [input[0], "w", input[1]] end #[x, x, "t", "n"] (w)
      if input[2] == "t" && input[3] == "n" then candidates << [input[0], "y", input[1]] end #[x, x, "t", "n"] (y)
      if input[1] == "aa" && input[3] == "aa" then candidates << [input[0], "w", input[2]] end #[x, "aa", x, "aa"] (w)
      if input[1] == "aa" && input[3] == "aa" then candidates << [input[0], "y", input[2]] end #[x, "aa", x, "aa"] (y)
      if input[1] == "aa" && input[2] == "hy" then candidates << [input[0], "w", input[3]] end #[x, "aa", "hy", x] (w)
      if input[1] == "aa" && input[2] == "hy" then candidates << [input[0], "y", input[3]] end #[x, "aa", "hy", x] (y)

      # HOLLOW-AA
      if input[0] == "a" && input[2] == "aa" then candidates << [input[1], "w", input[3]] end #["a", x, "aa", x] (w)
      if input[0] == "t" && input[2] == "aa" then candidates << [input[1], "w", input[3]] end #["t", x, "aa", x] (w)
      if input[0] == "y" && input[2] == "aa" then candidates << [input[1], "w", input[3]] end #["y", x, "aa", x] (w)
      if input[0] == "n" && input[2] == "aa" then candidates << [input[1], "w", input[3]] end #["n", x, "aa", x] (w)
      if input[1] == "aa" && input[3] == "y" then candidates << [input[0], "w", input[2]] end #[x, "aa", x, "y"] (w)
      if input[0] == "m" && input[2] == "aa" then candidates << [input[1], "w", input[3]] end #["m", x, "aa", x] (w)

      # DOUBLED
      if input[0] == "t" && input[3] == "y" then candidates << [input[1], input[2], input[2]] end #["t", x, x, "y"] (dd)
      if input[0] == "t" && input[3] == "aa" then candidates << [input[1], input[2], input[2]] end #["t", x, x, "aa"] (dd)
      if input[0] == "y" && input[3] == "aa" then candidates << [input[1], input[2], input[2]] end #["y", x, x, "aa"] (dd)
      if input[2] == "w" && input[3] == "aa" then candidates << [input[0], input[1], input[1]] end #[x, x, "w", "aa"] (dd)
      if input[2] == "t" && input[3] == "aa" then candidates << [input[0], input[1], input[1]] end #[x, x, "t", "aa"] (dd)

      # DEFECTIVE
      if input[0] == "t" && input[3] == "y" then candidates << [input[1], input[2], "w"] end #["t", x, x, "y"] (w)
      if input[0] == "aa" && input[3] == "y" then candidates << [input[1], input[2], "w"] end #["aa", x, x, "y"] (w)
      if input[2] == "t" && input[3] == "aa" then candidates << [input[0], input[1], "w"] end #[x, x, "t", "aa"] (w)
      if input[2] == "w" && input[3] == "aa" then candidates << [input[0], input[1], "y"] end #[x, x, "w", "aa"] (y)
      if input[2] == "t" && input[3] == "aa" then candidates << [input[0], input[1], "y"] end #[x, x, "t", "aa"] (y)
      if input[3] == "amq" then candidates << [input[1], input[2], "y"] end #["?", x, x, "amq"]

      # GENERAL
      if input[0] == "m" then candidates << [input[1], input[2], input[3]] end #["m", x, x, x]
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
