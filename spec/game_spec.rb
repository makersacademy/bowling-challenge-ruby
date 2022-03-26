require 'game'
describe Game do 

  let(:game) { Game.new(0) }

  context 'I want the game to have 10 frames' do

    before do
      allow(Player).to receive(:gets).and_return(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
    end   

    it 'runs 10 times' do
      p "This test is expected to have 0 sum"
      expect(game).to receive(:start_frame).exactly(10).times
      game.start_game 
    end

  end

  context 'I want to know my score so far after each frame' do

    before do
      allow(Player).to receive(:gets).and_return(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
    end   

    it 'Sums score of 1 per game = 20' do
      game.start_game
      expect(game.total_score).to eq 20
    end

  end

  context 'I want to receive a bonus for a Strike' do

    it 'first strike' do
      allow(Player).to receive(:gets).and_return(10,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
      game.start_game
      expect(game.total_score).to eq 30
    end

    it 'first 2 strike' do
      allow(Player).to receive(:gets).and_return(10,10,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
      game.start_game
      expect(game.total_score).to eq 49
    end

    it 'multiple strikes' do
      allow(Player).to receive(:gets).and_return(10,10,10,10,10,1,1,1,1,1,1,1,1,1,1)
      game.start_game
      expect(game.total_score).to eq 133
    end

  end

  context 'I want to receive a bonus for a Spare' do

    it 'first spare' do
      allow(Player).to receive(:gets).and_return(2,8,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
      game.start_game
      expect(game.total_score).to eq 29
    end

    it 'strike + spare + spare' do
      allow(Player).to receive(:gets).and_return(10,2,8,9,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
      game.start_game
      expect(game.total_score).to eq 64
    end

  end

  context 'My 10th frame should go for no longer than 3 rolls in total' do

    it 'last 3 rolls of 10th frame are strike' do
      allow(Player).to receive(:gets).and_return(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,10,10)
      game.start_game
      expect(game.total_score).to eq 30
    end

    it 'last 5 are strikes' do
      allow(Player).to receive(:gets).and_return(0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,10,10,10,10)
      game.start_game
      expect(game.total_score).to eq 90
    end

    it '9th round is a spare' do
      allow(Player).to receive(:gets).and_return(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,1,2,0)
      game.start_game
      expect(game.total_score).to eq 14
    end

  end

  context 'I want to be informed that I scored a Perfect Game' do

    it 'scores a perfect game' do
      allow(Player).to receive(:gets).and_return(10,10,10,10,10,10,10,10,10,10,10)
      game.start_game
      expect{ game.gameover }.to output(include("A score of 300, that's a perfect game! well done")).to_stdout
    end

  end

  context 'I want to be informed that I scored a Gutter Game' do

    it 'scores a gutter game' do
      allow(Player).to receive(:gets).and_return(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
      game.start_game
      expect{ game.gameover }.to output(include("A score of 0, really?? well done on your gutter game")).to_stdout
    end

  end

  context 'I want to be informed of my final score' do

    it 'scores a gutter game' do
      allow(Player).to receive(:gets).and_return(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
      game.start_game
      expect{ game.gameover }.to output(include("Game Over, you scored 2")).to_stdout
    end

  end


end