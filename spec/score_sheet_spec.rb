require "score_sheet"

RSpec.describe ScoreSheet do
  context "#print" do
    it "prints out a header" do
      game = double(:game, complete?: true, frames: [])
      score_sheet = ScoreSheet.new(game)
      expect { score_sheet.print }.to output(include(
        "FRAME | ROLLS | TOTAL SCORE"
      )).to_stdout
    end

    it "prints out formatted lines for given frames" do
      game = double(:game,
        complete?: true,
        frames: [
          double(:fake_frame, rolls: [4,5], score: 9, status: :done),
          double(:fake_frame, rolls: [0,8], score: 8, status: :done),
          double(:fake_frame, rolls: [2,8], score: 10, status: :spare),
          double(:fake_frame, rolls: [0,1], score: 1, status: :done),
          double(:fake_frame, rolls: [10], score: 10, status: :strike)
        ]
      )
      score_sheet = ScoreSheet.new(game)
      expect { score_sheet.print }.to output(include(
        "  1.  | 4 , 5 |   9",
        "  2.  | - , 8 |  17",
        "  3.  | 2 , / |  27",
        "  4.  | - , 1 |  28",
        "  5.  | X     |  38"
      )).to_stdout
    end

    it "raises error if the game isn't complete" do
      game = double(:game, complete?: false)
      score_sheet = ScoreSheet.new(game)

      error_message = "The game must be completed to print the scorecard"
      expect { score_sheet.print }.to raise_error error_message
    end
  end
end