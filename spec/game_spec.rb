require 'game'

describe Game do
  
  let(:game) { Game.new }
  
  let(:strike_frame_1) { double(:strike_frame_1, bonus_rolls: 2, complete?: true) }
  let(:strike_frame_2) { double(:strike_frame_2, bonus_rolls: 2, complete?: true) }
  let(:strike_frame_3) { double(:strike_frame_3, bonus_rolls: 2, complete?: true) }
  
  let(:open_frame_1) { double(:open_frame_1, bonus_rolls: 0, complete?: true) }
  
  let(:spare_frame_1) { double(:spare_frame_1, bonus_rolls: 1, complete?: true) }
  
  let(:incomplete_frame_1) { spy(:incomplete_frame_1, complete?: false) }

  let(:empty_frame) { double(:empty_frame, score: 0) }

  describe '#add_roll' do
    
    #  What happens when I add a roll?
    #   checks if round complete
      #   assigns bonus points
      #   fills or creates frame

    # round_finished? - CHECK IF ROUND COMPLETE
    context 'round_finished?' do
      context 'after 10 open frames' do
        it 'raises and error' do
          frames = []
          10.times { frames << open_frame_1 }
          game = Game.new(frames)
          expect { game.add_roll(3) }.to raise_error 'round complete'
        end 
      end
      
      
      context 'after 10 frames with last as strike' do
        it 'does not raise an error' do
          frames = []
          10.times { frames.push(strike_frame_1) }
          game = Game.new(frames)
          allow(strike_frame_1).to receive(:add_points)
          allow(strike_frame_1).to receive(:bonus_rolls=)
          game.add_roll(10)
          expect { game.add_roll(10) }.not_to raise_error 'round complete'
        end

        context 'after 2 bonus rolls' do
          it 'raises an error' do
            frames = []
            10.times { frames.push(strike_frame_1) }
            game = Game.new(frames)
            allow(strike_frame_1).to receive(:add_points)
            allow(strike_frame_1).to receive(:bonus_rolls=)
            game.add_roll(10)
            game.add_roll(5)
            allow(strike_frame_1).to receive(:bonus_rolls) { 0 }
            expect { game.add_roll(10) }.to raise_error 'round complete'
          end
        end
      end
      
      context 'after 10 frames with last one as spare' do
        it 'does not raise an error' do
          frames = []
          9.times { frames.push(strike_frame_1) }
          frames.push(spare_frame_1)
          game = Game.new(frames)
          expect { game.add_roll(5) }.not_to raise_error 'round complete'
        end
        
        context 'after 1 bonus roll' do
          it 'does raise an error' do
            frames = []
            9.times { frames.push(open_frame_1) }
            frames.push(spare_frame_1)
            game = Game.new(frames)
            expect(spare_frame_1).to receive(:add_points).with(5)
            expect(spare_frame_1).to receive(:bonus_rolls=).with(0)
            game.add_roll(5)
            allow(spare_frame_1).to receive(:bonus_rolls) { 0 }
            expect { game.add_roll(5) }.to raise_error 'round complete'
          end
        end
      end
  
      context 'after 10 frames with last NOT as strike or spare' do
        it 'raises an error' do
          frames = []
          9.times { frames.push(strike_frame_1) }
          frames.push(open_frame_1)
          game = Game.new(frames)
          expect { game.add_roll(5) }.to raise_error 'round complete'
        end
      end      
    end

    # ASSIGN BONUS POINTS - add points from current roll to previous frames with bonus rolls

    context 'assign bonus points' do
      context 'when strike-->strike-->roll' do
        it 'adds 10 to the first and second strike' do
          game = Game.new([strike_frame_1, strike_frame_2])
          expect(strike_frame_1).to receive(:add_points).with(5)
          expect(strike_frame_1).to receive(:bonus_rolls=).with(1)
          expect(strike_frame_2).to receive(:add_points).with(5)
          expect(strike_frame_2).to receive(:bonus_rolls=).with(1)
          expect(empty_frame).to receive(:add_roll).with(5)
          game.add_roll(5, empty_frame)
        end
      end
      
      context 'when open-->roll' do
        it 'adds 10 to the first and second strike' do
          game = Game.new([open_frame_1])
          expect(open_frame_1).not_to receive(:add_points).with(10)
          expect(open_frame_1).not_to receive(:bonus_rolls=).with(1)
          expect(empty_frame).to receive(:add_roll).with(10)
          game.add_roll(10, empty_frame)
        end
      end

      context 'when spare-->roll' do
        it 'add only 1 bonus roll' do
          game = Game.new([spare_frame_1])
          expect(spare_frame_1).to receive(:add_points).with(10)
          expect(spare_frame_1).to receive(:bonus_rolls=).with(0)
          expect(empty_frame).to receive(:add_roll).with(10)
          game.add_roll(10, empty_frame)
          allow(empty_frame).to receive(:complete?) { false }
          # I wanted to check whether the value actually changed
          # not sure how to do it with a double?
          # here the bonus_rolls of the spare roll should change to 0
          # then we could double check that nothing is added
          # is this the right way?
          allow(spare_frame_1).to receive(:bonus_rolls) { 0 }
          expect(spare_frame_1).not_to receive(:add_points).with(6)
          expect(strike_frame_1).not_to receive(:bonus_rolls=).with(0)
          expect(empty_frame).to receive(:add_roll).with(6)
          game.add_roll(6)
        end
      end
    end

    # FILLS_OR_CREATES_FRAME
    context 'fill_or_create_frame' do
      context 'when previous frame incomplete' do
        it 'fills the frame' do
          game = Game.new([incomplete_frame_1])
          game.add_roll(3)
          expect(incomplete_frame_1).to have_received(:add_roll).with(3)
          expect(game.frames.length).to be 1
        end
      end

      context 'when previous frame complete' do
        it 'creates a frame' do
          incomplete_frame = spy()
          game = Game.new([strike_frame_1])
          expect(strike_frame_1).to receive(:add_points).with(8)
          expect(strike_frame_1).to receive(:bonus_rolls=).with(1)
          game.add_roll(8, incomplete_frame)
          expect(game.frames.length).to eq 2
          expect(game.frames).to include incomplete_frame
        end
      end
    end

    context 'when perfect score' do
      it 'returns 300' do
        strike_frame_with_bonus = double(score: 30)
        frames = []
        10.times { frames << strike_frame_with_bonus }
        game = Game.new(frames)
        expect(game.total_score).to eq 300
     end
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
