require 'game'

context 'gets user input' do
  it 'gets first and second balls' do
    io = double :io
    expect(io).to receive(:gets).and_return("5").ordered
    expect(io).to receive(:gets).and_return("3").ordered
  
    
    game = Game.new(io)
    game.play
  end

end

context 'Play one ball' do
  it 'frame_1 ball is 5' do
    io = double :io
    expect(io).to receive(:gets).and_return("5").ordered
    expect(io).to receive(:gets).and_return("3").ordered
  
    
    game = Game.new(io)
    game.play

    frame_1 = game.game_scores.values[0]

    expect(frame_1[0]).to eq(5)
  end
end

context 'Play one frame' do
  it 'frame_1 contains ball 1 and 2' do
    io = double :io
    expect(io).to receive(:gets).and_return("5").ordered
    expect(io).to receive(:gets).and_return("3").ordered
  
    
    game = Game.new(io)
    game.play

    frame_1 = game.game_scores.values[0]

    expect(frame_1).to eq([5, 3])
  end
end

