require 'bowling_calculator'

RSpec.describe BowlingCalculator do
  it "returns the finale score with rolls of 1 pin each" do
    bowling_calculator = BowlingCalculator.new

    expect(20.times { bowling_calculator.register_next_roll(1) }).to eq 20
  end

  it "returns the finale score with no strikes or spares" do
    bowling_calculator = BowlingCalculator.new
    10.times { bowling_calculator.register_next_roll(2) }
    9.times { bowling_calculator.register_next_roll(1) }

    expect(bowling_calculator.register_next_roll(1)).to eq 30
  end
end