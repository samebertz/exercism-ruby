class Phrase
  attr_accessor :word_count
  def initialize(s)
    @word_count=s.downcase.scan(/([[:alnum:]]+('[[:alnum:]]+)?)/).tap{|a|a.map{|e|e[1]=a.transpose[0].count(e[0])}}.to_h
  end
end

module BookKeeping
  VERSION = 1
end
