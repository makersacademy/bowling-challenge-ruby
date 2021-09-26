class Scorecard
    def self.start_game
        @game = Scorecard.new
        #next_frame
    end

    def self.current_game
        @game
    end

    INSTANCES

    @frames = []
    @current_score = @frames.map {|frame| frame.frame_score}.sum
    -----
    #start_game -> frames << Frame.new
    #next_frame -> frames << Frame.new
    #frames_played -> frames.count

    def score
        if @frames[-1].frame_score.nil?
            "First frame hasn't been played yet"
        else
            @frames.map {|frame| frame.frame_score}.sum
        end
    end
end

class Frame
    @roll_1 = nil
    @roll_2 = nil
    @frame_score = nil
    @strike = false
    @spare = false
    -----
    def bowl
        break if Scorecard.current_game.frames_played >= 10
        if @roll_1.nil?
            puts "first roll of the frame"
            @roll_1 = gets.chomp

            @strike = true if @roll_1 == 10

            if Scorecard.current_game.frames[-2].spare? (return false if doesn't exist) || Scorecard.current_game.frames[-2].strike? (return false if doesn't exist)
                Scorecard.current_game.frame[-2].frame_score += @roll_1
                if Scorecard.current_game.frames[-2].strike? && Scorecard.current_game.frames[-3].strike?
                    Scorecard.current_game.frames[-3].frame_score += @roll_1
                end
            end

        elsif @roll_1 != 10
            @roll_2 = gets.chomp
            @spare = true if @roll_1 + @roll_2 == 10
        end

        calculate_frame_score
        end_of_frame_message
    end

    def calculate_frame_score
        if @roll_2.nil?
            @frame_score = @roll_1
        else
            @frame_score = @roll_1 + @roll_2
        end
    end

    def end_of_frame_message
        if strike?
            "You scored a Strike!"
        elsif spare?
            "You scored a Spare!"
        else
            "You scored #{@frame_score} point#{'s' if @frame_score > 1'}."
        end
    end

    def strike?
        @strike
    end

    def spare?
        @spare
    end





Bowling Challenge in Ruby
=================

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday week

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

As usual please start by

* Forking this repo

* Finally submit a pull request before Monday week at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday week at 9am. 

___STRONG HINT, IGNORE AT YOUR PERIL:___ Bowling is a deceptively complex game. Careful thought and thorough diagramming — both before and throughout — will save you literal hours of your life.

## Focus for this challenge
The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

## Bowling — how does it work?

### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately (since there are no pins left for a second roll). The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

### 10th frame

If the player rolls a strike or spare in the 10th frame they can roll the additional balls for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional rolls only count for the bonus not for the regular frame count.

    10, 10, 10 in the 10th frame gives 30 points (10 points for the regular first strike and 20 points for the bonus).
    1, 9, 10 in the 10th frame gives 20 points (10 points for the regular spare and 10 points for the bonus).

### Gutter Game

A Gutter Game is when the player never hits a pin (20 zero scores).

### Perfect Game

A Perfect Game is when the player rolls 12 strikes (10 regular strikes and 2 strikes for the bonus in the 10th frame). The Perfect Game scores 300 points.

In the image below you can find some score examples.

More about ten pin bowling here: http://en.wikipedia.org/wiki/Ten-pin_bowling

![Ten Pin Score Example](images/example_ten_pin_scoring.png)
