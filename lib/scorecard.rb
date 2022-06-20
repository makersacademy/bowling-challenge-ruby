require 'pg'

class Scorecard
  attr_reader :frame_total, :game_total
  def input_score(score)
    @frame_total = score.first_roll + score.second_roll

    connection = PG.connect(dbname: 'bowling_scorecard')
    connection.exec(
      "INSERT INTO player1(roll, knocked_pins, total_frame, notes) VALUES ('1', #{score.first_roll}, #{@frame_total}, 'no notes');"
    )
    result = connection.exec("SELECT * FROM player1;")
    p result[0]
  end
end