require 'game'

describe Game do

    it { is_expected.to respond_to :play_a_frame }
    it { is_expected.to respond_to :play_a_game }
    
end
