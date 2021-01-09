require 'game'

describe Game do
  describe '#initialize' do
    it 'create an instance of Game' do
      expect(subject).to be_an_instance_of Game
    end
  end

  describe '.play' do
    it 'calculates the total score' do
      game = Game.new
      frames = []
      frame_1 = Frame.new(10, 0)
      game.play(frame_1)
      frames.append(frame_1)
      frame_2 = Frame.new(2, 8)
      game.play(frame_2)
      frames.append(frame_2)
      expect(frames[0].frame_score).to eq 20
      frame_3 = Frame.new(2, 4)
      game.play(frame_3)
      frames.append(frame_3)
      expect(frames[1].frame_score).to eq 12
      expect(game.score).to eq 38
    end

    it 'return an error if user is playing more than 10 times' do
      game = Game.new
      (1...10).each do |_i|
        frame = Frame.new(2, 4)
        game.play(frame)
      end
      frame_ten = FrameTen.new(10, 0, 10)
      game.play(frame_ten)
      frame_eleven = Frame.new(2, 4)

      expect { game.play(frame_eleven) }.to raise_error('You cannot play more than 10 frames')
    end
  end

  describe '#check_last_frame' do
    it 'checks the score of the frame ten when last_frame is regular' do
        game = Game.new
        (1...10).each do |_i|
          frame = Frame.new(2, 4)
          game.play(frame)
        end
        frame_ten = FrameTen.new(2, 4, 0)
        game.check_last_frame(frame_ten)
        expect(frame_ten.frame_score).to eq 6
    end
    it 'checks the score of the frame ten when last_frame is ra spare' do
        game = Game.new
        (1...10).each do |_i|
          frame = Frame.new(2, 4)
          game.play(frame)
        end
        frame_ten = FrameTen.new(2, 8, 1)
        game.check_last_frame(frame_ten)
        expect(frame_ten.frame_score).to eq 11
    end

  end
end
