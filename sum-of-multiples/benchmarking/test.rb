module Test
  class Multiples
    @@approaches = {}
    attr_reader :factors, :multiples
    def initialize(*factors)
      @factors = factors.sort
      @multiples = []
      @i = 0
    end
    def to(n)
      while @i * @factors[0] < n
        @factors.each { |e| @multiples << e * @i }
        @i += 1
      end
      @multiples & [*(0...n)]
    end
    def sum_to(n)
      to(n).reduce(0,:+)
    end
    def sum_to_with_approach(n, approach)
      to = instance_exec(n, &@@approaches[approach])
      to.reduce(0,:+)
    end
    class << self
      def approaches
        @@approaches
      end
      def add_approach(name, &block)
        @@approaches[name] = block
      end
      def clear_approaches
        @@approaches.clear
      end
    end
  end

  APPROACHES = {
    naive: ->(n) {
      i = 1
      while i * @factors[0] < n
        @factors.each { |e| @multiples << e * i }
        i += 1
      end
      @multiples & [*(0...n)]
    },
    cached: ->(n) {
      while @i * @factors[0] < n
        @factors.each { |e| @multiples << e * @i }
        @i += 1
      end
      @multiples & [*(0...n)]
    }
  }
  def register_approaches
    APPROACHES.each_pair { |k,v|
      Multiples.add_approach(k, &v)
    }
  end
end
