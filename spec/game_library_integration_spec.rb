require 'game_library'
require 'score_calculator'

RSpec.describe "game_library_integration" do
  context "Separates each game into 10 frames" do 
    it "Where no strikes or spares are scored" do
      game = GameLibrary.new
      standard_game_1_to_8(game)
      standard_game_9(game)
      standard_game_10(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2]]
    end

    it "Only return 10 frames when extra rolls are added " do
      game = GameLibrary.new
      standard_game_1_to_8(game)
      standard_game_9(game)
      standard_game_10(game)
      roll_21 = Roll.new
      roll_21.score = 2
      game.add(roll_21)
      roll_22 = Roll.new
      roll_22.score = 2
      game.add(roll_22)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2]]
    end

    it "Add 3 rolls in frame 10 when strike in frame 10" do
      game = GameLibrary.new
      standard_game_1_to_8(game)
      standard_game_9(game)
      roll_19 = Roll.new
      roll_19.score = 10
      game.add(roll_19)
      roll_20 = Roll.new
      roll_20.score = 2
      game.add(roll_20)
      roll_21 = Roll.new
      roll_21.score = 1
      game.add(roll_21)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10, 2, 1]]
    end

    it "Add 3 rolls in frame 10 when spare in frame 10" do
      game = GameLibrary.new
      standard_game_1_to_8(game)
      standard_game_9(game)
      roll_19 = Roll.new
      roll_19.score = 8
      game.add(roll_19)
      roll_20 = Roll.new
      roll_20.score = 2
      game.add(roll_20)
      roll_21 = Roll.new
      roll_21.score = 1
      game.add(roll_21)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2, 1]]
    end

    it "Add 1 roll in frame 9 when strike in frame 9" do
      game = GameLibrary.new
      standard_game_1_to_8(game)
      roll_17 = Roll.new
      roll_17.score = 10
      game.add(roll_17)
      standard_game_10(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[1, 2]]
    end

    it "Add 2 rolls in frame 9 when spare in frame 9" do
      game = GameLibrary.new
      standard_game_1_to_8(game)
      roll_17 = Roll.new
      roll_17.score = 8
      game.add(roll_17)
      roll_18 = Roll.new
      roll_18.score = 2
      game.add(roll_18)
      standard_game_10(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2],[1, 2]]
    end
  end

  context "Provides total score" do
    it "where no strikes or spares are scored" do
      game = GameLibrary.new
      standard_game_1_to_8(game)
      standard_game_9(game)
      standard_game_10(game)
      score = ScoreCalculator.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 3, 3, 3] 
      expect(score.total_score).to eq 30
    end
    xit "where score a strike in frame 9" do
      game = GameLibrary.new
      standard_game_1_to_8(game)
      roll_17 = Roll.new
      roll_17.score = 10
      game.add(roll_17)
      standard_game_10(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[1, 2]]
      score = ScoreCalculator.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 3, 13, 3] 
      expect(score.total_score).to eq 40
    end
  end

  private

  def standard_game_1_to_8(game)
    roll_1 = Roll.new
    roll_1.score = 1
    game.add(roll_1)
    roll_2 = Roll.new
    roll_1.score = 2
    game.add(roll_1)
    roll_3 = Roll.new
    roll_3.score = 1
    game.add(roll_3)
    roll_4 = Roll.new
    roll_4.score = 2
    game.add(roll_4)
    roll_5 = Roll.new
    roll_5.score = 1
    game.add(roll_5)
    roll_6 = Roll.new
    roll_6.score = 2
    game.add(roll_6)
    roll_7 = Roll.new
    roll_7.score = 1
    game.add(roll_7)
    roll_8 = Roll.new
    roll_8.score = 2
    game.add(roll_8)
    roll_9 = Roll.new
    roll_9.score = 1
    game.add(roll_9)
    roll_10 = Roll.new
    roll_10.score = 2
    game.add(roll_10)
    roll_11 = Roll.new
    roll_11.score = 1
    game.add(roll_11)
    roll_12 = Roll.new
    roll_12.score = 2
    game.add(roll_12)
    roll_13 = Roll.new
    roll_13.score = 1
    game.add(roll_13)
    roll_14 = Roll.new
    roll_14.score = 2
    game.add(roll_14)
    roll_15 = Roll.new
    roll_15.score = 1
    game.add(roll_15)
    roll_16 = Roll.new
    roll_16.score = 2
    game.add(roll_16)
  end

  def standard_game_9(game)
    roll_17 = Roll.new
    roll_17.score = 1
    game.add(roll_17)
    roll_18 = Roll.new
    roll_18.score = 2
    game.add(roll_18)
  end

  def standard_game_10(game)
    roll_19 = Roll.new
    roll_19.score = 1
    game.add(roll_19)
    roll_20 = Roll.new
    roll_20.score = 2
    game.add(roll_20)
  end

end
