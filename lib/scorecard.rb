class ScoreCard
  DEFAULT_FRAMES = 10

  attr_reader :frames, :first_roll, :second_roll

  def initialize(frames = DEFAULT_FRAMES)
    @frames = frames
  end

  def run
    puts "Enter the number of knocked down pins:"
    @first_roll = gets
    unless @first_roll == 10
      puts "Enter the number of knocked down pins:"
      @second_roll = gets
    end
  end
end
