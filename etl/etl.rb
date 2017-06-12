class ETL
  class << self
    def transform(legacy)
      legacy.each_pair.reduce({}) do |memo, (score, letter)|
        memo.default_proc = ->(h,k) {h[k.downcase] = score}
        memo.values_at(*letter)
        memo
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
