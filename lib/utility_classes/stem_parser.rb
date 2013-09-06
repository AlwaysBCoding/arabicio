class StemParser
  SOLID_LETTERS = %w[b th j H kh d dh r z sh S D DH 3 gh q]
  POROUS_LETTERS = %w[aa t s T f k l m n h w y a i]

  FORMI_PATTERNS = [
    ["a", x, x, x],
    ["t", x, x, x],
    ["t", x, x, x, "y", "n"],
    ["y", x, x, x],
    ["n", x, x, x],
    ["t", x, x, x, "w", "n"],
    ["t", x, x, x, "n"],
    ["y", x, x, x, "w", "n"],
    ["y", x, x, x, "n"],
    ["t", x, x, x, "aa", "n"],
    ["y", x, x, x, "aa", "n"],
    [x, x, x, "t"],
    [x, x, x],
    [x, x, x, "n", "aa"],
    [x, x, x, "t", "m"],
    [x, x, x, "t", "n"],
    [x, x, x, "w", "aa"],
    [x, x, x, "n"],
    [x, x, x, "t", "m", "aa"],
    [x, x, x, "aa"],
    [x, x, x, "t", "aa"],
    ["t", x, x, x, "y"],
    ["t", x, x, x, "w", "aa"],
    ["y", x, x, x, "w", "aa"],
    ["t", x, x, x, "aa"],
    ["y", x, x, x, "aa"],
    ["a", x, x, x, "y"],
    ["a", x, x, x, "w", "aa"],
    ["a", x, x, x, "n"],
    ["a", x, x, x, "aa"],
    ["i", x, x, x, "y"],
    ["i", x, x, x, "w", "aa"],
    ["i", x, x, x, "n"],
    ["i", x, x, x, "aa"],
    [x, "aa", x, x],
    ["m", x, x, "w", x]
  ]

	def self.parse_stem(input)
    candidates = []
    parsed_input = ArabicTranslator.arabic_to_english_symbol_array(input)
    remove_short_vowels(parsed_input)

    candidates << self.guess_root(parsed_input)
    candidates.map! { |root| OpenStruct.new(root: root) }
    return candidates
  end

  def self.guess_root(input)
    input
  end

private
  def self.remove_short_vowels(input)
    input.delete("fa")
    input.delete("da")
    input.delete("ka")
    input.delete("sk")
  end

end
