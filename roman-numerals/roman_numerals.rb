class Integer
  @@NUMERALS = {1=>"I",4=>"IV",5=>"V",9=>"IX",10=>"X",40=>"XL",50=>"L",90=>"XC",100=>"C",400=>"CD",500=>"D",900=>"CM",1000=>"M"}
  def to_roman
    i, n = self,""
    @@NUMERALS.sort.reverse.to_h.each_pair{|k,v| if i >= k then (i -= k) && (n << v) && break end} while i > 0
    n
  end
end

module BookKeeping
  VERSION = 2
end
