class ETL
  class << self
    def transform(legacy)
      legacy.each_pair.reduce({}) do |memo, (k,v)|
        v.each do |e|
          memo[e.downcase] = k
        end
        memo
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
