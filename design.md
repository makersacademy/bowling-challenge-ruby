# Bowling Challenge Multi-Class Planned Design Recipe

## 1. Describe the Problem

Count and sum the scores of a bowling game for one player.

### Bowling scoring

Scoring it bowling is pretty tricky. This is a representation of how the logic works.

```mermaid
flowchart TD
    F1[Frame 1] --> B1.1{Ball 1}
    B1.1 -->|Score < 10| B1.1S[Record B1 score]
    B1.1 -->|Score == 10| NF1.1[<strong>Strike</strong>: FS pending and<br />move to next frame]
    NF1.1 -->|Carry strike from F1| F2
    B1.2 -->|Frame score == 10| NF1.2[<strong>Spare</strong>: BS2 pending and move<br />to next fame]
    NF1.2 -->|Carry spare from F1| F2
    B1.1S --> B1.2{Ball 2}
    B1.2 -->|Frame score < 10| FS1.2[Record F1 score and<br />move to next frame]
    FS1.2 --> F2

    F2[Frame 2] --> B2.1{Ball 1}
    B2.1 -->|Score < 10| B2.1S{B1 score}
    B2.1 -->|Score == 10| NF2.1{<strong>Strike</strong>:<br />FS pending<br />and move to<br />next frame}
    NF2.1 -->|If strike from F1,<br />carry strikes from F1 & F2| F3
    NF2.1 -->|If spare from F1,<br />record F1 bonus| F3
    NF2.1 -->|If no strike from F1,<br />carry strike from F2| F3
    B2.2 -->|Frame score == 10| NF2.2[<strong>Spare</strong>: BS2 pending and move<br />to next fame]
    NF2.2 -->|Carry spare from F2| F3
    B2.1S -->|Record score.<br />Next ball.| B2.2{Ball 2}
    B2.1S -->|Spare from F1| B2.1Ss[Add bonus to<br />F1 score]
    B2.1Ss --> B2.2
    B2.2 -->|Strike from F1| B2.2Ss[Add bonus to<br />F1 score]
    B2.2Ss --> F3[Add bonus to<br />F1 score]
    B2.2 -->|Frame score < 10| FS2.2[Record frame score and<br />move to next frame]
    FS2.2 --> F3[Frame 3]
```

## 2. Design the Class System

```mermaid
classDiagram
    Application <|-- Frame
    Application <|-- ScoreCard
    Application <|-- Gameplay
    Application : +array frames
    Application : +object gameplay
    Application : +run()
    Application : +create_frames()
    class Frame{
      +array ball_scores
      +int bonus_score
      +bool strike
      +bool spare
      +add_ball_score(ball, ball_score)
      +get_ball_score(ball)
      +update_bonus_score(score)
      +bonus_score()
      +two_balls?()
      +strike(ball)
      +strike?()
      +spare()
      +spare?()
      +frame_score()
      +total_frame_score()
    }
    class ScoreCard{
      +update_pending_bonuses(frames, current_frame)
      +show_scorecard(frames)
      -update_pending_strikes(frames, current_frame)
      -update_pending_spares(frames, current_frame)
      -scorecard_segment(frame, frame_number)
      -scorecard_segment_frame_10(frame)
    }
    class Gameplay{
      +int current_frame
      +int current_ball
      +object scorecard
      +score_prompt(frames)
      +process_current_ball(frame, input)
      +next_ball(frames)
      +continue?(frames)
      +final_score(frames)
      -validate_input(input, frames)
    }
```

<!-- ## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# # Gets all tracks
# library = MusicLibrary.new
# track_1 = Track.new("Carte Blanche", "Veracocha")
# track_2 = Track.new("Synaesthesia", "The Thrillseekers")
# library.add(track_1)
# library.add(track_2)
# library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Creates the `@frames` array of `frame` objects
app = Application.new
app.return_frames.length # => 10
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._ -->
