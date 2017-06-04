class Pangram
  CHARSET_EN_LOWERCASE = (97..122).to_a.map{|i| i.chr}
  def self.pangram?(phrase, alphabet: CHARSET_EN_LOWERCASE)
    (alphabet - phrase.downcase.chars).empty?
  end
end

module BookKeeping
  VERSION = 4
end
