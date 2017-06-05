class RunLengthEncoding
  class << self
    def encode(data)
      count = data.chars.reduce([[]]) do |memo, obj|
        if obj == memo[-1][0]
          memo[-1][1] += 1
        else
          memo << [obj, 1]
        end
        memo
      end[1..-1]
      count.reduce("") do |memo, obj|
        memo << obj[0].prepend(obj[1] == 1 ? "" : obj[1].to_s)
      end
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
