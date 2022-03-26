require 'scoring_bowling'

describe ScoringBowling do

  describe 'initialize' do
    it 'expected to have 3 public attributes' do
      expect(subject).to have_attributes(rounds: [], frame: 0, score: 0)
    end
  end

  describe '#add_bowl' do
    it 'expected to add the bowl to rounds array' do
      subject.add_bowl(9, 0)
      expect(subject.rounds).to include(frame: 1, bowls: [9, 0])
    end

    it 'expected to be able to take two bowls' do
      subject.add_bowl(9, 1)
      expect(subject.rounds).to include(frame: 1, bowls: [9, 1])
    end

    it 'expected to update the frame' do
      expect { subject.add_bowl(9, 1) }.to change { subject.frame }.by 1
    end

    it 'raise Game Over message when adding more bowls past ten frames' do
      10.times { subject.add_bowl(9, 1) }
      expect { subject.add_bowl(9, 1) }.to raise_error(/Game Over/)
    end
  end

  describe '#calculate_score' do
    it 'expected not to update score if all gutter balls' do
      10.times { subject.add_bowl(0, 0) }
      expect { subject.calculate_score }.not_to change { subject.score }
    end

    it 'expected to produce the sum of all bowls made. No strikes or spares' do
      3.times { subject.add_bowl(6, 3) }
      3.times { subject.add_bowl(0, 9) }
      3.times { subject.add_bowl(6, 0) }
      1.times { subject.add_bowl(0, 0, 0) }
      expect { subject.calculate_score }.to change { subject.score }.by 72
    end

    it 'expected to produce the sum of all bowls. Only spares made' do
      9.times { subject.add_bowl(9, 1) }
      subject.add_bowl(9, 1, 9)
      expect { subject.calculate_score }.to change { subject.score }.by 190
    end

    it 'expected to produce the sum of all bowls. Only spares made' do
      9.times { subject.add_bowl(5, 5) }
      subject.add_bowl(5, 5, 5)
      expect { subject.calculate_score }.to change { subject.score }.by 150
    end

    it 'expected to calculate scores with spares. No strike bowls' do
      3.times { subject.add_bowl(6, 3) }
      3.times { subject.add_bowl(9, 1) }
      4.times { subject.add_bowl(6, 0) }
      expect { subject.calculate_score }.to change { subject.score }.by 105
    end

    it 'expected to produce the sum of only strikes made' do
      9.times { subject.add_bowl(10, 0) }
      subject.add_bowl(10, 10, 10)
      expect { subject.calculate_score }.to change { subject.score }.by 300
    end

    it 'expected to produce the sum of all types of bowls made' do
      2.times { subject.add_bowl(6, 4) }
      3.times { subject.add_bowl(9, 1) }
      4.times { subject.add_bowl(6, 0) }
      subject.add_bowl(5, 5, 10)
      expect { subject.calculate_score }.to change { subject.score }.by 133
    end
  end
end
