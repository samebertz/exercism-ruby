class Hamming
  def self.compute(a, b)
    throw ArgumentError if a.size != b.size
    a.codepoints.zip(b.codepoints,Array.new(a.size).fill("X")).count{|c| c.uniq == c}
  end
end

module BookKeeping
  VERSION = 3
end
