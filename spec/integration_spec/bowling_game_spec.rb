require 'bowling_game'

RSpec.describe BowlingGame do
  let(:bowling_game) { BowlingGame.new }
  
  context 'initially' do
    it 'constructs empty game' do
      bowling_game = BowlingGame.new

      expect(bowling_game.frames).to eq []
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
      bowling_game = simulate_game([0, 0])

      expect(bowling_game.total_up_to(0)).to eq 0
    end

    it ' calculates total for gutter game' do
      bowling_game = simulate_game(
        [0, 0], [0, 0], [0, 0], [0, 0], [0, 0],
        [0, 0], [0, 0], [0, 0], [0, 0], [0, 0])

      expect(bowling_game.frames.length).to eq 10
      expect(bowling_game.total_up_to(9)).to eq 0
    end
  end

  context 'scores when adding simple frames' do
    it 'finds running total for one frame' do
      bowling_game = simulate_game([1, 2])

      expect(bowling_game.total_up_to(0)).to eq 3
    end

    it 'finds total score when 2 frames added' do
      bowling_game = simulate_game([1, 2], [3, 4])

      expect(bowling_game.total_up_to(1)).to eq 10
    end

    it 'finds total score when 10 frames added' do
      bowling_game = simulate_game(
        [2, 2], [2, 2], [2, 2], [2, 2], [2, 2],
        [2, 2], [2, 2], [2, 2], [2, 2], [2, 2]
      )

      expect(bowling_game.total_up_to(9)).to eq 40
    end
  end

  context 'when a game contains spares' do
    it 'does not add the spare frame before next frame played' do
      bowling_game = simulate_game([2, 8])
      
      expect(bowling_game.total_up_to(0)).to eq nil
    end

    it 'adds the spare with bonus when next frame played' do
      bowling_game = simulate_game([2, 8], [1, 1])

      expect(bowling_game.total_up_to(1)).to eq 13
    end

    it 'finds total when spare in middle of game' do
      bowling_game = simulate_game(
        [1, 1], [1, 1], [1, 1], [1, 1], [2, 8], [1, 1]
      )

      expect(bowling_game.total_up_to(4)).to eq 19
      expect(bowling_game.total_up_to(5)).to eq 21
    end

    it 'finds total score when game ends on a spare' do
      bowling_game = simulate_game(
        [2, 3], [2, 3], [2, 3], [2, 3], [2, 3],
        [2, 3], [2, 3], [2, 3], [2, 3], [5, 5, 2]
      )

      expect(bowling_game.total_up_to(9)).to eq 57
    end
  end

  context 'when a game contains strikes' do
    it 'does not add a total when first and only frame is a strike' do
      bowling_game = simulate_game([10])

      expect(bowling_game.total_up_to(0)).to eq nil
    end

    it 'calculates total after one strike and one simple frame' do
      bowling_game = simulate_game([10], [2, 2])

      expect(bowling_game.total_up_to(1)).to eq 18
    end

    it 'calculates total when strike in middle of game' do
      bowling_game = simulate_game(
        [2, 2], [2, 2], [2, 2], [2, 2], [2, 2],
        [10], [2, 2], [2, 2], [2, 2], [2, 2]
      )

      expect(bowling_game.total_up_to(9)).to eq 50
    end

    it 'calculates total with 5 strikes' do
      bowling_game = simulate_game(
        [10], [2, 2], [10], [2, 2], [10],
        [2, 2], [10], [2, 2], [10], [2, 2]
      )

      expect(bowling_game.total_up_to(9)).to eq 90
    end

    it 'calculates for all strike game' do
      bowling_game = simulate_game(
        [10], [10], [10], [10], [10],
        [10], [10], [10], [10], [10, 10, 10]
      )

      expect(bowling_game.total_up_to(9)).to eq 300
    end
  end

  context 'for a complex game' do
    it 'finds all the running totals' do
      bowling_game = BowlingGame.new

      frame1 = Frame.new([8, 2])
      frame2 = Frame.new([6, 2])
      frame3 = Frame.new([10])
      frame4 = Frame.new([2, 5])
      frame5 = Frame.new([8, 2])
      frame6 = Frame.new([4, 3])
      frame7 = Frame.new([6, 3])
      frame8 = Frame.new([10])
      frame9 = Frame.new([10])
      frame10 = Frame.new([5, 5, 7])

      bowling_game.add_frame(frame1)
      expect(bowling_game.total_up_to(0)).to eq nil
      bowling_game.add_frame(frame2)
      expect(bowling_game.total_up_to(0)).to eq 16
      expect(bowling_game.total_up_to(1)).to eq 24
      bowling_game.add_frame(frame3)
      expect(bowling_game.total_up_to(2)).to eq nil
      bowling_game.add_frame(frame4)
      expect(bowling_game.total_up_to(2)).to eq 41
      expect(bowling_game.total_up_to(3)).to eq 48
      bowling_game.add_frame(frame5)
      expect(bowling_game.total_up_to(4)).to eq nil
      bowling_game.add_frame(frame6)
      expect(bowling_game.total_up_to(4)).to eq 62
      expect(bowling_game.total_up_to(5)).to eq 69
      bowling_game.add_frame(frame7)
      expect(bowling_game.total_up_to(6)).to eq 78
      bowling_game.add_frame(frame8)
      expect(bowling_game.total_up_to(7)).to eq nil
      bowling_game.add_frame(frame9)
      expect(bowling_game.total_up_to(8)).to eq nil
      bowling_game.add_frame(frame10)
      expect(bowling_game.total_up_to(7)).to eq 103
      expect(bowling_game.total_up_to(8)).to eq 123
      expect(bowling_game.total_up_to(9)).to eq 140
    end
  end
end