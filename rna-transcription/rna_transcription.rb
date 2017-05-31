class Complement
  PAIRS = {"A"=>"U","C"=>"G","T"=>"A","G"=>"C"}
  def self.of_dna(dna)
    return dna.match(/[^ACTG]/) ? "" : dna.split("").collect{|c| PAIRS[c]}.join("")
  end
end

module BookKeeping
  VERSION = 4
end
