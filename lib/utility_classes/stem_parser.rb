class StemParser
  SOLID_LETTERS = %w[b th j H kh d dh r z sh S D DH 3 gh q]
  POROUS_LETTERS = %w[aa t s T f k l m n h w y a i]


  def self.parse_stem(input)
    candidates = []
    parsed_input = ArabicTranslator.arabic_to_english_symbol_array(input)
    remove_short_vowels(parsed_input)

    candidates << self.guess_root(parsed_input)
    candidates.map! { |root| OpenStruct.new(root: root) }
    return candidates
  end

  def self.guess_root(input)
    root = match_formI_pattern(input)
    return root
  end

private
  def self.remove_short_vowels(input)
    input.delete("fa")
    input.delete("da")
    input.delete("ka")
    input.delete("sk")
  end

  def match_formI_pattern(input)
    if input.length == 3 then return input end

    if input.length == 4
      if input[0] == "a" then return [input[1], input[2], input[3]] end #["a", x, x, x]
      if input[0] == "t" then return [input[1], input[2], input[3]] end #["t", x, x, x]
      if input[0] == "y" then return [input[1], input[2], input[3]] end #["y", x, x, x]
      if input[0] == "n" then return [input[1], input[2], input[3]] end #["n", x, x, x]
      if input[1] == "aa" then return [input[0], input[2], input[3]] end #[x, "aa", x, x]
      if input[3] == "t" then return [input[0], input[1], input[2]] end #[x, x, x, "t"]
      if input[3] == "n" then return [input[0], input[1], input[2]] end #[x, x, x, "n"]
      if input[3] == "aa" then return [input[0], input[1], input[2]] end #[x, x, x, "aa"]
    end

    if input.length == 5
      if input[0] == "t" && input[4] == "n" then return [input[1], input[2], input[3]] #["t", x, x, x, "n"]
      if input[0] == "y" && input[4] == "n" then return [input[1], input[2], input[3]] #["y", x, x, x, "n"]
      if input[0] == "t" && input[4] == "y" then return [input[1], input[2], input[3]] #["t", x, x, x, "y"]
      if input[0] == "t" && input[4] == "aa" then return [input[1], input[2], input[3]] #["t", x, x, x, "aa"]
      if input[0] == "y" && input[4] == "aa" then return [input[1], input[2], input[3]] #["y", x, x, x, "aa"]
      if input[0] == "a" && input[4] == "y" then return [input[1], input[2], input[3]] #["a", x, x, x, "y"]
      if input[0] == "a" && input[4] == "n" then return [input[1], input[2], input[3]] #["a", x, x, x, "n"]
      if input[0] == "a" && input[4] == "aa" then return [input[1], input[2], input[3]] #["a", x, x, x, "aa"]
      if input[0] == "i" && input[4] == "y" then return [input[1], input[2], input[3]] #["i", x, x, x, "y"]
      if input[0] == "i" && input[4] == "n" then return [input[1], input[2], input[3]] #["i", x, x, x, "n"]
      if input[0] == "i" && input[4] == "aa" then return [input[1], input[2], input[3]] #["i", x, x, x, "aa"]
      if input[3] == "n" && input[4] == "aa" then return [input[0], input[1], input[2]] #[x, x, x, "n", "aa"]
      if input[3] == "t" && input[4] == "m" then return [input[0], input[1], input[2]] #[x, x, x, "t", "m"]
      if input[3] == "t" && input[4] == "n" then return [input[0], input[1], input[2]] #[x, x, x, "t", "n"]
      if input[3] == "w" && input[4] == "aa" then return [input[0], input[1], input[2]] #[x, x, x, "w", "aa"]
      if input[3] == "t" && input[4] == "aa" then return [input[0], input[1], input[2]] #[x, x, x, "t", "aa"]
      if input[0] == "m" && input[3] == "w" then return [input[1], input[2], input[4]] #["m", x, x, "w", x]
    end

    if input.length == 6
      ["t", x, x, x, "y", "n"],
      ["t", x, x, x, "w", "n"],
      ["y", x, x, x, "w", "n"],
      ["t", x, x, x, "aa", "n"],
      ["y", x, x, x, "aa", "n"],
      [x, x, x, "t", "m", "aa"],
      ["t", x, x, x, "w", "aa"],
      ["y", x, x, x, "w", "aa"],
      ["a", x, x, x, "w", "aa"],
      ["i", x, x, x, "w", "aa"],
    end

    if input.length == 7
    end

    if input.length == 8
    end

    if input.length == 9
    end

    if input.length == 10
    end

  end

end
