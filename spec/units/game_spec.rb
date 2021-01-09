require 'game'

TEST_CASES = {

  [0] => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0] => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] =>
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] =>
    [30, 60, 90, 120, 150, 180, 210, 240, 270, 300],
  [0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0] =>
    [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
  [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] =>
    [5,14,29,49,60,61,77,97,117,133]
  }

describe Game do
  describe '.create' do
    it "should create an instance of a Game" do
      expect(Game.create).to be_a Game
    end
  end

  context ".score" do
    it "should receive with one argument" do
      expect(Game.create).to respond_to(:score).with(1).argument
    end

    TEST_CASES.each do |input, output|
      it "returns #{output} when the input is #{input}" do
        result = Game.create.score(input)
        expect(result).to eq output
      end
    end
  end
end
