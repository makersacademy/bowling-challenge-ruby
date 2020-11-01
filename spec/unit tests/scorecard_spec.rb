require_relative "../../lib/scorecard.rb"

describe ScoreCard do
  let(:tracker) { double :scoretracker }
  let(:scoretracker_class) { double :scoretracker_class, new: tracker }
  let(:card) { ScoreCard.new }

  #it will get user input to send to scoretracker
  describe '#initialize' do
    it 'creates a new instance of ScoreTracker' do
      expect(card.scores).to be_a ScoreTracker
    end
  end

  describe "#request_roll" do
    it "asks the player to input their roll" do
      expect(card).to receive(:gets) { '5' }
      expect{ card.request_roll }.to output("Input your roll:\n").to_stdout
    end
  end
  #it will present score after each roll
  #it will say whether a game was perfect or a gutter game
end
