require_relative 'lib/bowling_calculator'

class Application
  def initialize(io, bowling_calculator)
    @io = io
    @bowling_calculator = bowling_calculator
  end

  def run
    @io.puts "Welcome to the Bowling Calculator!"
    run_bowling_calculator
  end

  private

  def run_bowling_calculator
    while @bowling_calculator.can_still_play? do
      @io.puts "Insert the number of pins knocked out"
      pins_knocked = @io.gets.chomp.to_i
      total_score = @bowling_calculator.register_next_roll(pins_knocked)
    end
    @io.puts "the very final total score is: #{total_score}"
  end
end

if __FILE__ == $0
  app = Application.new(
    Kernel,
    BowlingCalculator.new,
  )
  app.run
end
