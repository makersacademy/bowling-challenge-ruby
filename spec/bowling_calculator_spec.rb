require 'bowling_calculator'

RSpec.describe BowlingCalculator do
  context 'returns the finale score with no strikes or spares' do
    it 'returns the final score with rolls of 1 pin each' do
      bowling_calculator = BowlingCalculator.new
      20.times { bowling_calculator.register_next_roll(1) }

      expect(bowling_calculator.get_score).to eq 20
    end

    it 'returns the final score with 10 rolls of 1 pin and 10 of 2 pins' do
      bowling_calculator = BowlingCalculator.new
      10.times { bowling_calculator.register_next_roll(1) }
      10.times { bowling_calculator.register_next_roll(2) }

     expect(bowling_calculator.get_score).to eq 30
    end
  end


  it 'returns the final score of a game with a spare in the final frame' do
    bowling_calculator = BowlingCalculator.new
    2.times { bowling_calculator.register_next_roll(4) }
    6.times { bowling_calculator.register_next_roll(3) }
    10.times { bowling_calculator.register_next_roll(2) }
    2.times { bowling_calculator.register_next_roll(5) }
    bowling_calculator.register_next_roll(5)


    expect(bowling_calculator.get_score).to eq 61
  end

  it 'returns the final score of a game with a strike in the final frame' do
    bowling_calculator = BowlingCalculator.new
    4.times { bowling_calculator.register_next_roll(4) }
    4.times { bowling_calculator.register_next_roll(3) }
    10.times { bowling_calculator.register_next_roll(2) }
    bowling_calculator.register_next_roll(10)
    2.times { bowling_calculator.register_next_roll(5) }


    expect(bowling_calculator.get_score).to eq 68
  end

  context 'special matches' do
    it 'returns 300 for a perfect game' do
      bowling_calculator = BowlingCalculator.new
      12.times { bowling_calculator.register_next_roll(10) }

      expect(bowling_calculator.get_score).to eq 300
    end

    it 'returns 0 for a gutter game' do
      bowling_calculator = BowlingCalculator.new
      20.times { bowling_calculator.register_next_roll(0) }

      expect(bowling_calculator.get_score).to eq 0
    end
  end
end
