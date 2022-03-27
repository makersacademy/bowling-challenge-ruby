require 'game'

describe Game do
  it 'can add the number of pins down to a frame' do
    expect(subject.bowl(4)).to eq [
      {pins: [4], total: 4 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  it 'starts a new frame every 2 bowls' do
    game = Game.new
    bowl1 = game.bowl(4)
    bowl2 = game.bowl(3)
    bowl3 = game.bowl(8)
    bowl4 = game.bowl(1)
    expect(game.bowl(9)).to eq [
      {pins: [4, 3], total: 7 },
      {pins: [8, 1], total: 9 },
      {pins: [9], total: 9 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  it 'adds a bonus for a spare' do
    game = Game.new
    bowl1 = game.bowl(2)
    bowl2 = game.bowl(8)
    bowl3 = game.bowl(2)
    bowl4 = game.bowl(7)
    bowl5 = game.bowl(9) 
    bowl6 = game.bowl(1) 
    bowl7 = game.bowl(5)  
    expect(game.bowl(0)).to eq [
      {pins: [2, 8], total: 12 },
      {pins: [2, 7], total: 9 },
      {pins: [9, 1], total: 15 },
      {pins: [5, 0], total: 5 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  it 'adds correct bonus if spare follows a spare' do
    game = Game.new
    bowl1 = game.bowl(2)
    bowl2 = game.bowl(8)
    bowl3 = game.bowl(7)
    bowl4 = game.bowl(3)
    bowl5 = game.bowl(4) 
    bowl6 = game.bowl(5)  
    expect(game.bowl(0)).to eq [
      {pins: [2, 8], total: 17 },
      {pins: [7, 3], total: 14 },
      {pins: [4, 5], total: 9 },
      {pins: [0], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  it 'adds a bonus for a strike' do
    game = Game.new
    bowl1 = game.bowl(2)
    bowl2 = game.bowl(7)
    bowl3 = game.bowl(10)
    bowl4 = game.bowl(3)
    bowl5 = game.bowl(4) 
    bowl6 = game.bowl(5)  
    expect(game.bowl(0)).to eq [
      {pins: [2, 7], total: 9 },
      {pins: [10], total: 17 },
      {pins: [3, 4], total: 7 },
      {pins: [5, 0], total: 5 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  it 'adds correct bonus if strike follows a spare' do
    game = Game.new
    bowl1 = game.bowl(2)
    bowl2 = game.bowl(8)
    bowl3 = game.bowl(10)
    bowl4 = game.bowl(3)
    bowl5 = game.bowl(4) 
    bowl6 = game.bowl(5)  
    expect(game.bowl(0)).to eq [
      {pins: [2, 8], total: 20 },
      {pins: [10], total: 17 },
      {pins: [3, 4], total: 7 },
      {pins: [5, 0], total: 5 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  it 'adds correct bonus if spare follows a strike' do
    game = Game.new
    bowl1 = game.bowl(2)
    bowl2 = game.bowl(7)
    bowl3 = game.bowl(10)
    bowl4 = game.bowl(3)
    bowl5 = game.bowl(7) 
    bowl6 = game.bowl(5)  
    expect(game.bowl(0)).to eq [
      {pins: [2, 7], total: 9 },
      {pins: [10], total: 20 },
      {pins: [3, 7], total: 15 },
      {pins: [5, 0], total: 5 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  it 'adds correct bonus if strike follows a strike' do
    game = Game.new
    bowl1 = game.bowl(2)
    bowl2 = game.bowl(7)
    bowl3 = game.bowl(10)
    bowl4 = game.bowl(10)
    bowl5 = game.bowl(7) 
    bowl6 = game.bowl(2)  
    expect(game.bowl(5)).to eq [
      {pins: [2, 7], total: 9 },
      {pins: [10], total: 27 },
      {pins: [10], total: 19 },
      {pins: [7, 2], total: 9 },
      {pins: [5], total: 5 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 },
      {pins: [], total: 0 }
    ]
  end

  it 'allows a 3rd turn in frame 10 if stike scored and provides score' do
    game = Game.new
    bowl1 = game.bowl(2)
    bowl2 = game.bowl(7)
    bowl3 = game.bowl(10)
    bowl4 = game.bowl(10)
    bowl5 = game.bowl(7) 
    bowl6 = game.bowl(2)  
    bowl7 = game.bowl(9)  
    bowl8 = game.bowl(1)  
    bowl9 = game.bowl(4)  
    bowl10 = game.bowl(4)  
    bowl11 = game.bowl(0)  
    bowl12 = game.bowl(0)   
    bowl13 = game.bowl(10)  
    bowl14 = game.bowl(10)  
    bowl15 = game.bowl(10)
    bowl16 = game.bowl(10)
    expect(game.bowl(0)).to eq [
      {pins: [2, 7], total: 9 },
      {pins: [10], total: 27 },
      {pins: [10], total: 19 },
      {pins: [7, 2], total: 9 },
      {pins: [9, 1], total: 14 },
      {pins: [4, 4], total: 8 },
      {pins: [0, 0], total: 0 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10, 10, 0], total: 20 }
    ]
  end

  it 'allows a 3rd turn in frame 10 if spare scored and provides score' do
    game = Game.new
    bowl1 = game.bowl(2)
    bowl2 = game.bowl(7)
    bowl3 = game.bowl(10)
    bowl4 = game.bowl(10)
    bowl5 = game.bowl(7) 
    bowl6 = game.bowl(2)  
    bowl7 = game.bowl(9)  
    bowl8 = game.bowl(1)  
    bowl9 = game.bowl(4)  
    bowl10 = game.bowl(4)  
    bowl11 = game.bowl(0)  
    bowl12 = game.bowl(0)   
    bowl13 = game.bowl(10)  
    bowl14 = game.bowl(5)  
    bowl15 = game.bowl(4)
    bowl16 = game.bowl(4)
    bowl17 = game.bowl(6)
    expect(game.bowl(5)).to eq [
      {pins: [2, 7], total: 9 },
      {pins: [10], total: 27 },
      {pins: [10], total: 19 },
      {pins: [7, 2], total: 9 },
      {pins: [9, 1], total: 14 },
      {pins: [4, 4], total: 8 },
      {pins: [0, 0], total: 0 },
      {pins: [10], total: 19 },
      {pins: [5, 4], total: 9 },
      {pins: [4, 6, 5], total: 15 }
    ]
  end

  it '10th frame starts with strike returns appropriate bonus' do
    game = Game.new
    bowl1 = game.bowl(10)
    bowl2 = game.bowl(10)
    bowl3 = game.bowl(10)
    bowl4 = game.bowl(10)
    bowl5 = game.bowl(10) 
    bowl6 = game.bowl(10)  
    bowl7 = game.bowl(10)  
    bowl8 = game.bowl(10)  
    bowl9 = game.bowl(10)  
    bowl10 = game.bowl(10)  
    bowl11 = game.bowl(2)  
    expect(game.bowl(2)).to eq [
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 22 },
      {pins: [10, 2, 2], total: 14 },
    ]
  end

  it 'perfect game' do
    game = Game.new
    bowl1 = game.bowl(10)
    bowl2 = game.bowl(10)
    bowl3 = game.bowl(10)
    bowl4 = game.bowl(10)
    bowl5 = game.bowl(10) 
    bowl6 = game.bowl(10)  
    bowl7 = game.bowl(10)  
    bowl8 = game.bowl(10)  
    bowl9 = game.bowl(10)  
    bowl10 = game.bowl(10)  
    bowl11 = game.bowl(10)  
    expect(game.bowl(10)).to eq [
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10], total: 30 },
      {pins: [10, 10, 10], total: 30 },
    ]
  end

  it 'gutter game' do
    game = Game.new
    bowl1 = game.bowl(0)
    bowl2 = game.bowl(0)
    bowl3 = game.bowl(0)
    bowl4 = game.bowl(0)
    bowl5 = game.bowl(0) 
    bowl6 = game.bowl(0)  
    bowl7 = game.bowl(0)  
    bowl8 = game.bowl(0)  
    bowl9 = game.bowl(0)  
    bowl10 = game.bowl(0) 
    bowl11 = game.bowl(0) 
    bowl12 = game.bowl(0) 
    bowl13 = game.bowl(0) 
    bowl14 = game.bowl(0) 
    bowl15 = game.bowl(0) 
    bowl16 = game.bowl(0) 
    bowl17 = game.bowl(0) 
    bowl18 = game.bowl(0) 
    bowl19 = game.bowl(0) 
    expect(game.bowl(0)).to eq [
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 },
      {pins: [0, 0], total: 0 }
    ]
  end
end