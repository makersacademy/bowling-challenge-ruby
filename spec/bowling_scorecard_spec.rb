require 'bowling_scorecard'

describe Bowling_scorecard do
  before do
    @bowling_scorecard = Bowling_scorecard.new
  end

  context 'simple game' do
    it ' when there are no pins hit, has a gutter game' do
      20.times { subject.roll(0) }
      expect(subject.score).to eq(0)
    end
 
    it 'can count the knocked down pins from all twenty rolls' do
       subject.roll(3)
       subject.roll(9)
       subject.roll(2)
       subject.roll(3)
       expect(subject.score).to eq(20)
    end
  end

  context 'games with strikes & spares'
    describe 'Strike' do
      it 'knows when the player knocked down all pins in one go' do
        subject.roll(10)
        19.times { subject.roll(0) }
        expect(subject.score).to eq 10
      end
    end
 
    describe 'Spare' do
      it 'knows when the player knocked down all pins in one frame' do
        subject.roll(5)
        subject.roll(7)
        subject.roll(2)
        17.times { subject.roll(0) }
        expect(subject.score).to eq 14
      end
    end
 
    describe 'Perfect game' do
      it 'when the player rolls 12 strikes' do
        12.times { subject.roll(10) }
        expect(subject.score).to eq 300
      end
    end
  end


  # it 'gives a bonus roll if the player rolls a strike in the 10th frame' do
  #   18.times { subject.roll(0) }
  #   subject.roll(10)
  #   subject.roll(10)
  #   subject.roll(10)
  #   expect(subject.final_score).to eq 30
  # end

