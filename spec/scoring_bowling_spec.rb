require 'scoring_bowling'

describe Scoring_Bowling do

  describe 'initialize' do

    it 'is expected to have 3 public attributes' do
      expect(subject).to have_attributes(:rounds => [], :frame => 0, :score => 0)
    end

  end

  describe '#add_roll' do

    it 'is expected to add the roll to rolls array' do
      subject.add_bowl(10)
      expect(subject.rounds).to include(frame: 1, bowls: [10, nil])
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
      expect{ subject.add_bowl(10) }.to raise_error{ 'Game Over, no more scores can be added' }
    end

    it 'is expected to raise Game Over message when trying to add more bowls past ten frames' do
      expect{ subject.add_bowl(10, 1) }.to raise_error{ 'Total sum of inputs cannot exceed 10, please enter the correct values' }
    end



    describe '#calculate_score' do

      it 'is expected to produce the sum of all bowls made with no strikes made' do
        3.times { subject.add_bowl(6, 3) }
        3.times { subject.add_bowl(0, 9) }
        4.times { subject.add_bowl(6, 0) }
        expect{ subject.calculate_score }.to change{ subject.score }.by (78)
      end

    end


  end

end
