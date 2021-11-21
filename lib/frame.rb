# Frame class
class Frame

  attr_reader :t1p, :t2p

  def turn1
    puts 'Please enter the number of pins you knocked down on turn 1: '
    @t1p = $stdin.gets.chomp.downcase
    if @t1p <=9
      @t1p.to_i
    elsif @t1p = 'x'
      @t1p = 10 + st1 + st2
      # run strike method
    else puts 'Please enter your pin count again: '
    end
  end

  def turn2
    puts 'Please enter the number of pins you knocked down on turn 1: '
    @t2p = $stdin.gets.chomp.downcase
    if @t2p <=9 && (@t1p + @t2p <=9)
      @t2p.to_i
    elsif @t2p = '/'
      @t2p = 10 + st1
      # run spare method
    else puts 'Please enter your pin count again: '
    end
  end
end
