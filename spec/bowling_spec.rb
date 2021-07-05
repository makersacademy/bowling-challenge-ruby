require 'bowling'

describe Bowling do
  context '.initialize' do
    it 'initializes with an empty rolls array' do
      expect(subject.rolls).to eq []
    end
  end

  context '.frame' do
    it 'pushes first and second roll into the rolls array' do
      subject.frame(2, 3)
      expect(subject.rolls[0]).to eq({ first: 2, second: 3 })
    end

    it 'records a strike' do
      subject.frame(10)
      expect(subject.rolls[0]).to eq({ first: 10 })
    end
  end

  context '.tenth_frame' do
    it 'pushes only two rolls into the rolls array if there is no strike or spare' do
      subject.tenth_frame(2, 3)
      expect(subject.rolls[0]).to eq({ first: 2, second: 3 })
    end

    it 'pushes three rolls into the rolls array with a strike or spare' do
      subject.tenth_frame(6, 4, 10)
      expect(subject.rolls[0]).to eq({ first: 6, second: 4, third: 10 })
    end
  end

  context '.score_frame' do
    it 'scores the first frame with no strike nor spare' do
      subject.frame(2, 3)
      expect(subject.score_frame(1)).to eq [5]
    end

    it 'scores a spare' do
      subject.frame(6, 4)
      subject.frame(2, 3)
      expect(subject.score_frame(1)).to eq [12]
    end

    it 'scores a strike' do
      subject.frame(10)
      subject.frame(2, 3)
      expect(subject.score_frame(1)).to eq [15]
    end

    it 'scores a strike followed by another strike' do
      subject.frame(10)
      subject.frame(10)
      subject.frame(5, 3)
      expect(subject.score_frame(1)).to eq [25]
    end

    it 'scores a strike followed by a strike in the tenth frame' do
      9.times { subject.frame(10) }
      subject.tenth_frame(10, 5, 5)
      expect(subject.score_frame(9)).to eq [25]
    end
  end

  context '.score_tenth_frame' do
    it 'scores the tenth frame when no strike nore spare are bowled' do
      9.times { subject.frame(3, 3) }
      subject.tenth_frame(3, 3)
      expect(subject.score_tenth_frame).to eq [6]
    end

    it 'scores the tenth frame with a strike' do
      9.times { subject.frame(3, 3) }
      subject.tenth_frame(10, 10, 5)
      expect(subject.score_tenth_frame).to eq [25]
    end
  end

  context '.overall_score' do
    it 'calculates the overall score' do
      expect(perfect_game).to eq 300
    end
  end
end
