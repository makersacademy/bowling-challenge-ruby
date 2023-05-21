require_relative '../app.rb'

RSpec.describe Application do
  it 'will ask for roll input 20 times if no strikes' do
    io = double :io
    expect(io).to receive(:puts).exactly(20).times
    expect(io).to receive(:gets).exactly(20).times.and_return("1")

    app = Application.new(io)
    app.run_game
  end

  it 'calculates the running score of a game with no strikes or spares' do
    io = double :io
    expect(io).to receive(:puts).exactly(20).times
    expect(io).to receive(:gets).exactly(20).times.and_return("2")

    app = Application.new(io)

    expect(app.run_game).to eq 40

  end

  it 'will ask for roll input 19 times if one strike' do
    io = double :io
    expect(io).to receive(:puts).exactly(19).times
    expect(io).to receive(:gets).exactly(1).times.and_return("10")
    expect(io).to receive(:gets).exactly(18).times.and_return("1")


    app = Application.new(io)
    app.run_game
     
  end

  it 'calculates the running score of a game with 1 strike (not in the 10th frame) and no spares' do
    io = double :io
    expect(io).to receive(:puts).exactly(19).times
    expect(io).to receive(:gets).exactly(1).times.and_return("10")
    expect(io).to receive(:gets).exactly(18).times.and_return("1")

    app = Application.new(io)

    expect(app.run_game).to eq 30

  end

  it 'calculates the running score of a game with 1 spare (not in the 10th frame) and no strikes' do
    io = double :io
    expect(io).to receive(:puts).exactly(20).times
    expect(io).to receive(:gets).exactly(1).times.and_return("2")
    expect(io).to receive(:gets).exactly(1).times.and_return("8")
    expect(io).to receive(:gets).exactly(18).times.and_return("1")

    app = Application.new(io)

    expect(app.run_game).to eq 29

  end

  it 'calculates the running score of a game with 1 spare in the 10th frame and no strikes' do
    io = double :io
    expect(io).to receive(:puts).exactly(21).times
    expect(io).to receive(:gets).exactly(18).times.and_return("1")
    expect(io).to receive(:gets).exactly(1).times.and_return("2")
    expect(io).to receive(:gets).exactly(1).times.and_return("8")
    expect(io).to receive(:gets).exactly(1).times.and_return("1")


    app = Application.new(io)

    expect(app.run_game).to eq 29

  end

  it 'calculates the running score of a game with 1 strike in the 10th frame and no spares' do
    io = double :io
    expect(io).to receive(:puts).exactly(21).times
    expect(io).to receive(:gets).exactly(18).times.and_return("1")
    expect(io).to receive(:gets).exactly(1).times.and_return("10")
    expect(io).to receive(:gets).exactly(1).times.and_return("1")
    expect(io).to receive(:gets).exactly(1).times.and_return("1")


    app = Application.new(io)

    expect(app.run_game).to eq 30

  end

  it 'calculates the running score of a game with all strikes' do
    io = double :io
    expect(io).to receive(:puts).exactly(12).times
    expect(io).to receive(:gets).exactly(12).times.and_return("10")

    app = Application.new(io)

    expect(app.run_game).to eq 300

  end

  it 'calculates the running score of a game with all spares' do
    io = double :io
    expect(io).to receive(:puts).exactly(21).times
    expect(io).to receive(:gets).exactly(21).times.and_return("5")

    app = Application.new(io)

    expect(app.run_game).to eq 150

  end

  it 'calculates the running score of a game with a mix of spares and strikes' do
    io = double :io
    expect(io).to receive(:puts).exactly(17).times
    expect(io).to receive(:gets).exactly(2).times.and_return("5")
    expect(io).to receive(:gets).exactly(1).times.and_return("10")
    expect(io).to receive(:gets).exactly(2).times.and_return("5")
    expect(io).to receive(:gets).exactly(1).times.and_return("10")
    expect(io).to receive(:gets).exactly(2).times.and_return("5")
    expect(io).to receive(:gets).exactly(1).times.and_return("10")
    expect(io).to receive(:gets).exactly(2).times.and_return("5")
    expect(io).to receive(:gets).exactly(1).times.and_return("10")
    expect(io).to receive(:gets).exactly(2).times.and_return("5")
    expect(io).to receive(:gets).exactly(1).times.and_return("10")
    expect(io).to receive(:gets).exactly(2).times.and_return("5")


    app = Application.new(io)

    expect(app.run_game).to eq 200

  end

  



end