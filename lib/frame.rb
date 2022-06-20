class Frame
  attr_reader :is_strike, :is_spare, :num_spares

  def initialize
    @is_strike = false
    @is_spare = false
    @num_spares = 0
  end
end
