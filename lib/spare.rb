class Spare

  attr_reader :consecutive_spares

  def initialize
    @consecutive_spares = 0
  end

  def first(frame)
    @consecutive_spares += 1
  end

end
