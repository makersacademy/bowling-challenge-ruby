require 'spec_helper'
require 'game'

describe Game do
  let(:game) { Game.new }

  it 'has frames variable that stores all frames' do
    expect(game.frames_array).to eq []
  end

  it 'has frames variable that stores scores for frames' do
    expect(game.frame_scores).to eq []
  end

  describe '#turn' do
    it 'returns the received frame' do
      frame_double = double('frame_double', frame: { first_roll: 6, second_roll: 2 })
      expect(frame_double.frame).to eq({ first_roll: 6, second_roll: 2 })
      game.turn(frame_double)
      expect(game.frames_array).to eq([{ first_roll: 6, second_roll: 2 }])
    end
    it 'adds score of the frame to frame_scores array' do
      frame_double = double('frame_double', frame: { first_roll: 6, second_roll: 2 })
      game.turn(frame_double)
      expect(game.frame_scores).to eq([8])
    end
  end
    
  describe '#score' do
    it 'returns the score of the frame' do
      frame_double = double('frame_double', frame: { first_roll: 6, second_roll: 2 })
      game.score(frame_double)
      expect(game.frame_scores).to eq([8])
    end
    it 'shows strike in the @frames_array' do
      frame_double = double('frame_double', frame: { first_roll: 'strike' })
      game.score(frame_double)
      expect(game.frame_scores).to eq([:strike])
    end
    it 'shows spare in the @frames_array' do
      frame_double = double('frame_double', frame: { first_roll: 6, second_roll: 'spare' })
      game.score(frame_double)
      expect(game.frame_scores).to eq([:spare])
    end

    it 'changes state to strike if first roll is strike' do
      frame_double = double('frame_double', frame: { first_roll: 'strike'})
      game.score(frame_double)
      expect(game.state).to eq(:strike)
    end
    it 'changes state to spare if second roll is spare' do
      frame_double = double('frame_double', frame: { first_roll: 9, second_roll: 'spare' })
      game.score(frame_double)
      expect(game.state).to eq(:spare)
    end
  end

  describe 'bonus_score' do
    it 'adds the next 2 rolls to strike score' do
      frame_double1 = double('frame_double1', frame: { first_roll: 'strike' })
      frame_double2 = double('frame_double2', frame: { first_roll: 2, second_roll: 3 })
      game.turn(frame_double1)
      game.turn(frame_double2)
      expect(game.frame_scores).to eq([15, 5])
    end
    it 'adds the next 1 roll to spare score' do
      frame_double1 = double('frame_double1', frame: { first_roll: 9, second_roll: 'spare' })
      frame_double2 = double('frame_double2', frame: { first_roll: 2, second_roll: 3 })
      game.turn(frame_double1)
      game.turn(frame_double2)
      expect(game.frame_scores).to eq([12, 5])
    end
  end
   describe '10th frame' do
    it 'last frame and final score in regular circumstances' do
      frame_double1 = double('frame_double1', frame: { first_roll: 0, second_roll: 1})
      10.times { game.turn(frame_double1) }
      expect(game.final_score).to eq(10)
    end

    it 'final score when 10th frame is a strike' do
      frame_double1 = double('frame_double1', frame: { first_roll: 0, second_roll: 1})
      9.times { game.turn(frame_double1) }
      frame_double2 = double('frame_double2', frame: { first_roll: 'strike' })
      game.turn(frame_double2)
      game.extra_roll(2)
      game.extra_roll(3)
      expect(game.final_score).to eq(24)
    end

     it 'final score when 10th frame is a spare' do
       frame_double1 = double('frame_double1', frame: { first_roll: 0, second_roll: 1})
       9.times { game.turn(frame_double1) }
       frame_double2 = double('frame_double2', frame: { first_roll: 1, second_roll: 'spare' })
       game.turn(frame_double2)
       game.extra_roll(2)
       expect(game.final_score).to eq(21)
     end

     it 'ends game after 10th frame' do
       frame_double1 = double('frame_double1', frame: { first_roll: 'strike' })
       10.times { game.turn(frame_double1) }
       game.extra_roll(10)
       game.extra_roll(10)
       expect(game.final_score).to eq(300)
     end
   end
end
