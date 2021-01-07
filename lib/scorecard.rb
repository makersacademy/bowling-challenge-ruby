class ScoreCard
  attr_reader :knocked_down_pins
  def run
    puts "Enter the number of knocked down pins:"
    @knocked_down_pins = gets
  end
end
