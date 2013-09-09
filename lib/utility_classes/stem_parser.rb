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

    if input.length == 3
      # ASSIMILATED
      if input[0] == "a" then candidates << ["w", input[1], input[2]] end #["a", x, x] (w)
      if input[0] == "t" then candidates << ["w", input[1], input[2]] end #["t", x, x] (w)
      if input[0] == "y" then candidates << ["w", input[1], input[2]] end #["y", x, x] (w)
      if input[0] == "n" then candidates << ["w", input[1], input[2]] end #["n", x, x] (w)

      # SOLID
      candidates << input
    end

    if input.length == 4
      # SOLID
      if input[0] == "a" then candidates << [input[1], input[2], input[3]] end #["a", x, x, x]
      if input[0] == "i" then candidates << [input[1], input[2], input[3]] end #["i", x, x, x]
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
      if input[0] == "i" && input[4] == "y" then candidates << [input[1], input[2], input[3]] end #["i", x, x, x, "y"]
      if input[0] == "i" && input[4] == "n" then candidates << [input[1], input[2], input[3]] end #["i", x, x, x, "n"]
      if input[0] == "i" && input[4] == "aa" then candidates << [input[1], input[2], input[3]] end #["i", x, x, x, "aa"]
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
      if input[0] == "i" && input[4] == "w" && input[5] == "aa" then candidates << [input[1], input[2], input[3]] end #["i", x, x, x, "w", "aa"]
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
