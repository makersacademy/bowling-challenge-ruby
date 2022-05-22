Bowling Challenge in Ruby
=================

This is the week 5 weekend challenge for Makers Academy Bootcamp. <br>

For this challenge we have been asked to make a scoring programme for ten pin bowling. 

Planning
=======

```mermaid

flowchart TD
    A(Frame Number) --> B(Ask how many pins knocked down)
    B --> C{Is it a strike?}
    C -->|Yes| D(next frame log 'strike' in carry_1)
    D --> E(Does this frame have a carry?)
    E -->|Carry 1| F(Is the carry_1 a strike or spare?)
    E -->|Carry 2| H
    F -->|Strike| G(Next roll log carry_2)
    F -->|Spare| H(Calculate score for previous round)
    C -->|No| I((Is it a Spare?))
    I -->|No| J(log the score in pins_down)
    J --> E
    I -->|Yes|K(Next frame log 'spare' in carry_1)
    K --> L(Does this frame have a carry_2?)
    L -->|Yes|H

```

Still need to think about Does this frame have a carry --> no
Next frame
Next roll
Frame 10

But it is getting there I think 