class Frame

  attr_reader :t1p, :t2p

  def turn1
    puts 'Please enter the number of pins you knocked down on turn 1: '
    @t1p = $stdin.gets.chomp.to_i
  end

  def turn1
    puts 'Please enter the number of pins you knocked down on turn 1: '
    @t2p = $stdin.gets.chomp.to_i
  end
end
