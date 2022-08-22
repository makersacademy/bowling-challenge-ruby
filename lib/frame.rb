class Frame
  attr_accessor :rolls, :bonus_rolls, :bonus_points

  def initialize(io = Kernel)
    @io = io
    @rolls = []
    @bonus_rolls = 0
    @bonus_points = 0
  end

  def format_roll
    # formats the roll to be written as a score, eg. 5 5 => "5 /"
    rolls.map.with_index do |roll, idx|
      roll = '/' if idx == 1 && rolls.sum == 10
      roll = 'X' if roll == 10
      roll.to_s
    end.join(' ')
  end

  def pinfall_check(frames_length)
    # frames_length is an integer of how many frames have been played already
    # checks whether input is more than the reminaing number of pins at play
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
    # pinfall is an integer
    # adds bonus points to rolls that have spares or strikes
    @bonus_rolls -= 1
    @bonus_points += pinfall
  end

  private

  def max_value_check(frames_length)
    # frames_length is an integer of how many frames have been played already
    # calculates the max value pinfall for the current roll can be
    if frames_length == 9 && rolls[0] == 10
      return 10 if rolls.sum == 20

      return 10 - rolls[1, 2].sum
    end
    10 - rolls.sum
  end
end
