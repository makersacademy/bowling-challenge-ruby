# require 'scorecard'

# describe 'ScoreCard' do
#   let(:subject) { ScoreCard.new }

#   it 'should update the score card and total scores correctly' do
#     allow(subject).to receive(:gets).once.and_return(9)
#     expect(subject.score_board).to eq [[9]]
#     expect(subject.total_score).to eq 9
#     subject.run
#   end

#   describe ".check_input" do
#     it 'returns true if the number is between 0 and 10' do
#       expect(subject.check_input(-1)).to be false
#       expect(subject.check_input(10.2)).to be false
#       expect(subject.check_input(15)).to be false
#     end

#     it 'returns false if the number is negative, decimal or larger than 10' do
#       expect(subject.check_input(0)).to be true
#       expect(subject.check_input(10)).to be true
#       expect(subject.check_input(5)).to be true
#     end
#   end

#   describe '#pin_board' do
#     it 'should update the first roll based on the first user input' do
#       allow(subject).to receive(:gets).and_return(9)
#       subject.run
#       expect(subject.first_roll).to eq 9
#     end

#     it 'should prompt the user for second roll result' do
#       allow(subject).to receive(:gets).and_return(9)
#       expect(subject).to receive(:gets).twice
#       subject.run
#     end

#     it 'should skip the second roll if first roll was a strike' do
#       allow(subject).to receive(:gets).and_return(10)
#       subject.run
#       expect(subject.second_roll).to be nil
#     end

#     # it 'should run the rounds 10 times' do
#     # end
#   end

#   # it 'should count the number of frames' do
#   #   expect(subject.frames).to eq 10
#   # end

#   describe "#strike" do
#     it "checks whether the first roll knocked down 10 pins" do
#       subject.first_roll == 10
#       expect(subject.strike?).to be true
#       subject.first_roll == 3
#       expect(subject.strike?).to be false
#     end
#   end

#   describe "#spare" do
#     it "checks whether the second roll knowcked down 10 pins" do
#       subject.second_roll = 10
#       expect(subject.spare?).to be true
#       subject.second_roll = nil
#       expect(subject.spare?).to be false
#     end
#   end

#   describe "#total_score" do
#     it "update the score depending on the pins knocked down" do
#       allow(subject).to receive(:gets).and_return(7, 5)
#       subject.run
#       expect(subject.total_score).to eq 12
#     end

#     it "update the score depending on the pins knocked down" do
#       allow(subject).to receive(:gets).and_return(0, 1)
#       subject.run
#       expect(subject.total_score).to eq 1
#     end
#   end

#   describe "#update_frame" do
#     it "updates the array according to inputs" do
#       expect(subject.frame).to receive(:<<).with(2).and_return([2])
#       subject.update_frame(2)
#       expect(subject.frame).to receive(:<<).with(4).and_return([2,4])
#       subject.update_frame(4)
#     end
#   end

# end