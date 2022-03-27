require 'scorecard'
describe Scorecard do
  it "should be initialized with total_score, score_hash, current_frame" do
    expect do
      subject.total_score
      subject.score_hash
      subject.current_frame
    end.not_to raise_error
  end
end 