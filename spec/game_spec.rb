require 'game'

RSpec.describe Game do 
  context 'one player game' do
    it 'plays a gutter game' do
      player = Player.new('Lebowski')
      expect(player.final_score).to eq 0
    end

    it 'sets up the game' do
      io = double :io
      game = Game.new('Lebowski',io)
      expect(game.player.name).to eq 'Lebowski'
      expect(game.scorecard).to eq []
    end

    xit 'plays a game with one spare' do
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

      game = Game.new('Lebowski', io)
      game.play_game
  
      expect(game.game_result).to eq 50
    end

    xit 'plays a game with no spares or strikes' do
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

      game = Game.new('Lebowski', io)
      game.play_game
  
      expect(game.game_result).to eq 60
    end

    xit 'plays a game with a spare and a strike' do
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

      game = Game.new('Lebowski', io)
      game.play_game
  
      expect(game.game_result).to eq 74
    end

    xit 'plays a game with two strikes in a row' do
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

      game = Game.new('Lebowski', io)
      game.play_game
  
      expect(game.game_result).to eq 84
    end

    xit 'spare in frame 10' do
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

      game = Game.new('Lebowski', io)
      game.play_game
  
      expect(game.game_result).to eq 57
    end

    xit 'strike in frame 10' do
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

      game = Game.new('Lebowski', io)
      game.play_game
  
      expect(game.game_result).to eq 62
    end

    it 'perfect game' do
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

      game = Game.new('Lebowski', io)
      game.play_game
  
      expect(game.game_result).to eq 300
    end
  end
end