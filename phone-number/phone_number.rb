class PhoneNumber
  NANP = Regexp.compile(/\A1?([2-9][[:digit:]]{2}[2-9][[:digit:]]{6})\Z/)
  class << self
    def clean(str)
      NANP.match(str.gsub(/[^[[:digit:]]]/,"")) ? $~[1] : $~
    end
  end
end

module BookKeeping
  VERSION = 2
end
