class Frame
    attr_reader :contents
  
    def initialize
      @contents = []
    end
  
    def raw_score
      @contents.sum
    end
  
    def record_roll(roll)
      @contents << roll
    end
  
    def rolls
      @contents.length
    end
  
    def spare?
      if (@contents.sum == 10) && (@contents.length == 2)
        true
      else
        false
      end
    end
  
    def strike?
      if (@contents.sum == 10) && (@contents.length == 1)
        true
      else
        false
      end
    end
  end