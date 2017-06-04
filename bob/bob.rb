class Bob
  @@RESPONSES = {
    blank: "Fine. Be that way!",
    yell: "Whoa, chill out!",
    question: "Sure.",
    default: "Whatever."
  }
  class << self
    def hey(str)
      return @@RESPONSES[:blank] if str.strip.empty?
      str.gsub!(/[^\Wa-zA-Z]/,'')
      return @@RESPONSES[:yell] if str.index(/[a-zA-Z]/) && str.upcase == str
      return @@RESPONSES[:question] if str.end_with?("?")
      @@RESPONSES[:default]
    end
  end
end
