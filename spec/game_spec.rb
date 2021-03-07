require 'game'

describe Game do

  let(:game) { Game.new }

context 'starting a new game' do
  it 'should start with 10 frames' do
    expect(game.scorecard.length).to eq 10
  end
end

context 'scoring the game' do
  it 'should know its score' do
    expect(game).to respond_to :score
  end

  it 'should have a score' do
    expect(game.score).not_to eq nil
  end

  it 'should have a scorecard' do
    expect(game).to respond_to :scorecard
  end
end

context 'inputting a score' do
  it 'should allow the user to input a score' do
    expect(game).to respond_to(:input_score).with(1).argument
  end

  it 'will not allow a user to input a invalid score' do
    expect { game.input_score(12) }.to raise_error "Please input a valid score"
    game.input_score(6)
    expect { game.input_score(5) }.to raise_error "Please input a valid score"
  end

  it 'should update the first frame with the first roll score' do
    game.input_score(5)
    expect(game.scorecard[:frame1].framescore[:roll_1]).to eq 5
  end

  it 'should record a STRIKE as X' do
    score_strike
    expect(game.scorecard[:frame1].framescore[:roll_1]).to eq 'X'
  end

  it 'should update the first frame with the second roll score' do
    game.input_score(5)
    game.input_score(3)
    expect(game.scorecard[:frame1].framescore[:roll_2]).to eq 3
  end

  it 'should record a SPARE as /' do
    score_spare
    expect(game.scorecard[:frame1].framescore[:roll_2]).to eq '/'
  end

  it 'should not update roll_2 of frame1 if roll_1 was a STRIKE' do
    score_strike
    game.input_score(3)
    expect(game.scorecard[:frame1].framescore[:roll_2]).to eq '-'
  end

  it 'begins inputting into the next frame if the current frame is complete' do
    game.input_score(5)
    game.input_score(3)
    game.input_score(3)
    expect(game.scorecard[:frame2].framescore[:roll_1]).to eq 3
  end

end

context 'knowing current frame' do
  it 'should respond to frame?' do
    expect(game).to respond_to :frame?
  end

  describe '#frame?' do
    it 'should provide the current frame number' do
      score_strike
      game.input_score(3)
      expect(game.frame?).to eq :frame2
    end
  end
end

context 'SPARE bonus logic' do
  it 'should have a method of adding SPARE bonuses' do
    expect(game).to respond_to :spare_bonus
  end

  describe '#spare_bonus' do
    # it 'should find the first frame where there is a spare but no bonus yet' do
    #   game.input_score(3)
    #   game.input_score(3)
    #   score_spare
    #   score_spare
    #   expect(game.spare_bonus).to eq game.scorecard[:frame2]
    # end

    it 'updates the previous frame with a bonus if there was a SPARE' do
      score_spare
      game.input_score(3)
      expect(game.scorecard[:frame1].framescore[:bonus]).to eq 3
    end

    it 'also updates previous frame :bonus if there was a SPARE' do
      game.input_score(3)
      game.input_score(3)
      score_spare
      game.input_score(3)
      expect(game.scorecard[:frame2].framescore[:bonus]).to eq 3
      p game.scorecard[:frame2]
    end
  end

end
# ---------------------------------------
# context 'STRIKE bonus logic' do
#   it 'should have a method of adding STRIKE bonuses' do
#     expect(game).to respond_to :strike_bonus
#   end
#
#   describe '#strike_bonus' do
#     it 'updates the bonus score of a frame where there was a strike with the next 2# rolls' do
#       score_strike
#       game.input_score(3)
#       game.input_score(4)
#       expect(game.scorecard[:frame1].framescore[:bonus]).to eq 7
#     end
#   end
# end
# ---------------------------------------





end
