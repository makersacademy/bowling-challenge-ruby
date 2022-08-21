class Frame
  attr_accessor :rolls, :bonus_rolls, :bonus_points

  def initialize(io = Kernel)
    @io = io
    @rolls = []
    @bonus_rolls = 0
    @bonus_points = 0
  end

  def format_roll
    rolls.map.with_index do |roll, idx|
      roll = '/' if idx == 1 && rolls.sum == 10
      roll = 'X' if roll == 10
      roll.to_s
    end.join(' ')
  end

  def pinfall_check(frames_length)
    loop do
      value = @io.gets.to_i
      max_value = max_value_check(frames_length)
      unless value > max_value
        rolls << value
        return value
      end
      @io.puts "Please enter a value of #{max_value} or less"
    end
  end

  def add_bonus_points(pinfall)
    return unless bonus_rolls.positive?

    @bonus_rolls -= 1
    @bonus_points += pinfall
  end

  private

  def max_value_check(frames_length)
    if frames_length == 9 && rolls[0] == 10
      return 10 if rolls.sum == 20

      return 10 - rolls[1, 2].sum
    end
    10 - rolls.sum
  end
end
