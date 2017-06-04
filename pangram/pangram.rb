class Pangram
  ALPHABET = (97..122).to_a.reduce(""){|s,i| s<<i}
  def self.pangram?(phrase)
    (ALPHABET.split("") - phrase.downcase.split("")).empty?
  end
end

module BookKeeping
  VERSION = 4
end
