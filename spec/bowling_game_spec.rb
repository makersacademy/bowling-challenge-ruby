require 'bowling_game'

RSpec.describe BowlingGame do
  context 'initially' do
    it 'constructs empty game' do
      bowling_game = BowlingGame.new

      expect(bowling_game.frames).to eq []
      expect(bowling_game.total_score).to eq 0
    end
  end

  context 'when adding frames' do
    it 'adds frame to frames array' do
      bowling_game = BowlingGame.new
      frame1 = Frame.new([1, 2])
      frame2 = Frame.new([3, 4])

      bowling_game.add_frame(frame1)
      bowling_game.add_frame(frame2)

      expect(bowling_game.frames).to eq [frame1, frame2]
    end
  end

  context 'finds running total score when no pins knocked' do
    it ' calculates total for zero frame' do
      bowling_game = BowlingGame.new
      frame = Frame.new([0, 0])
      bowling_game.add_frame(frame)

      expect(bowling_game.total_score).to eq 0
    end

    it ' calculates total for gutter game' do
      bowling_game = BowlingGame.new
      frame = Frame.new([0, 0])
      10.times do
        bowling_game.add_frame(frame)
      end

      expect(bowling_game.frames.length).to eq 10
      expect(bowling_game.total_score).to eq 0
    end
  end

  context 'scores when adding simple frames' do
    it 'finds running total for one frame' do
      bowling_game = BowlingGame.new
      frame1 = Frame.new([1, 2])
      bowling_game.add_frame(frame1)

      expect(bowling_game.total_score).to eq 3
    end

    it 'finds total score when 2 frames added' do
      bowling_game = BowlingGame.new
      frame1 = Frame.new([1, 2])
      frame2 = Frame.new([3, 4])

      bowling_game.add_frame(frame1)
      bowling_game.add_frame(frame2)

      expect(bowling_game.total_score).to eq 10
    end

    it 'finds total score when 10 frames added' do
      bowling_game = BowlingGame.new
      frame = Frame.new([2, 2])

      10.times do
        bowling_game.add_frame(frame)
      end

      expect(bowling_game.total_score).to eq 40
    end
  end

  context 'when a game contains spares' do
    it 'does not add the spare frame before next frame played' do
      bowling_game = BowlingGame.new
      frame = Frame.new([2, 8])
      
      bowling_game.add_frame(frame)
      expect(bowling_game.total_score).to eq 0
    end
  end
end