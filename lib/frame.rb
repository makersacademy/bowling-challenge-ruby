class Frame
  attr_reader :rolls
  attr_accessor :total

  def initialize
    @rolls = []
    @total = nil
  end
end
