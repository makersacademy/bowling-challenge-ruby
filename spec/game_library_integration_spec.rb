require 'game_library'
require 'score_calculator'

RSpec.describe "game_library_integration" do
  context "Separates each game into 10 frames" do 
    it "Where no strikes or spares are scored" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      standard_game_frame(game)
      standard_game_frame(game)
      standard_game_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2]]
    end

    it "Only return 10 frames when extra rolls are added " do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      standard_game_frame(game)
      standard_game_frame(game)
      standard_game_frame(game)
      standard_game_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2]]
    end

    it "Add 3 rolls in frame 10 when strike in frame 10" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      standard_game_frame(game)
      standard_game_frame(game)
      strike_game_frame(game)
      standard_game_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10, 1, 2]]
    end

    it "Add 3 rolls in frame 10 when spare in frame 10" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      standard_game_frame(game)
      standard_game_frame(game)
      roll_1 = Roll.new
      roll_1.score = 8
      game.add(roll_1)
      roll_3 = Roll.new
      roll_3.score = 2
      game.add(roll_3)
      roll_3 = Roll.new
      roll_3.score = 1
      game.add(roll_3)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2, 1]]
    end

    it "Add 1 roll in frame 9 when strike in frame 9" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      standard_game_frame(game)
      strike_game_frame(game)
      standard_game_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[1, 2]]
    end

    it "Add 2 rolls in frame 9 when spare in frame 9" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      standard_game_frame(game)
      roll_1 = Roll.new
      roll_1.score = 8
      game.add(roll_1)
      roll_2 = Roll.new
      roll_2.score = 2
      game.add(roll_2)
      standard_game_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2],[1, 2]]
    end
  end

  context "Returns total score" do
    it "where no strikes or spares are scored" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      standard_game_frame(game)
      standard_game_frame(game)
      standard_game_frame(game)
      score = ScoreCalculator.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 3, 3, 3] 
      expect(score.total_score).to eq 30
    end
    it "where score a strike in frame 9" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      standard_game_frame(game)
      strike_game_frame(game)
      standard_game_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[1, 2]]
      score = ScoreCalculator.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 3, 13, 3] 
      expect(score.total_score).to eq 40
    end
    it "where score a strike in frame 8 and frame 9" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      strike_game_frame(game)
      strike_game_frame(game)
      standard_game_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[10],[1, 2]]
      score = ScoreCalculator.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 21, 13, 3] 
      expect(score.total_score).to eq 58
    end
    it "where score a strike in frame 8, frame 9 and frame 10" do
      game = GameLibrary.new
      standard_game_1_to_7(game)
      strike_game_frame(game)
      strike_game_frame(game)
      strike_game_frame(game)
      standard_game_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[10],[10, 1, 2]]
      score = ScoreCalculator.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 30, 21, 13] 
      expect(score.total_score).to eq 85
    end

    it "total equal 300 when perfect score " do
      game = GameLibrary.new
      roll = Roll.new
      roll.score = 10
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)
      game.add(roll)

      expect(game.rolls_by_frame).to eq [[10],[10],[10],[10],[10],[10],[10],[10],[10],[10, 10, 10]]
      score = ScoreCalculator.new(game)
      expect(score.score_by_frame).to eq [30, 30, 30, 30, 30, 30, 30, 30, 30, 30] 
      expect(score.total_score).to eq 300
    end

  end

  private

  def standard_game_1_to_7(game)
    roll_1 = Roll.new
    roll_1.score = 1
    game.add(roll_1)
    roll_2 = Roll.new
    roll_2.score = 2
    game.add(roll_2)
    game.add(roll_1)
    game.add(roll_2)
    game.add(roll_1)
    game.add(roll_2) 
    game.add(roll_1)
    game.add(roll_2) 
    game.add(roll_1)
    game.add(roll_2) 
    game.add(roll_1)
    game.add(roll_2) 
    game.add(roll_1)
    game.add(roll_2)
  end

  def standard_game_frame(game)
    roll_1 = Roll.new
    roll_1.score = 1
    game.add(roll_1)
    roll_2 = Roll.new
    roll_2.score = 2
    game.add(roll_2)
  end

  def strike_game_frame(game)
    roll = Roll.new
    roll.score = 10
    game.add(roll)
  end

end
