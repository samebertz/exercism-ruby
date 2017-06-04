class Prime
  @@p = [2]
  @@c = 1
  def self.nth(n)
    raise ArgumentError if n < 1
    @@p[0..Math.sqrt(@@c+=2)].any?{|p|@@c%p==0} ? next : @@p<<@@c while @@p.length<n
    @@p[n-1]
  end
end

module BookKeeping
  VERSION = 1
end
