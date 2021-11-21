# Frame class
class Frame

  attr_reader :t1p, :t2p,

  def initialize
    @t1p = 0
    @t2p = 0
  end

  def turn1
    puts 'Please enter the number of pins you knocked down on turn 1: '
    @t1p = $stdin.gets.chomp.to_i
    if @t1p<=9
      @t1p
    elsif @t1p = 10
      strike
    else puts 'Please enter your pin count again: '
    end
  end

  def turn2
    puts 'Please enter the number of pins you knocked down on turn 1: '
    @t2p = $stdin.gets.chomp.to_i
    if @t2p <=9 && (@t1p + @t2p <=9)
      @t2p
    elsif (@t2p + @t1p = 10)
      spare
      # run spare method
    else puts 'Please enter your pin count again (0-10): '
    end
  end

  def strike
    puts 'Great job on the strike'
    @bonus_turn += 2
  end

  def spare
    puts 'Great job on the spare'
  end
end
