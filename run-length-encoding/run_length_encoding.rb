class RunLengthEncoding
  class << self
    def encode(data)
      code, current, count = "", "", -1
      data.chars.each { |chr|
        if chr == current
          count += 1
        else
          count += 1
          code << count.to_s if count > 1
          code << current
          count = 0
        end
        current = chr
      }
      count += 1
      code << count.to_s if count > 1
      code << current
      code
    end
    def decode(code)
      count = 1
      data = ""
      code.chars.each { |chr|
        if chr.index(/[0-9]/)
          if count.is_a?(String)
            count << chr
          else
            count = chr
          end
        else
          count.to_i.times{data << chr}
          count = 1
        end
      }
      data
    end
  end
end

module BookKeeping
  VERSION = 3
end
