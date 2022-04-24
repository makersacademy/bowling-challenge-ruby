require 'scoresheet'

describe 'User can input their scores and get their score' do
  it 'will return final score' do
    scoresheet = Scoresheet.new

    scoresheet.current_frame.add_roll(1)
    scoresheet.current_frame.add_roll(4)
    scoresheet.current_frame.add_roll(4)
    scoresheet.current_frame.add_roll(5)
    scoresheet.current_frame.add_roll(6)
    scoresheet.current_frame.add_roll(4)
    scoresheet.current_frame.add_roll(5)
    scoresheet.current_frame.add_roll(5)
    scoresheet.current_frame.add_roll(10)
    scoresheet.current_frame.add_roll(0)
    scoresheet.current_frame.add_roll(1)
    scoresheet.current_frame.add_roll(7)
    scoresheet.current_frame.add_roll(3)
    scoresheet.current_frame.add_roll(6)
    scoresheet.current_frame.add_roll(4)
    scoresheet.current_frame.add_roll(10)
    scoresheet.current_frame.add_roll(2)
    scoresheet.current_frame.add_roll(8)
    scoresheet.current_frame.add_roll(6)

    expect(scoresheet.total_score).to eq(133)
  end
end
