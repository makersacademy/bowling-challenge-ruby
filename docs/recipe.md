# Bowling Challenge Recipe

## Rules

- Each game has 10 frames, and each frame has 2 or 3 rolls.
- Score calculation is based on whether the player has `spare` or `strike`
  - Spare: Adds up the current frame and the next roll
  - Strike: Adds up the current frame and the next frame
  - Nothing: Adds up the current frame to the total
- If the player play a `strike`, skip one roll and start the next frame
- In round 10, if the player play a `strike` or `spare`, there is one more roll as a bounce

## Score Board

```ruby
# [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0,0]] #=> 0


# [[1,4], [4,5], [6,4], [5,5], [10,0], [0,1], [7,3], [6,4], [10,0], [2,8,6]] #=> 133
# normal, normal, spare, spare, strike, normal, spare, spare, strike, spare

# [[10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,10,10]] #=> 300
# [[1,4], [4,5], [6,4], [5,5], [10,0], [0,1], [0,0], [0,0], [0,0], [0,0,0]] #=> 61
```

## Test Designs

### Unit Tests

```ruby

```

## Class Designs

```ruby
class Frame
  def initialize
    @scores = [0,0]
    @roll = 0
  end

  def add_score(score)
    return if is_ended?()
    @scores[roll] = score
    @roll += 1
  end

  def first_score
    return @scores[0]
  end

  def total_score
    return @scores.sum
  end

  def is_ended?
    if @roll == 2
      return true
    end
    return false
  end

  def status
    return 'strike' if is_strike?()
    return 'spare' if is_spare?()
    return 'normal'
  end

  private

  def is_strike?
    return @score[0] == 10
  end

  def is_spare?
    return @score[0] + @score[1] == 10
  end
end
```

```ruby
class BowlingGame
  def initialize(io, frame)
    @score_board = Array.new[10, frame.new]
    @frame = 0
  end

  def play(score)
    unless is_ended?()
      current_frame = @score_board[@frame]
      current_frame.add_score(score)
      io.put "Your current score: #{total_socre()}"
      current_frame.is_ended? && @frame + 1
    else
      put "Game ended! Your total score: #{total_socre()}"
    end
  end

  def total_score
    accum_score = 0
    @score_board.each_with_index do |frame, i|
      case frame.status
        when 'strike'
          accum_score += frame.total_score + @score_board[i + 1].total_score
        when 'spare'
          accum_score += frame.total_score + @score_board[i + 1].first_score
        else
          accum_score += frame.total_score
      end
    end
    return accum_score
  end

  private

  def is_ended?
    return @frame > 10
  end
end
```
