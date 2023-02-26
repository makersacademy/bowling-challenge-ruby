require_relative '../lib/game'

describe Game do
  it 'can initialize with 10 frames inside @frames array' do
    game = Game.new
    expect(game.frames.length).to eq(10)
  end

  it 'can add two rolls to same nested array in @frames array' do
    game = Game.new
    game.roll(5)
    game.roll(4)
    first_frame = game.frames[0]
    expect(first_frame.rolls).to eq([5, 4])
  end

  it 'can add multiple rolls and assign to correct frame' do
    game = Game.new
    game.roll(5)
    game.roll(4)
    game.roll(6)
    game.roll(7)
    current_frame = game.frames[1]
    expect(current_frame.rolls).to eq([6, 7])
  end  

  it 'can add rolls to correct frame and account for strike' do
    game = Game.new
    game.roll(5)
    game.roll(4)
    game.roll(10)
    game.roll(6)
    game.roll(7)
    current_frame = game.frames[1]
    expect(current_frame.rolls).to eq([10])
  end  

  context 'calculates bowling score' do
    it 'returns totalscore of 133 based on scores from README example' do
      game = Game.new
      pins = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
      pins.each do |pin|
        game.roll(pin)
      end
      expect(game.total_score).to eq(133)
    end  

    it 'returns score 300 for perfect game' do
      game = Game.new
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
      game.roll(10)
    end  
  end 
  
end    
