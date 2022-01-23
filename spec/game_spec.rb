require 'game'

describe Game do
 
  let(:game) { Game.new }
  let(:open_frame) = double(
    :open_frame,
    roll_1: 1,
    roll_2: 2, 
    strike?: false, 
    spare?: false, 
    bonus_rolls: nil,
    score: 3)

  let(:strike_frame) = double(
    :strike_frame,
    roll_1: 10,
    roll_2: nil, 
    strike?: true, 
    spare?: false, 
    bonus_rolls: 2,
    score: 10)



  describe '#check_status' do
    it 'adds an open frame to closed_frames' do
      game.check_status(open_frame)
      expect(game.awaiting_frames.length).to eq 0
      expect(game.closed_frames.length).to eq 1
      # expect(game.show_frames).to eq [{1: [1, 2]}]
    end
    
    it 'adds an strike frame to awaiting_frames with bonus 2' do
      game.check_status(frame)
      expect(game.awaiting_frames.length).to eq 1
      expect(game.closed_frames.length).to eq 0
    end
  end
end
