require 'bowling'

describe Bowling do

  let (:subject) { described_class.new }

  context 'without rolling any strikes or spares' do
    it 'gives the total score of all rolls' do
      20.times {subject.roll(4)}
      expect(subject.total_score).to eq 80
    end

    it 'gives the total score of 0 if player never hits a pin' do
      20.times {subject.roll(0)}
      expect(subject.total_score).to eq 0
    end
  end


  context 'calculates correct score with strikes' do

    it 'gives the total score of all rolls' do
        2.times {subject.roll(2)}
        subject.roll(10)
        16.times {subject.roll(2)}
      expect(subject.total_score).to eq 50
    end 

    it 'gives the total if there are two strikes in a row' do
      subject.roll(10)
      subject.roll(10)
      16.times {subject.roll(2)}
      expect(subject.total_score).to eq 68
    end 
  end

  context 'calculates correct score with spares' do

    it 'gives the total score of one spare frame' do
      subject.roll(5)
      subject.roll(5)
      18.times {subject.roll(4)}
      expect(subject.total_score).to eq 86
    end 
  end 

    it 'gives the total score of two spare frames' do
      subject.roll(5)
      subject.roll(5)
      subject.roll(5)
      subject.roll(5)
      16.times {subject.roll(4)}
      expect(subject.total_score).to eq 93
    end 

  context 'perfect game' do 
    it ' returns the score of a perfect game where the player is not human or really good at it which is almost impossible in real life' do
     12.times {subject.roll(10)}
     expect(subject.total_score).to eq 300
    end 
  end 
      

end
