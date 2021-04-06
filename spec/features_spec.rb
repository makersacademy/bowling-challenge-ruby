require 'game'
require 'score'
require 'frame'

describe Game do
  let(:score) {Score.new}

  describe 'the score' do
    it 'returns a score of 300 for 10 strikes' do
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
    it 'returns a score of 184 for 10 spares' do
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 1)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 2)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 3)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 4)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 5)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 6)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 7)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 8)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 9)
      returned = score.calculate_frame10(8, 2, 10)
      subject.store_score(returned[0], returned[1], returned[2])
      expect(subject.instance_variable_get(:@game_score)).to eql([18,18,18,18,18,18,18,18,18,20])
    end
    it 'returns a score of 115 for a game including spares and strikes' do
      returned = score.calculate(3, 3, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 1)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 2)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(6, 1, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 3)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(6, 1, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 4)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(3, 7, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 5)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(5, 5, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 6)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 7)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(5, 4, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 8)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(3, 5, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 9)
      returned = score.calculate_frame10(9, 1, 3)
      subject.store_score(returned[0], returned[1], returned[2])
      expect(subject.instance_variable_get(:@game_score)).to eql([6,17,7,7,15,18,15,9,8,13])
    end
    it 'returns a score of 115 for a game including spares and strikes' do
      returned = score.calculate(3, 3, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 1)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(10, nil, 2)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 2)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(6, 1, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 3)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(6, 1, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 4)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(3, 7, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 5)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(5, 5, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 6)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 2, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 7)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(5, 4, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 8)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(3, 5, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 9)
      returned = score.calculate_frame10(9, 1, 3)
      subject.store_score(returned[0], returned[1], returned[2])
      expect(subject.instance_variable_get(:@game_score)).to eql([6,17,7,7,15,18,15,9,8,13])
    end
    it 'returns a score of 107 for a game including spares' do
      returned = score.calculate(6, 1, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 1)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(9, 1, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 2)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(0, 10, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 3)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(9, 1, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 4)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(9, 1, 1)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 5)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(2, 7, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 6)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(2, 5, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 7)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(6, 1, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 8)
      roll1, roll2, bonus = Frame.new.frame_start
      returned = score.calculate(8, 1, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      subject.instance_variable_set(:@frame, 9)
      returned = score.calculate_frame10(3, 5, 0)
      subject.store_score(returned[0], returned[1], returned[2])
      expect(subject.instance_variable_get(:@game_score)).to eql([7,10,19,19,12,9,7,7,9,8])
    end
  end
end
