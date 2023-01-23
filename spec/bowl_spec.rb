require './bowl'
RSpec.describe Bowl do
  context "calculate bowling score" do
    it 'returns 0 for Gutter game' do
      io = double :io
      arr = Array.new(10, [0, 0])
      bowl = Bowl.new(io)
      expect(bowl.score(arr)).to eq 0
    end
  
    it 'returns a score of 20 for all ones' do
      io = double :io
      arr = Array.new(10, [1, 1])
      bowl = Bowl.new(io)
      expect(bowl.score(arr)).to eq 20
    end
  
    it 'gives a score of 16 case one spare - 5, 5 and 3 pins then 0 for the next 17 rolls' do
      io = double :io
      arr = [[5,5], [3,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new(io)
      expect(bowl.score(arr)).to eq 16
    end
  
    it 'gives a score of 24 case one strike - a strike, 3 and 4 pins then 0 for the next 16 rolls' do
      io = double :io
      arr = [[10], [3,4], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new(io)
      expect(bowl.score(arr)).to eq 24
    end
  
    it 'gives a score of 24 case one strike - 0 for the first 16 roll, a strike, 3 and 4 pins' do
      io = double :io
      arr = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [10], [3,4]]
      bowl = Bowl.new(io)
      expect(bowl.score(arr)).to eq 24
    end
  
    it 'gives a score of 60 case 3 strikes - 3 stikes, then 0 for the next 14 rolls' do
      io = double :io
      arr = [[10],[10],[10],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
      bowl = Bowl.new(io)
      expect(bowl.score(arr)).to eq 60
    end
  
    it 'gives a score of 90 case 4 strikes - 4 stikes, then 0 for the next 14 rolls' do
      io = double :io
      arr = [[10],[10],[10],[10],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
      bowl = Bowl.new(io)
      expect(bowl.score(arr)).to eq 90
    end
  
    it 'gives a score of 300 case perfect game - 12 strikes of 10' do
      io = double :io
      arr = [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10,10,10]]
      bowl = Bowl.new(io)
      expect(bowl.score(arr)).to eq 300
    end

    it 'gives a score of 128 case all spares and one strike' do
      io = double :io
      arr_2 = [[2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8,10]]
      bowl = Bowl.new(io)
      expect(bowl.score(arr_2)).to eq 128
    end

  end

  context "draw the frame" do
    it "draws board for gutter frame" do
      io = double :io
      arr = Array.new(10, [0, 0])
      bowl = Bowl.new(io)
      expect(bowl.draw_frame(arr[0])).to eq (" 0 , 0 |")
    end

    it "draws an empty board for empty frame" do
      io = double :io
      arr = []
      bowl = Bowl.new(io)
      expect(bowl.draw_frame(arr)).to eq (" , |")
    end

    it "draws board for strike frame" do
      io = double :io
      arr = [[10], [3,4], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new(io)
      expect(bowl.draw_frame(arr[0])).to eq " X |"
    end

    it "draws board for open frame" do
      io = double :io
      arr = [[6,3], [3,4], [2,4], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new(io)
      expect(bowl.draw_frame(arr[0])).to eq " 6 , 3 |"
      expect(bowl.draw_frame(arr[1])).to eq " 3 , 4 |"
    end
    
    it "draws board for spare frame" do
      io = double :io
      arr = [[8,2], [3,4], [5,5], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
      bowl = Bowl.new(io)
      expect(bowl.draw_frame(arr[0])).to eq " 8, / |"
      expect(bowl.draw_frame(arr[2])).to eq " 5, / |"
    end
  end

  context "draw bowls for all frames" do
    it "draws the board for one bowling game" do
      io = double :io
      arr = [[1,4], [4,5], [6,4], [5,5], [10], [0,1], [7,3], [6,4], [10], [2,8,6]]
      bowl = Bowl.new(io)
      expect(bowl.draw_frames(arr)).to eq " 1  4 | 4  5 | 6 / | 5 / | X | 0  1 | 7 / | 6 / | X | 2 /  6|"
    end

    it "draws another board for one bowling game" do
      io = double :io
      arr = [[1,4], [4,5], [6,4], [5,5], [10], [0,1], [7,3], [6,4], [10], [10,10,10]]
      bowl = Bowl.new(io)
      expect(bowl.draw_frames(arr)).to eq " 1  4 | 4  5 | 6 / | 5 / | X | 0  1 | 7 / | 6 / | X | X X X|"
    end

    it "draws one more board for one bowling game" do
      io = double :io
      arr = [[10], [10], [10], [10], [10], [10], [10], [1,1], [1,1], [2,8,10]]
      bowl = Bowl.new(io)
      expect(bowl.draw_frames(arr)).to eq " X | X | X | X | X | X | X | 1  1 | 1  1 | 2 /  X|"
    end
    
    it "another board for one bowling game" do
      io = double :io
      arr = [[2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8,10]]
      bowl = Bowl.new(io)
      expect(bowl.draw_frames(arr)).to eq " 2 / | 2 / | 2 / | 2 / | 2 / | 2 / | 2 / | 2 / | 2 / | 2 /  X|"
    end
  end

  context "draws the score after each frame" do
    it "draws the score" do
  
    end
  end

  context "draws game board for all frames with total score" do
    it "draws total score at the end" do
      io = double :io
      arr = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [10], [3,4]]
      expect(io).to receive(:puts).with("|  0  0 | 0  0 | 0  0 | 0  0 | 0  0 | 0  0 | 0  0 | 0  0 | X | 3  4 | : 24")
      bowl = Bowl.new(io)
      bowl.draw_board(arr)
    end

    it "draws total score at the end for another bowling game" do
      io = double :io
      arr = [[2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8], [2,8,10]]
      expect(io).to receive(:puts).with("|  2 / | 2 / | 2 / | 2 / | 2 / | 2 / | 2 / | 2 / | 2 / | 2 /  X| : 128")
      bowl = Bowl.new(io)
      bowl.draw_board(arr)
    end
  end
end

" ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐
│ 1 │ 4 │ 4 │ 5 │ 6 │ / │ 5 │ / │   │ * │ 0 │ 1 │ 7 │ / │ 6 │ / │   │ * │ 2 │ / │ 6 │
│   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┴───┤
│   5   │   14  │  29   │  49   │  60   │   61  │   77  │   97  │  117  │    133    │
└───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────────┘"