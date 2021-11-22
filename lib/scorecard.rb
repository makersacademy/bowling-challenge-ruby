require "pg"

class ScoreCard
  #attr_reader :player_name :turn :frame :roll :roll_score :added_bonus :frame_score :total_score :earned_bonus 
  
  def initialize(player_name, turn, frame, roll, roll_score, added_bonus, frame_score, total_score, earned_bonus) 
    @player_name = player_name
    @turn = turn
    @frame = frame
    @roll = roll
    @roll_score = roll_score
    @added_bonus = added_bonus
    @frame_score =  frame_score
    @total_score = total_score
    @earned_bonus = earned_bonus
  end


  def self.new_game(player_name)
    connection = PG.connect(dbname: "bowling")
    connection.exec("TRUNCATE bowling_scorecard RESTART identity")
    turn = (connection.exec_params("INSERT INTO bowling_scorecard (frame,roll,roll_score,added_bonus,frame_score,total_score,earned_bonus) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING turn", [1,1,0,0,0,0,'none'])).first['turn']
    puts turn
    turn = connection.query("SELECT * FROM bowling_scorecard WHERE turn = '#{turn}';").first
    ScoreCard.create(player_name, turn)
  end

  def self.create(player_name, turn)
    game = ScoreCard.new(player_name, turn['turn'], turn['frame'], turn['roll'],
      turn['roll_score'], turn['added_bonus'], turn['frame_score'], turn['total_score'], turn['earned_bonus'])
  end

  def add_roll(roll)
    @roll_score += roll
    @total_score += roll
    if @roll == 1 && roll_value == 10
      @earned_bonus = 'strike'
      

end
  
