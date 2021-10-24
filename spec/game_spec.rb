require 'game'

describe Game do

  let(:game) { Game.new }
  describe '#new' do

    it "has ten frames" do
      expect(game.frames.length).to eq 10
      # expect(game.first).to be_a Frame
    end

    it "has incremental frame numbers" do
      expect(game.frames[0].number).to eq 1
      expect(game.frames[9].number).to eq 10

    end

    it 'has a current frame number' do
      expect(game.current_frame_number).to eq 1
    end

  end

  describe '#current_frame' do
    it 'gives the current frame' do
      expect(game.current_frame).to be_a Frame
      expect(game.current_frame.number).to eq 1
    end
  end

  describe '#score' do

    it "has a current score" do
      expect(game.current_score).to be_an Integer
    end

  end

  describe '#find_frame' do
    it 'finds frame by number' do
      frame = game.find_frame(2)
      expect(frame.number).to eq 2
    end
  end

  describe '#next_frame' do
    it 'gives the next frame' do
      next_frame = game.next_frame
      expect(next_frame).to be_a Frame
      expect(next_frame.number).to eq 2
    
    end
  end

  describe '#previous_frame' do
    it 'gives the previous frame' do
      game.current_frame_number = 2
      previous_frame = game.previous_frame
      expect(previous_frame).to be_a Frame
      expect(previous_frame.number).to eq 1
      
    end
  end

  describe '#all_rolls' do
    it 'shows the rolls in once place' do
      game.current_frame.record_roll(4)
      game.current_frame.record_roll(3)
      game.next_frame
      game.current_frame.record_roll(7)
      game.current_frame.record_roll(3)
      expect(game.all_rolls).to eq [4,3,7,'/']
    end

  end

  describe '#total' do
    it 'can handle a spare' do
      allow(game).to receive(:all_rolls).and_return [2,3,5,'/', 3, 4]
      expect(game.total).to eq (25) # three frames 5 + 13 + 7
    end
  end

end