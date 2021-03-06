require 'game' 

describe Game do

  describe '.create' do
    it 'creates a game' do
      expect(Game.create).to be_a(Game)
    end

    it '0 rolls have been played' do
      expect(subject.turn).to eq(0)
    end
  end

  describe '#roll_1' do
    before(:each) do
      subject.begin_frame
    end

    it 'returns strike! if the user throws a strike' do
      expect(subject.roll_1(10)).to eq("strike!")
    end

    it 'adds the users points to the current frame score' do
      subject.roll_1(7)
      expect(subject.current_frame.score[0]).to eq(7)
    end
  end

  


end