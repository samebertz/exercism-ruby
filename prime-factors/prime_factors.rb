class Prime
  @@p = [2]
  @@c = 1
  def self.nth(n)
    @@p[0..Math.sqrt(@@c+=2)].any?{|p|@@c%p==0} ? next : @@p<<@@c while @@p.length<n
    @@p[n-1]
  end
end

class PrimeFactors
  class << self
    def for(n)
      factors = []
      prime = 1
      while n > 1 do
        prime_factor = Prime.nth(prime)
        factor = n % prime_factor
        if factor == 0
          factors << prime_factor
          n = n / prime_factor
        else
          prime += 1
        end
      end
      factors
    end
  end
end
