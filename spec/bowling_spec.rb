require 'bowling'

describe Bowling do
  describe '#enter_score' do
    context 'Player enters a score outside of 0 to 10'
    it 'returns an error' do
      bowling = Bowling.new
      expect{bowling.enter_score(11)}.to raise_error 'Outside of Range'
    end
    context 'Player enters a valid score'
    it 'is stored as a score' do
      bowling = Bowling.new
      bowling.enter_score(8)
      expect(bowling.score.first).to eq 8
    end
  end
  describe '#game' do
    it 'Stops after 10 Frames' do
      bowling = Bowling.new
      10.times do 
        bowling.enter_score(6)
      end
      expect(bowling.score.length).to eq 10
    end
  end
  describe '#total_score' do
    it 'returns the total score as a string' do
      bowling = Bowling.new
      5.times do
        bowling.enter_score(7)
      end
      expect(bowling.total_score).to eq 'TOTAL: 35'
    end
  end 
end