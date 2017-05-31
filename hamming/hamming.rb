class Hamming
  def self.compute(a, b)
    throw ArgumentError if a.size != b.size
    a = a.codepoints
    b = b.codepoints
    i,h = -1,0
    while (i += 1) < a.size
      puts "#{a[i]-b[i] == 0}"
      h += a[i] - b[i] == 0 ? 0 : 1
    end
    h
  end
end

module BookKeeping
  VERSION = 3
end
