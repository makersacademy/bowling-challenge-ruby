# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
To help me track my bowling game (one player)
I would like to have a count of what frame I am playing, up to 10.

As a user
To help me track my bowling game (one player)
I would like to be prompted to input my roll (amount of pins down)

As a user
To help me track my bowling game (one player)
I would like see a sum of my current score

As a user
When I get a strike roll (all 10 pins down in first frame roll)
I would like to get a score of 10 plus the combined scores of the next two rolls

As a user
When I get a spare roll (all 10 pins down in 2 rolls (whole frame))
I would like to get a score of 10 plus the score of the next roll

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class BowlingScorecard(io)
  def initialize
    @io = io
    @name = name
    @frame_counter = 1
    @overall_score = {1 => 0, 2 => 0, 3 => 0, 4 => 0,
      5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0, 10 => 0}
  end

  def game_controller
    

  end

  def prompt_user
    puts "Frame: #{frame_counter}"
    puts "Please enter your roll: "
    user_roll = gets.chomp
  end

  def normal_frame
    rolls = 2 # minus one each roll. Minus two if strike on roll one
    
    while rolls > 0
      prompt_user
      @overall_score[@frame_counter] += user_roll
      rolls -= 1
    end
    @frame_counter += 1
  end

  def strike_frame

  end

  def spare_frame

  end

  def final_frame

  end

  def return_final_score

  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
scorecard = BowlingScorecard.new
scorecard.prompt_user #=> "Frame: 1"
scorecard.prompt_user #=> "Please enter your roll: "

# 2
scorecard = BowlingScorecard.new


# 3
reminder = Reminder("Kay")
reminder.remind_me_to("")
reminder.remind() # => ", Kay!"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
