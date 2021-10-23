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

  describe '#go_turn' do

  end

  



end