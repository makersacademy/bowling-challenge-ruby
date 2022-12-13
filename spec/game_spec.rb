require 'game'

RSpec.describe Game do
  context "Separates each game into 10 frames" do 
    it "when no strikes or spares are scored" do
      game = Game.new
      10.times {standard_frame(game)}
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2]]
    end

    it "Only return 10 frames when extra rolls are added " do
      game = Game.new
      11.times {standard_frame(game)}
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2]]
    end

    it "Add 3 rolls in frame 10 when strike in frame 10" do
      game = Game.new
      9.times {standard_frame(game)}
      strike_frame(game)
      standard_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10, 1, 2]]
    end

    it "Add 3 rolls in frame 10 when spare in frame 10" do
      game = Game.new
      9.times {standard_frame(game)}
      spare_frame(game)
      extra_roll(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2, 1]]
    end

    it "Add 1 roll in frame 9 when strike in frame 9" do
      game = Game.new
      8.times {standard_frame(game)}
      strike_frame(game)
      standard_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[10],[1, 2]]
    end

    it "Add 2 rolls in frame 9 when spare in frame 9" do
      game = Game.new
      8.times {standard_frame(game)}
      spare_frame(game)
      standard_frame(game)
      expect(game.rolls_by_frame).to eq [[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[1, 2],[8, 2],[1, 2]]
    end
  end

  private

  def standard_frame(game)
    game.add(1)
    game.add(2)
  end

  def strike_frame(game)
    game.add(10)
  end

  def spare_frame(game)
    game.add(8)
    game.add(2)
  end

  def extra_roll(game)
    game.add(1)
  end

  def gutter_roll(game)
    game.add(0)
  end
  
end