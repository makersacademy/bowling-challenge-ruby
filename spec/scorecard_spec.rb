require 'scorecard'

RSpec.describe Scorecard do
  let (:scorecard) { Scorecard.new}
  context 'run_frame method' do
    it 'returns sum of frame without spares or strikes' do
      allow(scorecard).to receive(:get_user_2_rolls).and_return([5,4])
      allow(scorecard).to receive(:print_score_message)
      scorecard.run_frame
      expect(scorecard.frame).to eq(1)
      expect(scorecard.total_score[0].roll_1).to eq(5)
      expect(scorecard.total_score[0].roll_2).to eq(4)
      expect(scorecard.total_score[0].sum).to eq(9)
    end

    it 'returns sum of final frame with no spares or strikes' do
      allow(scorecard).to receive(:print_score_message)

      [[5, 4], [6, 0], [7, 2], [5, 4], [1, 0], [1, 2], [5, 4], [0, 0], [3, 2], [7, 2]].each do |rolls|
        allow(scorecard).to receive(:get_user_2_rolls).and_return(rolls)
        scorecard.run_frame
      end

      expect(scorecard.frame).to eq(10)
      expect(scorecard.total_score[0].roll_1).to eq(5)
      expect(scorecard.total_score[0].roll_2).to eq(4)
      expect(scorecard.total_score[0].sum).to eq(9)
      expect(scorecard.total_score[4].roll_1).to eq(1)
      expect(scorecard.total_score[4].roll_2).to eq(0)
      expect(scorecard.total_score[4].sum).to eq(1)
      expect(scorecard.total_score[9].roll_1).to eq(7)
      expect(scorecard.total_score[9].roll_2).to eq(2)
      expect(scorecard.total_score[9].sum).to eq(9)
    end 

    it 'adds strike bonus to frame sum' do
      allow(scorecard).to receive(:print_score_message)

      [[5, 4], [10, 0], [7, 2]].each do |rolls|
        allow(scorecard).to receive(:get_user_2_rolls).and_return(rolls)
        scorecard.run_frame
      end

      expect(scorecard.frame).to eq(3)
      expect(scorecard.total_score[0].roll_1).to eq(5)
      expect(scorecard.total_score[0].roll_2).to eq(4)
      expect(scorecard.total_score[0].sum).to eq(9)
      expect(scorecard.total_score[1].roll_1).to eq(10)
      expect(scorecard.total_score[1].roll_2).to eq(0)
      expect(scorecard.total_score[1].sum).to eq(10)
      expect(scorecard.total_score[2].roll_1).to eq(7)
      expect(scorecard.total_score[2].roll_2).to eq(2)
      expect(scorecard.total_score[2].sum).to eq(18)
    end

    it 'adds spare bonus to frame sum' do
      allow(scorecard).to receive(:print_score_message)

      [[5, 4], [5, 5], [7, 2]].each do |rolls|
        allow(scorecard).to receive(:get_user_2_rolls).and_return(rolls)
        scorecard.run_frame
      end

      expect(scorecard.frame).to eq(3)
      expect(scorecard.total_score[0].roll_1).to eq(5)
      expect(scorecard.total_score[0].roll_2).to eq(4)
      expect(scorecard.total_score[0].sum).to eq(9)
      expect(scorecard.total_score[1].roll_1).to eq(5)
      expect(scorecard.total_score[1].roll_2).to eq(5)
      expect(scorecard.total_score[1].sum).to eq(10)
      expect(scorecard.total_score[2].roll_1).to eq(7)
      expect(scorecard.total_score[2].roll_2).to eq(2)
      expect(scorecard.total_score[2].sum).to eq(16)
    end 
  end

  context 'returns sum  of bonus rolls' do
    it 'returns sum following a Strike' do
      allow(scorecard).to receive(:print_score_message)

      [[5, 4], [10, 0], [7, 2], [5, 4], [10, 0], [7, 2], [5, 4], [10, 0], [7, 2]].each do |rolls|
        allow(scorecard).to receive(:get_user_2_rolls).and_return(rolls)
        scorecard.run_frame
      end
      # run the 10th frame, where there will be a strike
      allow(scorecard).to receive(:get_user_2_rolls).with("new_frame").and_return([10, 0])
      allow(scorecard).to receive(:get_user_2_rolls).with("last_frame").and_return([5, 0])
      scorecard.run_frame

      expect(scorecard.frame).to eq(10)
      expect(scorecard.total_score[9].roll_1).to eq(10)
      expect(scorecard.total_score[9].roll_2).to eq(0)
      expect(scorecard.total_score[9].sum).to eq(15)
    end 

    it 'returns sum following a Spare' do
      allow(scorecard).to receive(:print_score_message)
      allow(scorecard).to receive(:get_last_user_roll).and_return(3)


      [[5, 4], [3, 2], [7, 2], [5, 4], [4, 1], [7, 2], [5, 4], [1, 0], [7, 2], [3, 7]].each do |rolls|
        allow(scorecard).to receive(:get_user_2_rolls).and_return(rolls)
        scorecard.run_frame
      end

      expect(scorecard.frame).to eq(10)
      expect(scorecard.total_score[9].roll_1).to eq(3)
      expect(scorecard.total_score[9].roll_2).to eq(7)
      expect(scorecard.total_score[9].sum).to eq(13)
    end 
  end
end
