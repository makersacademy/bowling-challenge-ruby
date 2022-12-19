require 'game'
require 'score'
require 'test_frames'

RSpec.describe "bowling_integration" do
  context "Returns total score when all frames complete" do
    it "total equal 0 when gutter game " do
      game = Game.new
      20.times {gutter_roll(game)}
      expect(game.view_completed_frames).to eq [[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0],[0, 0]]
      score = Score.new(game)
      expect(score.score_by_frame).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
      expect(score.total_score).to eq 0
    end

    it "when no strikes or spares are scored" do
      game = Game.new
      10.times {standard_frame(game)}
      score = Score.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 3, 3, 3] 
      expect(score.total_score).to eq 30
    end
    it "when score a strike in frame 9" do
      game = Game.new
      8.times {standard_frame(game)}
      strike_frame(game)
      standard_frame(game)
      expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[1, 2]]
      score = Score.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 3, 13, 3] 
      expect(score.total_score).to eq 40
    end
    it "when score a strike in frame 8 and frame 9" do
      game = Game.new
      7.times {standard_frame(game)}
      2.times {strike_frame(game)}
      standard_frame(game)
      expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[10],[1, 2]]
      score = Score.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 21, 13, 3] 
      expect(score.total_score).to eq 58
    end
    it "when score a strike in frame 8, frame 9 and frame 10" do
      game = Game.new
      7.times {standard_frame(game)}
      3.times {strike_frame(game)}
      standard_frame(game)
      expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[10],[10, 1, 2]]
      score = Score.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 30, 21, 13] 
      expect(score.total_score).to eq 85
    end

    it "total equal 300 when perfect score " do
      game = Game.new
      12.times {strike_frame(game)}
      expect(game.view_completed_frames).to eq [[10],[10],[10],[10],[10],[10],[10],[10],[10],[10, 10, 10]]
      score = Score.new(game)
      expect(score.score_by_frame).to eq [30, 30, 30, 30, 30, 30, 30, 30, 30, 30] 
      expect(score.total_score).to eq 300
    end

    it "when score a spare in frame 9" do
      game = Game.new
      8.times {standard_frame(game)}
      spare_frame(game)
      standard_frame(game)
      expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2],[1, 2]]
      score = Score.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 3, 11, 3] 
      expect(score.total_score).to eq 38
    end

    it "when score a spare in frame 10" do
      game = Game.new
      9.times {standard_frame(game)}
      spare_frame(game)
      extra_roll(game)
      expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2, 1]]
      score = Score.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 3, 3, 11] 
      expect(score.total_score).to eq 38
    end

    it "when score a few spares and strikes" do
      game = Game.new
      3.times {standard_frame(game)}
      2.times {spare_frame(game)}
      2.times {strike_frame(game)}
      2.times {standard_frame(game)}
      2.times {strike_frame(game)}
      extra_roll(game)
      expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[8, 2],[8, 2],[10],[10],[1, 2],[1, 2],[10, 10, 1]]
      score = Score.new(game)
      expect(score.score_by_frame).to eq [3, 3, 3, 18, 20, 21, 13, 3, 3, 21] 
      expect(score.total_score).to eq 108
    end

    context "Returns total score when partial game" do
      it "when 5 frames completed and no strikes or spares are scored" do
        game = Game.new
        5.times {standard_frame(game)}
        score = Score.new(game)
        expect(score.score_by_frame).to eq [3, 3, 3, 3, 3] 
        expect(score.total_score).to eq 15
      end

      it "when 8 frames are completed score a strike in frame 8" do
        game = Game.new
        7.times {standard_frame(game)}
        strike_frame(game)
        expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10]]
        score = Score.new(game)
        expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 10] 
        expect(score.total_score).to eq 31
      end

      it  "when 8 frames are completed score a spare in frame 8" do
        game = Game.new
        7.times {standard_frame(game)}
        spare_frame(game)
        expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2]]
        score = Score.new(game)
        expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 10] 
        expect(score.total_score).to eq 31
      end

      it "when 8 frame and one roll are completed and a spare in frame 8" do
        game = Game.new
        7.times {standard_frame(game)}
        spare_frame(game)
        game.add(1)
        expect(game.view_completed_frames).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2]]
        score = Score.new(game)
        expect(score.score_by_frame).to eq [3, 3, 3, 3, 3, 3, 3, 11, 1] 
        expect(score.total_score).to eq 33
      end
    end
  end

end
