require 'game'

describe Game do
	
	describe '#frame_init' do
		it 'should initialize a frame and allow for two rolls' do
			subject.frame_init(5, 3)
			expect(subject.score_card).to eq [[5,3]]
		end	
	end
end