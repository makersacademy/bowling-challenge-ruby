require 'scoreboard'

RSpec.describe Scoreboard do 

  it 'sets up the scoreboard' do
    io = double :io
    scoreboard = Scoreboard.new('Lebowski',io)
    expect(scoreboard.player.name).to eq 'Lebowski'
    expect(scoreboard.scorecard).to eq []
  end

  context 'one player plays bowling and' do
    it 'plays a gutter game' do
      player = Player.new('Lebowski')
      expect(player.final_score).to eq 0
    end

    it 'has a game with no spares or strikes' do
      io = double :io

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      scoreboard = Scoreboard.new('Lebowski', io)
      scoreboard.play_game
  
      expect(scoreboard.game_result).to eq 50
    end

    it 'has a game with one spare' do
      io = double :io

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      scoreboard = Scoreboard.new('Lebowski', io)
      scoreboard.play_game
  
      expect(scoreboard.game_result).to eq 60
    end

    it 'has a game with a spare and a strike' do
      io = double :io

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("2").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      scoreboard = Scoreboard.new('Lebowski', io)
      scoreboard.play_game
  
      expect(scoreboard.game_result).to eq 74
    end

    it 'plays a game with two strikes in a row' do
      io = double :io

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("2").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      scoreboard = Scoreboard.new('Lebowski', io)
      scoreboard.play_game
  
      expect(scoreboard.game_result).to eq 84
    end

    it 'rolls a spare in frame 10' do
      io = double :io

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll three").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("2").ordered

      scoreboard = Scoreboard.new('Lebowski', io)
      scoreboard.play_game
  
      expect(scoreboard.game_result).to eq 57
    end

    it 'rolls a strike in frame 10' do
      io = double :io

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("0").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("5").ordered
      expect(io).to receive(:puts).with("roll three").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("2").ordered

      scoreboard = Scoreboard.new('Lebowski', io)
      scoreboard.play_game
  
      expect(scoreboard.game_result).to eq 62
    end

    it 'has a perfect game' do
      io = double :io

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered


      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
    

      expect(io).to receive(:puts).with("roll one").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
      expect(io).to receive(:puts).with("roll two").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered
      expect(io).to receive(:puts).with("roll three").ordered
      expect(io).to receive(:puts).with("enter the number of pins knocked down").ordered
      expect(io).to receive(:gets).and_return("10").ordered

      scoreboard = Scoreboard.new('Lebowski', io)
      scoreboard.play_game
  
      expect(scoreboard.game_result).to eq 300
    end
  end
end