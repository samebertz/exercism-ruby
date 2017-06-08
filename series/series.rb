class Series
  def initialize(str)
    @str = str
  end
  def slices(n)
    raise ArgumentError if n > @str.size
    @str[0..-n].chars.each.with_index.reduce([]){|m, (o, i)|m<<@str[i...i+n]}
  end
end
