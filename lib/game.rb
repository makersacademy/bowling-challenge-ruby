class Game
  def initialize
    @total_pinfall = 0
  end

  def bowl(pinfall)
    @total_pinfall += pinfall
  end
end
