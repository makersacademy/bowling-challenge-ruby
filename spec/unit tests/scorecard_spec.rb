require_relative "../../lib/scorecard.rb"

describe ScoreCard do
  let(:tracker) { double :scoretracker, add_roll: true }
  let(:scoretracker_class) { double :scoretracker_class, new: tracker }
  let(:card) { ScoreCard.new(scoretracker_class) }

  #it will get user input to send to scoretracker
  describe '#initialize' do
    it 'creates a new instance of ScoreTracker' do
      scorecard = ScoreCard.new
      expect(scorecard.scores).to be_a ScoreTracker
    end
  end

  describe '#current_total' do
    it 'returns the current total' do
      allow(tracker).to receive(:see_current_total) { 10 }
      expect(card.current_total).to eq 10
    end
  end

  describe "#request_roll" do
    it "asks the player to input their roll" do
      expect(card).to receive(:gets) { '5' }
      expect{ card.request_roll }.to output("Input your roll:\n").to_stdout
    end

    it 'adds the roll to the ScoreTracker' do
      expect(tracker).to receive(:add_roll)
      allow(card).to receive(:gets) { '5' }
      card.request_roll
    end
  end

  describe "#game_end_type" do
    it "says whether a game has been a 'gutter game'" do
      allow(card).to receive(:game_over?) { true }
      allow(card).to receive(:gutter_game?) { true }
      allow(card).to receive(:perfect_game?) { false }

      expect{ card.game_end_type }.to output("Gutter Game!\n").to_stdout
    end

    it "says whether a game has been a 'perfect game'" do
      allow(card).to receive(:game_over?) { true }
      allow(card).to receive(:gutter_game?) { false }
      allow(card).to receive(:perfect_game?) { true }

      expect{ card.game_end_type }.to output("Perfect Game!\n").to_stdout
    end
  end

  describe "#perfect_game?" do
    it "returns true if the game is over and the score == 300" do
      allow(tracker).to receive(:last_frame?) { true }
      allow(tracker).to receive(:third_roll?) { false }
      allow(tracker).to receive(:fourth_roll?) { true }
      allow(tracker).to receive(:first_roll_strike?) { true }
      allow(tracker).to receive(:see_current_total) { 300 }

      expect(card.perfect_game?).to be true
    end

    it "returns false if the game if over and the score < 300" do
      allow(tracker).to receive(:last_frame?) { true }
      allow(tracker).to receive(:third_roll?) { true }
      allow(tracker).to receive(:fourth_roll?) { false }
      allow(tracker).to receive(:first_roll_strike?) { false }
      allow(tracker).to receive(:see_current_total) { 250 }

      expect(card.perfect_game?).to be false
    end
  end

  describe '#gutter_game?' do
    it "returns true if the game is over and the score == 0" do
      allow(tracker).to receive(:last_frame?) { true }
      allow(tracker).to receive(:third_roll?) { true }
      allow(tracker).to receive(:fourth_roll?) { false }
      allow(tracker).to receive(:first_roll_strike?) { false }
      allow(tracker).to receive(:see_current_total) { 0 }

      expect(card.gutter_game?).to be true
    end

    it "returns false if the game if over and the score > 0" do
      allow(tracker).to receive(:last_frame?) { true }
      allow(tracker).to receive(:third_roll?) { true }
      allow(tracker).to receive(:fourth_roll?) { false }
      allow(tracker).to receive(:first_roll_strike?) { false }
      allow(tracker).to receive(:see_current_total) { 1 }

      expect(card.gutter_game?).to be false
    end
  end

  describe '#game_over?' do
    it "returns true if first roll of frame wasn't a strike, and it's the last frame" do
      allow(tracker).to receive(:last_frame?) { true }
      allow(tracker).to receive(:third_roll?) { true }
      allow(tracker).to receive(:fourth_roll?) { false }
      allow(tracker).to receive(:first_roll_strike?) { false }

      expect(card.game_over?).to be true
    end

    it "returns false if first roll of frame was a strike, it's the last frame, but not past the 3rd roll" do
      allow(tracker).to receive(:last_frame?) { true }
      allow(tracker).to receive(:third_roll?) { true }
      allow(tracker).to receive(:fourth_roll?) { false }
      allow(tracker).to receive(:first_roll_strike?) { true }

      expect(card.game_over?).to be false
    end

    it "returns true if first roll of frame was a strike, it's the last frame, and past the 3rd roll" do
      allow(tracker).to receive(:last_frame?) { true }
      allow(tracker).to receive(:third_roll?) { false }
      allow(tracker).to receive(:fourth_roll?) { true }
      allow(tracker).to receive(:first_roll_strike?) { true }

      expect(card.game_over?).to be true
    end

    it "returns false if first roll of frame wasn't a strike, it's the last frame, and past the 3rd roll" do
      allow(tracker).to receive(:last_frame?) { true }
      allow(tracker).to receive(:third_roll?) { false }
      allow(tracker).to receive(:fourth_roll?) { true }
      allow(tracker).to receive(:first_roll_strike?) { false }

      expect(card.game_over?).to be false
    end

    it "returns false if it's not the last frame" do
      allow(tracker).to receive(:last_frame?) { false }
      allow(tracker).to receive(:third_roll?) { false }
      allow(tracker).to receive(:fourth_roll?) { false }

      expect(card.game_over?).to be false
    end
  end
end
