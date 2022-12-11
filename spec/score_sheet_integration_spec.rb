require "score_sheet"
require "game"

RSpec.describe "ScoreSheet Integration" do
  context "game isn't complete" do
    it "raises error trying tp print scorecard" do
      game = Game.new
      score_sheet = ScoreSheet.new(game)

      error_message = "The game must be completed to print the scorecard"
      expect { score_sheet.print }.to raise_error error_message
    end
  end

  context "gutter game" do
    it "prints a properly formatted gutter game with a score of zero" do
      game = Game.new
      score_sheet = ScoreSheet.new(game)

      20.times { game.add_roll(0) }

      expect { score_sheet.print }.to output(
        include("| - , - |   0").exactly(10).times
      ).to_stdout
    end
  end

  context "game of all 4s" do
    it "prints a formatted score sheet" do
      game = Game.new
      score_sheet = ScoreSheet.new(game)

      20.times { game.add_roll(4) }

      expect { score_sheet.print }.to output(include(
        "  2.  | 4 , 4 |  16",
        "  6.  | 4 , 4 |  48",
        " 10.  | 4 , 4 |  80",
      )).to_stdout
    end
  end

  context "game with a strike and a spare (without bonuses)" do
    it "prints a formatted score sheet" do
      game = Game.new
      score_sheet = ScoreSheet.new(game)

      game.add_roll(10)
      2.times { game.add_roll(0) }
      game.add_roll(9)
      game.add_roll(1)
      14.times { game.add_roll(0) }

      expect { score_sheet.print }.to output(include(
        "  1.  | X     |  10",
        "  2.  | - , - |  10",
        "  3.  | 9 , / |  20"
      )).to_stdout
    end
  end
end
