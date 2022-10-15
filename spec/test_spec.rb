RSpec.describe "put zero" do 
    it "puts 0" do 
        zero = Counter.new
        expect(zero.report_points).to eq "You have scored 0 points so far"
    end 
end