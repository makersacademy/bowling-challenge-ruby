require 'bowling_score'

describe BowlingScore do
  let(:subject) { described_class.new }

  context 'without rolling any strikes or spares' do
    it 'returns the total score of all rolls' do
      20.times { subject.roll(4) }
      expect(subject.total_score).to eq 80
    end

    it 'returns the total score for 10 gutter rolls' do
      20.times { subject.roll(0) }
      expect(subject.total_score).to eq 0
    end
  end

  context 'calculates correct score with strikes' do
    it 'returns the total score of all rolls with one strike' do
      subject.roll(10)
      18.times { subject.roll(4) }
      expect(subject.total_score).to eq 90
    end

    it 'returns the total score with two consecutive strikes' do
      subject.roll(10)
      subject.roll(10)
      17.times { subject.roll(4) }
      expect(subject.total_score).to eq 106
    end
  end

  context 'calculates the score with spares' do
    it 'returns the total score of all rolls including one space' do
      subject.roll(5)
      subject.roll(5)
      18.times { subject.roll(4) }
      expect(subject.total_score).to eq 86
    end

    it 'returns the total score of all rolls including two space' do
      subject.roll(5)
      subject.roll(5)
      subject.roll(4)
      subject.roll(6)
      16.times { subject.roll(4) }
      expect(subject.total_score).to eq 92
    end
  end

  context "with bonus rolls" do
    it 'returns the score if the 10th frame is a strike' do
      18.times { subject.roll(7) }
      subject.roll(10)
      2.times { subject.roll(1) }
      expect(subject.total_score).to eq 138
    end

    it 'returns the score if the 10th frame rolls are both strikes' do
      18.times { subject.roll(7) }
      subject.roll(10)
      subject.roll(10)
      1.times { subject.roll(1) }
      expect(subject.total_score).to eq 147
    end
  
    it 'returns the score if the 10th frame is a spare' do
      18.times { subject.roll(7) }
      2.times { subject.roll(5) }
      subject.roll(1)
      expect(subject.total_score).to eq 137
    end
  end

  context 'perfect game' do
    it 'returns the score of a perfect game where the player rolls a strike at every frame' do
      12.times { subject.roll(10) }
      expect(subject.total_score).to eq 300
    end
  end
end
