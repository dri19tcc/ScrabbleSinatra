class Scoring
  SCORE_CHART = {
    "a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1, "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1,
    "d" => 2, "g" => 2,
    "b" => 3, "c" => 3, "m" => 3, "p" => 3,
    "f" => 4, "h" => 4, "v" => 4, "w" => 4, "y" => 4,
    "k" => 5,
    "j" => 8, "x" => 8,
    "q" => 10, "z" => 10
  }

  def self.score(word)
    arr = word.downcase.split(//)
    arr.length == 7 ? tally = 50 : tally = 0
    hash = {:total_score => 0, :full_word => word, :letters => []}
    #:letters ex. => [{h => 4, e => 1, l => 1, l => 1, o => 1}]
    arr.each do |i|
      value = SCORE_CHART[i]
      tally = value + tally
      hash[:letters] << {i => value}
      # {"h" => 4}
    end
    hash[:total_score] = tally
    return hash
    # return tally
  end

  def self.highest_score_from(array_of_words)
    high_word = ""
    high_score = 0
    array_of_words.each do |word|
      self.score(word)
      if self.score(word) > high_score
        high_word = word
        high_score = self.score(word)
      elsif self.score(word) == high_score
        if word.length < high_word.length
          high_word = word
          high_score = self.score(word)
        end
      end
    end
    return high_word
  end
end
