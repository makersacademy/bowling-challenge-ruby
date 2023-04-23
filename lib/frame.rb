class Frame
  attr_accessor :rolls, :bonus_points

  def initialize(io=Kernel)
    @io = io
    @rolls = []
    @bonus_points = 0
  end

  def play_regular_frame
    roll_first_ball
    if @rolls.first == 10
      print_strike_message
      return
    end
    roll_second_ball
    print_spare_message if @rolls.inject(:+) == 10
  end

  def play_last_frame
    roll_first_ball
    if @rolls.first == 10
      print_strike_message
      roll_bonus_ball
      roll_second_bonus_ball
      return
    end
    roll_second_ball
    if @rolls.inject(:+) == 10
      print_spare_message
      roll_bonus_ball
    end
  end

  private

  def roll_first_ball
    @io.puts "Roll first ball:"
    roll = @io.gets.chomp.to_i
    @rolls << roll
  end

  def print_strike_message
    @io.puts "Strike!"
  end

  def roll_second_ball
    @io.puts "Roll second ball:"
    roll = @io.gets.chomp.to_i
    @rolls << roll
  end

  def print_spare_message
    @io.puts "Spare!"
  end

  def roll_bonus_ball
    @io.puts "Roll bonus ball:"
    bonus_roll = @io.gets.chomp.to_i
    @rolls << bonus_roll
  end

  def roll_second_bonus_ball
    @io.puts "Roll second bonus ball:"
    bonus_roll = @io.gets.chomp.to_i
    @rolls << bonus_roll
  end
end