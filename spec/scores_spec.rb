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

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('2').ordered
    expect(io).to receive(:puts).with('Frame score: 3').ordered

    game = Scores.new(io)
    game.last_frame
  end

  it 'Last frame - 3 rolls if there is a spare or strike' do
    io = double(:io)

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('3').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('7').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('3').ordered
    expect(io).to receive(:puts).with('Frame score: 13').ordered

    game = Scores.new(io)
    game.last_frame
  end

  it 'Spare adds bonus points from first roll' do
    io = double(:io)

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('9').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('1').ordered
    expect(io).to receive(:puts).with('Frame score: 10').ordered

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('2').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('3').ordered
    expect(io).to receive(:puts).with('Frame score: 5').ordered

    expect(io).to receive(:puts).with('Total score: 17').ordered

    game = Scores.new(io)
    game.frame
    game.frame
    game.total
  end

  it 'Strike adds bonus points from first and second roll' do
    io = double(:io)

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('10').ordered

    
    expect(io).to receive(:puts).with('Frame score: 10').ordered

    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('4').ordered
    expect(io).to receive(:puts).with('Enter score:').ordered
    expect(io).to receive(:gets).and_return('5').ordered
    expect(io).to receive(:puts).with('Frame score: 9').ordered

    expect(io).to receive(:puts).with('Total score: 28').ordered

    game = Scores.new(io)
    game.frame
    game.frame
    game.total
  end
end