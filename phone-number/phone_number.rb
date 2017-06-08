class PhoneNumber
  class << self
    def clean(str)
      str.gsub!(/[^[[:digit:]]]/,"")
      if (str.size == 10
            || str.size == 11 && str.start_with?("1") && str = str[1..-1])
          && (2..9).include?(str[0].to_i)
          && (2..9).include?(str[3].to_i)
        str
      else
        nil
      end
    end
  end
end

module BookKeeping
  VERSION = 2
end
