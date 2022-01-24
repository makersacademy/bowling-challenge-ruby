
require 'game'

describe Game do
  describe '#initialize' do
    it 'creates new game' do
      expect(Game.new).to be_a(Game)
    end

    it 'creates new scorecard class instance and saves in class variable' do
      allow(Scorecard).to receive(:new) {'test'}
      expect(Game.new.scorecard).to eq('test')
    end
  end

  describe '#start' do
    it 'start method will call enter_name and run_scorecard methods' do
      allow_any_instance_of(Object).to receive(:gets).and_return('Alex')
      game = Game.new
      expect(game).to receive(:enter_name)  
      expect(game).to receive(:run_scorecard)  
      game.start
    end
  end

  describe '#enter_name' do
    it 'puts welcome message and input of name returns that name' do
      allow_any_instance_of(Object).to receive(:gets).and_return('Alex')
      game = Game.new
      expect{game.enter_name}.to output("Welcome to the bowling scorecard, please enter your name:\n").to_stdout
      expect(game.name).to eq('Alex')
    end
  end

  describe '#run_scorecard' do
    it 'run_Scorecard will put a hello to player' do
      allow_any_instance_of(Object).to receive(:gets).and_return('Alex')
      game = Game.new
      game.enter_name
      expect{game.run_scorecard}.to output(/Hello Alex, let's begin!\n/).to_stdout
    end
  end


end