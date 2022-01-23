require 'game'

describe Game do
 
  let(:game) { Game.new }
  let(:open_frame) { 
    double( :open_frame,
    roll_1: 1,
    roll_2: 2, 
    strike?: false, 
    spare?: false, 
    bonus_rolls: nil,
    score: 3)
  }

  let(:strike_frame) { 
    double( :strike_frame,
    roll_1: 10,
    roll_2: nil, 
    strike?: true, 
    spare?: false, 
    bonus_rolls: 2,
    score: 10)
  }
  
  let(:spare_frame) {
    double( :spare_frame,
    roll_1: 5,
    roll_2: 5, 
    strike?: false, 
    spare?: true, 
    bonus_rolls: 1,
    score: 10)
  }

  describe '#add_roll' do
    context 'when roll is 0-9' do
      it 'awaits another roll' do
        game.add_roll(2)
        expect(game.frames.length).to eq 0
      end
    end
    
    context 'whens strike' do
      it 'completes a frame' do
        game.add_roll(10)
        expect(game.frames.length).to eq 1
      end
    end
    
    context 'when there is an outstanding roll' do
      it 'returns nil' do
        game.add_roll(2)
        game.add_roll(5)
        expect(game.current_frame).to eq nil
      end
    end
    
    context 'when roll is higher than 10' do
      it 'raises an error' do
        expect { game.add_roll(11) }.to raise_error 'invalid roll'
      end
    end
    
    context 'when the sum of both rolls is higher than 10' do
      it 'raises an error' do
        game.add_roll(5)
        expect { game.add_roll(6) }.to raise_error 'invalid roll'
      end
    end
    
    context 'when the sum is 10' do
      it 'does not raise an error' do
        game.add_roll(4)
        expect {game.add_roll(6)}.not_to raise_error 'invalid roll'
      end
    end
    
    context 'after 10 frames with last as strike' do
      it 'does not raise an error' do
        10.times { game.add_roll(10) }
        game.add_roll(10)
        expect { game.add_roll(10) }.not_to raise_error 'round complete'
      end
    end
    
    context 'after 10 frames with last one as spare' do
      it 'raises an error' do
        9.times { game.add_roll(10) }
        game.add_roll(5)
        game.add_roll(5)
        expect { game.add_roll(5) }.not_to raise_error 'round complete'
      end
    end

    context 'after 10 frames with last NOT as strike or spare' do
      it 'raises an error' do
        9.times { game.add_roll(10) }
        game.add_roll(5)
        game.add_roll(4)
        expect { game.add_roll(5) }.to raise_error 'round complete'
      end
    end
  end

  describe '#add_frame' do
    it 'adds the frame' do
      expect(game).to receive(:analyse_frame)
      game.add_frame(strike_frame)
      expect(game.frames).to eq [strike_frame]
    end
  end

  describe '#add_frame' do
    it 'receives analyse_frame(frame) ' do
      expect(game).to receive(:analyse_frame).with(spare_frame)
      game.add_frame(spare_frame)
    end
  end

  # isn't this testing the state?
  describe '#add_frame' do
    it 'updates the previous frames' do
      game.add_frame(Frame.new(5, 4))
      expect(game.total_score).to eq 9
      
      game.add_frame(Frame.new(10, nil))
      expect(game.frames[-2].score).to eq 9
      expect(game.total_score).to eq 19
      
      game.add_frame(Frame.new(5, 5)) # score 5 + 5 + 10
      expect(game.frames[-2].score).to eq 20
      expect(game.total_score).to eq 39
      
      game.add_frame(Frame.new(10, nil)) # score 10 + 10 + 10
      expect(game.frames[-2].score).to eq 20
      expect(game.total_score).to eq 59
      
      game.add_frame(Frame.new(10, nil)) # score 10 + 10 + 5
      expect(game.frames[-2].score).to eq 20
      expect(game.total_score).to eq 79
      
      game.add_frame(Frame.new(10, nil)) # score 10 + 5 + 5
      expect(game.frames[-3].score).to eq 30
      expect(game.frames[-2].score).to eq 20
      expect(game.total_score).to eq 109
      
      game.add_frame(Frame.new(5, 5)) # score 5 + 5 + 0
      expect(game.frames[-3].score).to eq 25
      expect(game.frames[-2].score).to eq 20
      expect(game.total_score).to eq 134
      
      game.add_frame(Frame.new(0, 0)) # score 0 + 0
      expect(game.frames[-2].score).to eq 10
      expect(game.total_score).to eq 134
      
      game.add_frame(Frame.new(3, 3)) # score 3 + 3
      expect(game.frames[-2].score).to eq 0
      expect(game.total_score).to eq 140
      
      game.add_frame(Frame.new(5, 4)) # score 5 + 4
      expect(game.frames[-2].score).to eq 6
      expect(game.total_score).to eq 149
    end
  end

  describe '#total_score' do
    it 'returns the sum of scores' do
      game = Game.new([
        double(score: 25), 
        double(score: 20), 
        double(score: 11), 
        double(score: 3),
        double(score: 10)
        ])
      expect(game.total_score).to eq 69
    end
  end
end
