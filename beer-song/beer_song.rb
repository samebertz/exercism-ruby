class BeerSong
  GENERIC_VERSE = <<-TEXT
%1$d bottles of beer on the wall, %1$d bottles of beer.
Take one down and pass it around, %2$d bottles of beer on the wall.
TEXT
  VERSE_2 = <<-TEXT
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
TEXT
  VERSE_1 = <<-TEXT
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
TEXT
  LAST_VERSE = <<-TEXT
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
TEXT

  def verse(n)
    raise ArgumentError if n > 99 || n < 0
    if n > 2
      return GENERIC_VERSE % [n, n-1]
    elsif n == 2
      return VERSE_2
    elsif n == 1
      return VERSE_1
    else
      return LAST_VERSE
    end
  end

  def verses(m, n)
    raise ArgumentError if m > 99 || m < 0 || n > 99 || n < 0 || n >= m
    (n..m).to_a.reverse.map { |e|
      self.verse(e)
    }.join("\n")
  end
end

module BookKeeping
  VERSION = 3
end
