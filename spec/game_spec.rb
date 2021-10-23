require 'game'

describe Game do

  let(:game) { Game.new }
  describe '#new' do

    it "has ten frames" do
      expect(game.frames.length).to eq 10
      # expect(game.first).to be_a Frame
    end

  end

  describe '#score' do

    it "has a current score" do
      expect(game.current_score).to be_an Integer
    end

  end

  



end