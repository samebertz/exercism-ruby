class Series
  def initialize(str)
    @str = str
  end
  def slices(n)
    raise ArgumentError if n > @str.size
    i=-1
    @str[0..-n].chars.map.reduce([]){|m,o| m << @str[(i+=1)...i+n]}
  end
end
