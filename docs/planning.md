BOWLING SCORECARD PROGRAM

https://www.rookieroad.com/bowling/the-top-10-rules/

Do not generate random rolls, user inputs the rolls

count and sumt the scores for a bowling game for one player

a game consists of 10 frames (rounds)
in each frame, each player tries to knock down 10 pins
in each frame, a player can roll no more than twice
the score of a frame is the number of knocked down pins PLUS bonuses for strikes and spares (rolls not used during a frame)
after every frame, the 10 pins are restored/reset

Strikes - the player has a strike if he knocks down all 10 pins with one hit (roll) in a frame
    - when a strike, the frame ends immediately
    - the bonus for that frame is the number of pins knocked down by the next two rolls
    - that would be the next frame, unless the player rolls another strike (???)

scenario 1:
    frame1 - player strikes -> gets 10 points and frame ends
            - total score for this frame is 10 and bonus F1 < (from) 2 will be frame2
            - accumulated score: 10 + 10 = 20

    frame2 - player strikes again -> gets 10 points and frame ends
            - total score for this frame is 10 and bonus F2 < 3 will be frame3
            - accumulated score: 20 + 10 + 10 = 40

    frame3 - player hits 7 pins with the first roll
            - player hits remaining 3 pins with the second roll
            - player gets 10 points and frame ends (has a spare)
            - accumulated score: 40 + 10 + 8 = 48

    frame4 - player hits 8 pins with the first roll
            - player hits 1 pin with the second roll
            - player gets 9 points (has a spare)
            - accumulated score: 48 + 9 + 10 = 67

    frame5  - player hits a strike and frame ends
            - total score for this frame is 10 points and bonus F5 < 6 will be F6
            - accumulated score: 67 + 10 + 9 = 86

    frame6 - player hits 7 pins with the first roll
            - player hits 2 pins with the second roll
            - player gets 10 points this frame (has a spare)
            - accumulated score: 86 + 10 + x = y


Spares - The player has a spare if he knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

No spares and no bonus when player doesn't hit all 10 pins in a frame!

10th frame - if the player hits a strike or spare in the 10th frame they basically get an 11th or BONUS frame (two rolls if they hit a strike in F10 or one roll if they had a spare in F10). But they cannot roll more than two times in F10 (so they go into F11 and roll once or twice )

    10, 10, 10 in the 10th frame gives 30 points (10 points for the regular first strike and 20 points for the bonus).
    1, 9, 10 in the 10th frame gives 20 points (10 points for the regular spare and 10 points for the bonus).

GUTTER GAME - when player never hits a pin (zero points)

PERFECT GAME - 12 strikes (one strike per frame 10 x 10) and 2 strikes for the bonus in the 10th frame (so 20 in the 11th frame). Perfect game scores 300 points!

F1 = 10 + F2
F2 = 10 + F1 + F3_bonus
F3 = 10 + F2 + F4_bonus
F4 = 10 + F3 + F5_bonus
F5 = 10 + F4 + F6_bonus
F6 = 10 + F5 + F7_bonus
F7 = 10 + F6 + F8_bonus
F8 = 10 + F7 + F9_bonus
F9 = 10 + F8 + F10_bonus
F10 = 10 + F11_bonus
    F11_bonus = 10 + 10

    Actual Points for that Frame
    Bonus for that Frame (obtain from upcoming frame)
    Accumulated

     APF  BF+1       Acc    
F1 = 10 + 10      --> 20 (accumulated = 20)
F2 = 10 + 10 + 10 --> 30 (accumulated = 50)
F3 = 10 + 10 + 10 --> 30 (accumulated = 80)
F4 = 10 + 10 + 10 --> 30 (accumulated = 110)
F5 = 10 + 10 + 10 --> 30 (accumulated = 140)
F6 = 10 + 10 + 10 --> 30 (accumulated = 170)
F7 = 10 + 10 + 10 --> 30 (accumulated = 200)
F8 = 10 + 10 + 10 --> 30 (accumulated = 230)
F9 = 10 + 10 + 10 --> 30 (accumulated = 260)
F10 = 10 + 10 --> 20 (accumulated = 280)
- if player hits a strike or knocks down all 10 pins in two hits --> F11 (with one or two rolls)
F11 = 10 + 10 --> 20 (accumulated = 300)
TOTAL = 300

NOT A PERFECT GAME:
     R1   R2   B      AC  
F1 = 6 +  4 +  8 +    0     --> 10 (accumulated = 18)
F2 = 8 +  1 +  7 +    18    --> 9 (accumulated = 34)
F3 = 7 +  3 +  6 +    34    --> 10 (accumulated = 50)
F4 = 6 +  2 +  10 +   50    --> 8 (accumulated = 68)
F5 = 10 + ST + 10 +   68    --> 10 (accumulated = 88)
F6 = 6 +  4 +  7 +    88    --> 10 (accumulated = 104)
F7 = 7 +  2 +  3 +    104   --> 9 (accumulated = 116)
F8 = 3 +  5 +  10 +   116   --> 8 (accumulated = 134)
F9 = 10 + ST + 9 +    134   --> 10 (accumulated = 153)
F10 = 8 + 1 +  NONE + 153   --> 9 (accumulated = 162)
- if player hits a strike or knocks down all 10 pins in two hits --> F11 (with one or two rolls)
F11 = 0 + 0                 --> 0 (accumulated = 162)
                            TOTAL = 162

so you do F1R1, F1R2 X ACC
F2R1 F2R2 X ACC
F3R1 F3R2 X ACC
...

5 players max
Repository class where each instance is a game
Repository class where each instance is a player
Repository class where each instance is a frame

class Game
  def initialize
    # @score_board = [0,0,0,0,0]
  end

  def show_final_board(player, frames, score)
    @score_board.each do score
    # shows the final score board with players' names
    # from players
    # from frames
  end
end

class Player
  def create_player(first_name, last_name)
    # puts "What is your first name?"
    # first_name = gets.chomp
    # puts "What is your last name?"
    # last_name = gets.chomp
    # player name and surname
    # Welcome! You are player 1 (count players as they are inserted)
    # player1 = first_name, last_name
  end
end

class Players
  def initialize
    player_accumulated_score = []
    players_list = []
  end
    
  def add_player(player)
    # Adds a player
  end

  def count_players
    # players_list << player
  end

  def show_players_list
    # displays the list of players for a specific game
  end

  def show_players_stats
    # displays player's name and score per frame
  end
end

class Frames
  def initialize
    frame = 0
  end

  def current_frame
    frame += 1
  end

  def roll_1(player)
    # gets.chomp pins knocked down from user
    pins_knocked - gets.chomp
    returns int (pins)
  end

  def roll_2(player)
    # gets.chomp pins knocked down from user
    pins_knocked - gets.chomp
    returns int (pins)
  end

  def bonus(player, current_frame)
    # calculates the bonus based on the next frame rolls (F+1 R1 and R2)
  end

  def accumulated_score(player)
    # calculates the accumulated score
  end
end

run game in app.rb
    - input player name, ask if to add another player
    - after no more players added (max 5) start game
    - start frame 1, loop through players to roll
    - calculate accumulated score
    - loop through frames
    - calculate accumulated score
    - 10th frame, see if bonus frame
    - return all scores
    - display final score
    - ask if play again