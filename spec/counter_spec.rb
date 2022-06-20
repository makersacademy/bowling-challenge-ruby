require 'counter'

RSpec.describe Counter do
    it "initially reports a zero points" do 
        counter = Counter.new 
        expect(counter.report_points).to eq "You have scored 0 points so far"
    end

    it "adds points to zero" do 
        counter = Counter.new 
        counter.adding_up_points(5)
        expect(counter.report_points).to eq "You have scored 5 points so far"
    end
end 
