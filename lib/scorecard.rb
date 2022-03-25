class Scorecard

  def initialize(name=nil)
    @name = name
  end

  def start
    puts "Player: #{@name}" if @name
    puts 'Scorecard'
  end

end