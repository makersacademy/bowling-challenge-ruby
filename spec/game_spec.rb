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
end