require 'scorecard'

RSpec.describe Scorecard do
  context 'player plays two frames' do
    it 'returns its points' do
      scorecard = Scorecard.new
      scorecard.add(Frame.new(1, 4))
      scorecard.add(Frame.new(4, 5))
      expect(scorecard.calculate_frame(1)).to eq 5
      expect(scorecard.calculate_frame(2)).to eq 9
    end
  end

  context 'player plays two frames with the first one being a strike' do
    it 'returns its points' do
      scorecard = Scorecard.new
      scorecard.add(Frame.new(10, 0))
      scorecard.add(Frame.new(1, 4))
      expect(scorecard.calculate_frame(1)).to eq 15
    end
  end

  context 'player plays two frames with the first two being a strike' do
    it 'returns its points' do
      scorecard = Scorecard.new
      scorecard.add(Frame.new(10, 0))
      scorecard.add(Frame.new(10, 0))
      scorecard.add(Frame.new(1, 4))
      expect(scorecard.calculate_frame(1)).to eq 21
    end
  end

  context 'player plays two frames with the first one being a spare' do
    it 'returns its points' do
      scorecard = Scorecard.new
      scorecard.add(Frame.new(5, 5))
      scorecard.add(Frame.new(6, 2))
      expect(scorecard.calculate_frame(1)).to eq 16
    end
  end

  context 'player plays a gutter game' do
    it 'returns 0 points' do
      scorecard = Scorecard.new
      frame = Frame.new(0, 0)
      10.times { scorecard.add(frame) }

      expect(scorecard.calculate_total_score).to eq 0
    end
  end

  context 'player plays ten times 8 pins per frame' do
    it 'returns 0 points' do
      scorecard = Scorecard.new
      frame = Frame.new(4, 4)
      10.times { scorecard.add(frame) }

      expect(scorecard.calculate_total_score).to eq 80
    end
  end

  context 'player plays a strike and nine times 8 pins per frame' do
    it 'returns 0 points' do
      scorecard = Scorecard.new
      scorecard.add(Frame.new(10, 0))
      frame = Frame.new(4, 4)
      9.times { scorecard.add(frame) }

      expect(scorecard.calculate_total_score).to eq 18 + (9*8)
    end
  end

  context 'player plays a perfect game' do
    it 'returns 300 points with score updates between every frame' do
      scorecard = Scorecard.new
      frame = Frame.new(10, 0)
      12.times { scorecard.add(frame) }

      expect(scorecard.calculate_total_score).to eq 300
    end
  end

  context 'player plays an example game ending with a spare' do
    it 'returns 133 points with score updates between every frame' do
      scorecard = Scorecard.new
      scorecard.add(Frame.new(1, 4))
      scorecard.add(Frame.new(4, 5))
      scorecard.add(Frame.new(6, 4))   # SPARE
      scorecard.add(Frame.new(5, 5))   # SPARE
      scorecard.add(Frame.new(10, 0))  # STRIKE
      scorecard.add(Frame.new(0, 1))
      scorecard.add(Frame.new(7, 3))   # SPARE
      scorecard.add(Frame.new(6, 4))   # SPARE
      scorecard.add(Frame.new(10, 0))  # STRIKE
      scorecard.add(Frame.new(2, 8))   # SPARE

      # Extra roll due to spare in last frame
      scorecard.add(Frame.new(6, 0))

      expect(scorecard.calculate_total_score).to eq 133
    end
  end
end