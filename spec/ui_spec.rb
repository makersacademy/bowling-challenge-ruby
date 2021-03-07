require 'ui'

describe Ui do

	describe '#initialize' do
		it 'initializes a game' do
			expect(subject.game).to be_a(Game)
		end

		it 'has a blank scoreboard' do
			expect(subject.scorecard).to eq([])
		end
	end

	context 'throwing balls' do 
		before(:each) do
			subject.begin_frame
			subject.throw_1(7)
			subject.add_to_scorecard
		end

		describe '#throw_ball_1' do
			it 'throws a ball' do
				expect(subject.scorecard[0][0]).to eq(7)
			end
		end

		describe '#throw_ball_2' do
			it 'throws a ball' do
				expect(subject.scorecard[0][0]).to eq(7)
			end
		end

		describe '#round' do
			it 'returns the current frame number' do
				subject.begin_frame
				expect(subject.round).to eq(2)
			end
		end

		describe '#total.points' do
			it 'gives the sum of the players points' do
				subject.throw_2(2)
				expect(subject.total_points).to eq(9)
			end
		end
	end

	describe '#add_to_scorecard' do
		it 'updates the scorecard' do
			subject.begin_frame
			subject.throw_1(7)
			subject.throw_2(2)
			expect{ subject.add_to_scorecard }.to change { subject.scorecard.length }.by(1)
		end
	end

end