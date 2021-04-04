require 'game'
require 'score'
require 'frame'

describe Game do
  let(:score) {Score.new}

  describe 'the score' do
    it 'returns the correct score for 10 strikes' do
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 1)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 2)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 3)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 4)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 5)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 6)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 7)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 8)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 9)
      returned = score.calculate_frame10(10, 10, 10)
      subject.store_score(returned[0], returned[1], returned[2])
      expect(subject.instance_variable_get(:@game_score)).to eql([30,30,30,30,30,30,30,30,30,30])
    end
  end
end
