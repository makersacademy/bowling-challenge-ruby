require 'ui'

describe Ui do

	describe '#initialize' do
		it 'initializes a game' do
			expect(subject.game).to be_a(Game)
		end

		it 'has a blank scoreboard' do
			expect(subject.scorecard).to eq([[]])
		end
	end

	describe '#throw_ball_1' do
		it 'throws a ball' do
			subject.game.begin_frame
			subject.throw_ball_1(7)
			subject.add_to_scorecard
			expect(subject.scorecard[0][0]).to eq(7)
		end
	end

end