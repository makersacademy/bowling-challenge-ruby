require 'bowl'

describe BowlingScorer do
  let(:bowl) {BowlingScorer.new}

  before(:each) do
    bowl.reset_scores_and_frames
  end

  def simulate_a_game_until_last_shot
    bowl.add_frame(5,5)
    bowl.add_frame(3,5)
    bowl.add_frame(7,0)
    bowl.add_frame(2,5)
    bowl.add_frame(10,0)
    bowl.add_frame(3,5)
    bowl.add_frame(7,0)
    bowl.add_frame(2,5)
    bowl.add_frame(7,2)
    ## By the end of round 9, player has 84 points scored.
    ## All subsequent endgame tests are based on this one
  end

  context "add_frame method" do  
    it "fails if user tries to knock more than 10 in one frame" do
      expect{bowl.add_frame(6,5)}.to raise_error "Looks like you hit the next lane or something, cant knock more than 10"
    end

    it "fails if user inputs negative numbers" do
      expect{bowl.add_frame(-1,5)}.to raise_error "Smells like invalid input"
    end

    it "fails if user inputs negative numbers" do
      expect{bowl.add_frame(4,-5)}.to raise_error "Smells like invalid input"
    end

    it "returns the current frame in an array of numbers" do
      expect(bowl.add_frame(4,3)).to eq [4,3]
    end

    it "returns [10,0] if the user strikes on the first shot" do
      expect(bowl.add_frame(10,0)).to eq [10,0]
    end
  end

  context "check_for_spares method" do
    it "returns strike if the first shot is 10" do
      expect(bowl.check_for_specials([10,0])).to eq "strike"
    end

    it "returns spare if the total input is 10" do
      expect(bowl.check_for_specials([3,7])).to eq "spare"
    end

    it "returns spare if the total input is 10" do
      expect(bowl.check_for_specials([0,10])).to eq "spare"
    end
  end

  context "frames method" do
    it "shows all the shots user took as an array of arrays" do
      bowl.add_frame(1,2)
      bowl.add_frame(4,5)
      bowl.add_frame(5,3)
      expect(bowl.frames).to eq [[1,2],[4,5],[5,3]]
    end
  end

  context "count frame score method" do
    it "counts the score of the given frame as is if no special events happened" do
      bowl.add_frame(1,2)
      bowl.add_frame(4,5)
      expect(bowl.count_frame_score(1)).to eq 9
    end

    it "includes the bonus points awarded by a spare" do
      bowl.add_frame(4,6)
      bowl.add_frame(4,5)
      expect(bowl.count_frame_score(1)).to eq 13
    end

    it "includes the bonus points awarded by a strike" do
      bowl.add_frame(10,0)
      bowl.add_frame(4,5)
      expect(bowl.count_frame_score(1)).to eq 18
    end
  end

  context "count player score method" do
    it "returns the total score if there are no additionals strikes or spares" do
      bowl.add_frame(4,5)
      bowl.add_frame(4,5)
      bowl.add_frame(4,5)
      bowl.add_frame(4,5)
      expect(bowl.count_player_score).to eq 36
    end

    it "returns the total score including spare points" do
      bowl.add_frame(5,5)
      bowl.add_frame(3,5)
      bowl.add_frame(7,0)
      bowl.add_frame(2,5)
      expect(bowl.count_player_score).to eq 35
    end

    it "returns the total score including consecutive spare points" do
      bowl.add_frame(3,1)
      bowl.add_frame(3,7)
      bowl.add_frame(7,3)
      bowl.add_frame(2,5)
      expect(bowl.count_player_score).to eq 40
    end

    it "returns the total score including zigzagged spare points" do
      bowl.add_frame(3,7)
      bowl.add_frame(2,5)
      bowl.add_frame(7,3)
      bowl.add_frame(2,5)
      expect(bowl.count_player_score).to eq 38
    end

    it "returns the total score including strike points" do
      bowl.add_frame(10,0)
      bowl.add_frame(3,5)
      bowl.add_frame(7,0)
      bowl.add_frame(2,5)
      expect(bowl.count_player_score).to eq 40
    end

    it "returns the total score including consecutive strike points" do
      bowl.add_frame(10,0)
      bowl.add_frame(10,0)
      bowl.add_frame(7,0)
      bowl.add_frame(2,5)
      expect(bowl.count_player_score).to eq 51
    end

    it "returns the total score including zigzagged strike points" do
      bowl.add_frame(10,0)
      bowl.add_frame(5,4)
      bowl.add_frame(10,0)
      bowl.add_frame(2,5)
      expect(bowl.count_player_score).to eq 52
    end
  end

  ## There is no UI, so we assume validations to check if player is allowed
  ## to take additional shots will be handled by the UI and not these methods.
  context "add bonus frame method" do
    it "adds an array of one element if player gets one bonus shot" do
      bowl.add_bonus_frame(5)
      expect(bowl.frames[-1]).to eq [5]
    end

    it "adds an array of two elements if player gets two bonus shots" do
      bowl.add_bonus_frame(10,7)
      expect(bowl.frames[-1]).to eq [10,7]
    end

    it "adds an array of three elements if player gets three bonus shots" do
      bowl.add_bonus_frame(10,5,5)
      expect(bowl.frames[-1]).to eq [10,5,5]
    end

    it "adds an array of three elements if player gets three bonus shots" do
      bowl.add_bonus_frame(10,10,10)
      expect(bowl.frames[-1]).to eq [10,10,10]
    end
  end

  context "count_player_bonus_scores method" do
    it "fails if player does not have any bonus points" do
      simulate_a_game_until_last_shot
      bowl.add_frame(6,3)
      expect{bowl.count_player_bonus_scores}.to raise_error "Player has not scored any bonuses!"
    end

    it "counts the total number of points player collected after 10th frame" do
      simulate_a_game_until_last_shot
      bowl.add_frame(6,4)
      bowl.add_bonus_frame(10,5,4)
      expect(bowl.count_player_bonus_scores).to eq 19
    end
  end

  context "frames method" do
    it "lists the shots user has made in an array of integer pairs" do
      simulate_a_game_until_last_shot
      bowl.add_frame(6,3)
      expect(bowl.frames).to eq [[5, 5], [3, 5], [7, 0], [2, 5], [10, 0], [3, 5], [7, 0], [2, 5], [7, 2], [6, 3]]
    end

    it "lists the shots user has made in an array of integer pairs, also includes tenth special frame if it exists" do
      simulate_a_game_until_last_shot
      bowl.add_frame(6,4)
      bowl.add_bonus_frame(10,5,4)
      expect(bowl.frames).to eq [[5, 5], [3, 5], [7, 0], [2, 5], [10, 0], [3, 5], [7, 0], [2, 5], [7, 2], [6, 4], [10, 5, 4]]
    end
  end

  describe "when evaluating the 10th frame" do
    context "count_player_score method" do
      it "counts the game regularly if the player fails to score any spare or strikes" do
        simulate_a_game_until_last_shot
        bowl.add_frame(4,3)
        expect(bowl.count_player_score).to eq 91
      end
    
      it "if player ends with spare / fails to score strike" do
        simulate_a_game_until_last_shot
        bowl.add_frame(7,3)
        expect(bowl.add_bonus_frame(6))
        expect(bowl.count_player_score).to eq 100
      end

      it "if player ends with spare / scores a strike and two randoms" do
        simulate_a_game_until_last_shot
        bowl.add_frame(7,3)
        expect(bowl.add_bonus_frame(10,4,5))
        expect(bowl.count_player_score).to eq 113
      end

      it "if player ends with spare / scores a strike and two randoms" do
        simulate_a_game_until_last_shot
        bowl.add_frame(7,3)
        expect(bowl.add_bonus_frame(10,4,5))
        expect(bowl.count_player_score).to eq 113
      end

      it "if player ends with a strike / scores three consecutive strikes" do
        simulate_a_game_until_last_shot
        bowl.add_frame(10,0)
        expect(bowl.add_bonus_frame(10,10,10))
        expect(bowl.count_player_score).to eq 124
      end
    end
  end

  context "cross checking with readme gameplay for validating scores" do
    it "returns 133" do
      bowl.add_frame(1,4)
      bowl.add_frame(4,5)
      bowl.add_frame(6,4)
      bowl.add_frame(5,5)
      bowl.add_frame(10,0)
      bowl.add_frame(0,1)
      bowl.add_frame(7,3)
      bowl.add_frame(6,4)
      bowl.add_frame(10,0)
      bowl.add_frame(2,8)
      bowl.add_bonus_frame(6)
      expect(bowl.count_player_score).to eq 133
    end
  end
end