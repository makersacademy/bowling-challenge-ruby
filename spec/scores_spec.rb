require 'scores'

RSpec.describe Scores do
  it 'Frame - Adds scores of two rolls together when they amount to less than 10' do
    io = double(:io)

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('2').ordered
    expect(io).to receive(:puts).with('Frame score: 3').ordered

    game = Scores.new(io)
    game.frame
  end

  it 'Shows total score for full game, no spares no strikes' do
    io = double(:io)

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 2').ordered

    expect(io).to receive(:puts).with('Total score: 20').ordered

    game = Scores.new(io)
    game.run
  end

  it 'Last frame - 2 rolls if no spare or strike' do
    io = double(:io)

    expect(io).to receive(:puts).with('Enter score:')
    expect(io).to receive(:gets).and_return('1')
    expect(io).to receive(:puts).with('Enter score:')
    expect(io).to receive(:gets).and_return('2')
    expect(io).to receive(:puts).with('Frame score: 3')

    game = Scores.new(io)
    game.last_frame
  end

  xit 'Spare in a frame' do
    io = double(:io)

    expect(io).to receive(:puts).with('Enter score:')
    expect(io).to receive(:gets).and_return('9')
    expect(io).to receive(:puts).with('Enter score:')
    expect(io).to receive(:gets).and_return('1')
    expect(io).to receive(:puts).with('Frame score: 10')

    game = Scores.new(io)
    game.run
  end

  xit 'Strike in a frame' do
    io = double(:io)

    expect(io).to receive(:puts).with('Enter score:')
    expect(io).to receive(:gets).and_return('1')
    expect(io).to receive(:puts).with('Enter score:')
    expect(io).to receive(:gets).and_return('2')
    expect(io).to receive(:puts).with('Frame score: 3')

    game = Scores.new(io)
    game.run
  end
end