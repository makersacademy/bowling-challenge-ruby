require 'scoring_bowling'

describe Scoring_Bowling do

  describe 'initialize' do

    it 'is expected to have 3 public attributes' do
      expect(subject).to have_attributes(:rounds => [], :frame => 0, :score => 0)
    end

  end

  describe '#add_bowl' do

    it 'is expected to add the bowl to rounds array' do
      subject.add_bowl(9, 0)
      expect(subject.rounds).to include(frame: 1, bowls: [9, 0])
    end

    it 'is expected to be able to take two bowls' do
      subject.add_bowl(9, 1)
      expect(subject.rounds).to include(frame: 1, bowls: [9, 1])
    end

    it 'is expected to update the frame' do
      expect{ subject.add_bowl(9, 1) }.to change{ subject.frame }.by (1)
    end

    it 'is expected to raise Game Over message when trying to add more bowls past ten frames' do
      10.times { subject.add_bowl(9, 1) }
      expect{ subject.add_bowl(9, 1) }.to raise_error{ 'Game Over, no more scores can be added' }
    end

  end

  describe '#calculate_score' do

    it 'is expected not to update score if all gutter balls' do
      10.times { subject.add_bowl(0, 0) }
      expect{ subject.calculate_score }.not_to change{ subject.score }
    end

    it 'is expected to produce the sum of all bowls made with no strikes or spares made' do
      3.times { subject.add_bowl(6, 3) }
      3.times { subject.add_bowl(0, 9) }
      3.times { subject.add_bowl(6, 0) }
      1.times { subject.add_bowl(0, 0, 0) }
      expect{ subject.calculate_score }.to change{ subject.score }.by (72)
    end

    it 'is expected to produce the sum of all bowls made with only spares made' do
      9.times { subject.add_bowl(9, 1) }
      subject.add_bowl(9, 1, 9)
      expect{ subject.calculate_score }.to change{ subject.score }.by (190)
    end

    it 'is expected to produce the sum of all bowls made with only spares made' do
      9.times { subject.add_bowl(5, 5) }
      subject.add_bowl(5, 5, 5)
      expect{ subject.calculate_score }.to change{ subject.score }.by (150)
    end

    it 'is expected to calculate scores with spares and no spare/strike bowls' do
      3.times { subject.add_bowl(6, 3) }
      3.times { subject.add_bowl(9, 1) }
      4.times { subject.add_bowl(6, 0) }
      expect{ subject.calculate_score }.to change{ subject.score }.by (105)
    end

    it 'is expected to produce the sum of only strikes made' do
      9.times { subject.add_bowl(10, 0) }
      subject.add_bowl(10, 10, 10)
      expect{ subject.calculate_score }.to change{ subject.score }.by 300
    end

    it 'is expected to produce the sum of all types of bowls made' do
      2.times { subject.add_bowl(6, 4) }
      3.times { subject.add_bowl(9, 1) }
      4.times { subject.add_bowl(6, 0) }
      subject.add_bowl(5, 5, 10)
      expect{ subject.calculate_score }.to change{ subject.score }.by (133)
    end

  end

end
