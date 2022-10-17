require_relative '../lib/score_card'

RSpec.describe ScoreCard do
  context 'with some rolls' do
    it 'returns the list of rolls' do
      frame1 = Frame.new(3, 5)
      frame2 = Frame.new(2, 4)
      frame3 = Frame.new(3, 4)
      score_card = ScoreCard.new
      score_card.add(frame1)
      score_card.add(frame2)
      score_card.add(frame3)
      expect(score_card.all).to eq([frame1, frame2, frame3])
    end

    it 'calculates the total score without any spares or strkes' do
      frame1 = Frame.new(3, 5)
      frame2 = Frame.new(2, 4)
      frame3 = Frame.new(3, 4)
      score_card = ScoreCard.new
      score_card.add(frame1)
      score_card.add(frame2)
      score_card.add(frame3)
      expect(score_card.total_score).to eq(21)
    end
  end

  context 'when it is a gutter game' do
    it 'returns 0' do
      score_card = ScoreCard.new
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))
      score_card.add(Frame.new(0, 0))

      expect(score_card.total_score).to eq(0)
    end
  end

  context 'with spare' do
    it 'calculates total score with the bonus point of spare' do
      score_card = ScoreCard.new
      score_card.add(Frame.new(3, 7))
      score_card.add(Frame.new(2, 4))
      score_card.add(Frame.new(3, 4))
      expect(score_card.total_score).to eq(25)
    end

    it 'calculates correctly the total score' do
      score_card = ScoreCard.new
      score_card.add(Frame.new(3, 7))
      score_card.add(Frame.new(2, 4))
      score_card.add(Frame.new(6, 2))
      score_card.add(Frame.new(1, 4))
      score_card.add(Frame.new(5, 3))
      score_card.add(Frame.new(2, 5))
      score_card.add(Frame.new(4, 1))
      score_card.add(Frame.new(3, 5))
      score_card.add(Frame.new(4, 5))
      score_card.add(Frame.new(7, 3))
      score_card.add(Frame.new(4, 0))

      expect(score_card.total_score).to eq(82)
    end
  end

  context 'with strike' do
    it 'calculates total score with the bonus point of strike' do
      frame1 = Frame.new(10, 0)
      frame2 = Frame.new(2, 4)
      frame3 = Frame.new(3, 4)
      score_card = ScoreCard.new
      score_card.add(frame1)
      score_card.add(frame2)
      score_card.add(frame3)
      expect(score_card.total_score).to eq(29)
    end

    it 'calculates the perfect game' do
      frame = Frame.new(10, 0)
      score_card = ScoreCard.new
      score_card.add(frame)
      score_card.add(frame)
      score_card.add(frame)
      score_card.add(frame)
      score_card.add(frame)
      score_card.add(frame)
      score_card.add(frame)
      score_card.add(frame)
      score_card.add(frame)
      score_card.add(Frame.new(10, 10))
      score_card.add(Frame.new(10, 0))

      expect(score_card.total_score).to eq(300)
    end
  end
end