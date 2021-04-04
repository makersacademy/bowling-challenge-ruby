require 'run_scorecard'

describe RunScorecard do
  let(:test_game) { RunScorecard.new }
  describe '#run_game' do
    context 'displays final scorecard after receiving a string of strikes' do
      it {
        allow($stdin).to receive(:gets).and_return('10')
        expect(test_game.run_game).to eq(nil)
      }
    end

    context 'it does not progress if an invalid score is entered' do
      it {
        allow($stdin).to receive(:gets).and_return('s', '10')
        expect(test_game.run_game).to eq(nil)
      }
    end
  end

  describe '#display_scorecard' do
    context 'it displays a perfect game' do
      it {
        allow($stdin).to receive(:gets).and_return('10')
        test_game.run_game
        expect(test_game.display_scorecard).to eq EXAMPLE_3
      }
    end

    context 'it displays a game with spares' do
      it {
        allow($stdin).to receive(:gets).and_return('10', '10', '10', '10', '10', '10', '10', '10', '9', '1', '3', '7', '8')
        test_game.run_game
        expect(test_game.display_scorecard).to eq EXAMPLE_4
      }
    end
  end

  EXAMPLE_1 = "
  Frame |  1  |  2  | Frame-Score | Total-Score\n
  1     |  4  |  5  |      9      |      9     \n
  2     |     |     |             |            \n
  3     |     |     |             |            \n
  4     |     |     |             |            \n
  5     |     |     |             |            \n
  6     |     |     |             |            \n
  7     |     |     |             |            \n
  8     |     |     |             |            \n
  9     |     |     |             |            \n
  10    |     |     |             |            \n
  "

  EXAMPLE_1_B = "Frame |  1  |  2  | Frame-Score | Total-Score\n1     |  4  |  5  |      9      |      9     \n2     |     |     |             |            \n3     |     |     |             |            \n4     |     |     |             |            \n5     |     |     |             |            \n6     |     |     |             |            \n7     |     |     |             |            \n8     |     |     |             |            \n9     |     |     |             |            \n10    |     |     |             |            "

  EXAMPLE_2 = "
  Frame |  1  |  2  | Frame-Score | Total-Score\n
  1     | 10  |  x  |     30      |     30     \n
  2     | 10  |  x  |     30      |     60     \n
  3     | 10  |  x  |     30      |     90     \n
  4     | 10  |  x  |     30      |    120     \n
  5     | 10  |  x  |     30      |    150     \n
  6     | 10  |  x  |     30      |    180     \n
  7     | 10  |  x  |     30      |    210     \n
  8     | 10  |  x  |     30      |    240     \n
  9     | 10  |  x  |     30      |    270     \n
  10    | 10  |10 10|     30      |    300     \n
  "

  EXAMPLE_3 = "Frame |  1  |  2  | Frame-Score | Total-Score\n1     | 10  |  x  |     30      |     30     \n2     | 10  |  x  |     30      |     60     \n3     | 10  |  x  |     30      |     90     \n4     | 10  |  x  |     30      |    120     \n5     | 10  |  x  |     30      |    150     \n6     | 10  |  x  |     30      |    180     \n7     | 10  |  x  |     30      |    210     \n8     | 10  |  x  |     30      |    240     \n9     | 10  |  x  |     30      |    270     \n10    | 10  |10 10|     30      |    300     "

  EXAMPLE_4 = "Frame |  1  |  2  | Frame-Score | Total-Score\n1     | 10  |  x  |     30      |     30     \n2     | 10  |  x  |     30      |     60     \n3     | 10  |  x  |     30      |     90     \n4     | 10  |  x  |     30      |    120     \n5     | 10  |  x  |     30      |    150     \n6     | 10  |  x  |     30      |    180     \n7     | 10  |  x  |     29      |    209     \n8     | 10  |  x  |     20      |    229     \n9     |  9  |  /  |     13      |    242     \n10    |  3  |/   8|     18      |    260     "
end
