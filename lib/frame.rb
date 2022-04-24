class Frame

  attr_reader :roll1, :roll2

  def initialize
    @roll1
    @roll2
  end

  def strike?
    @roll1 == 10
  end

  def spare?
    @roll1 != 10 && roll1 + roll2 == 10
  end

  def get_rolls
    puts "First roll: "
    @roll1 = gets.chomp.to_i
    if @roll1 != 10
      puts "Second roll: "
      @roll2 = gets.chomp.to_i
    end
    [@roll1, @roll2]
  end

end
