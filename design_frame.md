# Frame Class Design Recipe

## 1. Describe the Problem

First throw of a frame:
As a user, if I knock down all ten pins on my first throw of a frame, I want the program to automatically record a strike and move on to the next frame.

Second throw of a frame:
As a user, if I knock down all ten pins on the first and the second throw of a frame, I want the program to record a spare and move on to the next frame.

Open frame:
As a user, if I do not knock down all ten pins on a frame, I want the program to record an open frame and move on to the next frame.

10th frame:
As a user, when I reach the 10th frame, I want the program to allow me to make up to three throws if necessary, and to correctly calculate my score based on the number of pins knocked down in each throw.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class Reminder
  def initialize(name) # name is a string
    # ...
  end

  def remind_me_to(task) # task is a string
    # No return value
  end

  def remind()
    # Throws an exception if no task is set
    # Otherwise, returns a string reminding the user to do the task
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
reminder = Reminder("Kay")
reminder.remind_me_to("Walk the dog")
reminder.remind() # => "Walk the dog, Kay!"

# 2
reminder = Reminder("Kay")
reminder.remind() # fails with "No task set."

# 3
reminder = Reminder("Kay")
reminder.remind_me_to("")
reminder.remind() # => ", Kay!"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


