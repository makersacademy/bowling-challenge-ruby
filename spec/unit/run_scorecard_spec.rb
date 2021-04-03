require 'run_scorecard'

describe RunScorecard do
  let(:test_game) { RunScorecard.new }
  describe '#run_game' do
    context '2 rolls, displays the current scorecard after one frame' do
      it {
        allow($stdin).to receive(:gets).and_return('10')
        expect(test_game.run_game).to eq(EXAMPLE_3)
      }
    end
  end

  EXAMPLE_1_B = "Frame |  1  |  2  | Frame-Score | Total-Score\n1     |  4  |  5  |      9      |      9     \n2     |     |     |             |            \n3     |     |     |             |            \n4     |     |     |             |            \n5     |     |     |             |            \n6     |     |     |             |            \n7     |     |     |             |            \n8     |     |     |             |            \n9     |     |     |             |            \n10    |     |     |             |            "

  EXAMPLE_3 = "Frame |  1  |  2  | Frame-Score | Total-Score\n1     | 10  |  x  |     30      |     30     \n2     | 10  |  x  |     30      |     60     \n3     | 10  |  x  |     30      |     90     \n4     | 10  |  x  |     30      |    120     \n5     | 10  |  x  |     30      |    150     \n6     | 10  |  x  |     30      |    180     \n7     | 10  |  x  |     30      |    210     \n8     | 10  |  x  |     30      |    240     \n9     | 10  |  x  |     30      |    270     \n10    | 10  |10 10|     30      |    300     "
end
