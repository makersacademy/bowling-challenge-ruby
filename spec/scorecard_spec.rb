require 'scorecard'

describe Scorecard do
  it 'gutter game' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 0
  end

  it 'no spares or strikes' do

    game = Scorecard.new(
      one: [1,3],
      two: [1,2],
      three: [2,5],
      four: [3,2],
      five: [1,3],
      six: [3,2],
      seven: [1,2],
      eight: [2,2],
      nine: [2,2],
      ten: [4,1,0]
    )
    expect(game.score).to eq 44
  end

  it 'one spare' do

    game = Scorecard.new(
      one: [4,6],
      two: [5,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 20
  end

  it 'two spares' do

    game = Scorecard.new(
      one: [4,6],
      two: [5,5],
      three: [4,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 33
  end

  it 'four spares' do

    game = Scorecard.new(
      one: [4,6],
      two: [5,5],
      three: [4,6],
      four: [0,0],
      five: [5,5],
      six: [5,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 59
  end

  it 'one strike' do
    game = Scorecard.new(
      one: [10,0],
      two: [3,5],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 26
  end
  it 'one strike and one spare' do
    game = Scorecard.new(
      one: [10,0],
      two: [3,7],
      three: [4,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 38
  end
  it 'one strike, one spare and one strike' do
    game = Scorecard.new(
      one: [10,0],
      two: [3,7],
      three: [10,0],
      four: [3,2],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 60
  end

  it 'two strikes in a row' do
    game = Scorecard.new(
      one: [10,0],
      two: [10,0],
      three: [4,2],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 46
  end

  it 'two strikes in a row and a spare' do
    game = Scorecard.new(
      one: [10,0],
      two: [10,0],
      three: [4,6],
      four: [5,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 64
  end

  it 'four strikes and two spare' do
    game = Scorecard.new(
      one: [10,0],
      two: [10,0],
      three: [4,6],
      four: [10,0],
      five: [0,10],
      six: [10,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [0,0,0]
    )
    expect(game.score).to eq 114
  end

  it 'strikes on ninth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [10,0],
      ten: [4,2,0]
    )
    expect(game.score).to eq 22
  end

  it 'strikes on tenth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [10,2,4]
    )
    expect(game.score).to eq 16
  end

  it 'double strike before tenth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [10,0],
      nine: [10,0],
      ten: [4,2,0]
    )
    expect(game.score).to eq 46
  end
  it 'spare on tenth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [4,6,5]
    )
    expect(game.score).to eq 15
  end
  it 'strike on ninth and spare on tenth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [10,0],
      ten: [4,6,5]
    )
    expect(game.score).to eq 35
  end
  it 'strike on eigth & ninth and spare on tenth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [10,0],
      nine: [10,0],
      ten: [4,6,5]
    )
    expect(game.score).to eq 59
  end
  it 'strike on tenth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [0,0],
      ten: [10,6,5]
    )
    expect(game.score).to eq 21
  end
  it 'strike on ninth & tenth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [0,0],
      nine: [10,0],
      ten: [10,6,5]
    )
    expect(game.score).to eq 47
  end
  it 'strike on eighth, ninth & tenth frame' do

    game = Scorecard.new(
      one: [0,0],
      two: [0,0],
      three: [0,0],
      four: [0,0],
      five: [0,0],
      six: [0,0],
      seven: [0,0],
      eight: [10,0],
      nine: [10,0],
      ten: [10,6,5]
    )
    expect(game.score).to eq 77
  end

  it 'almost perfect game missed last two rolls' do

    game = Scorecard.new(
      one: [10,0],
      two: [10,0],
      three: [10,0],
      four: [10,0],
      five: [10,0],
      six: [10,0],
      seven: [10,0],
      eight: [10,0],
      nine: [10,0],
      ten: [10,0,0]
    )
    expect(game.score).to eq 270
  end

  it 'almost perfect game missed last roll' do

    game = Scorecard.new(
      one: [10,0],
      two: [10,0],
      three: [10,0],
      four: [10,0],
      five: [10,0],
      six: [10,0],
      seven: [10,0],
      eight: [10,0],
      nine: [10,0],
      ten: [10,10,0]
    )
    expect(game.score).to eq 290
  end

  it 'perfect game' do

    game = Scorecard.new(
      one: [10,0],
      two: [10,0],
      three: [10,0],
      four: [10,0],
      five: [10,0],
      six: [10,0],
      seven: [10,0],
      eight: [10,0],
      nine: [10,0],
      ten: [10,10,10]
    )
    expect(game.score).to eq 300
  end

end