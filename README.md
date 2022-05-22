Bowling Challenge in Ruby
=================

This is the week 5 weekend challenge for Makers Academy Bootcamp. <br>

For this challenge we have been asked to make a scoring programme for ten pin bowling. 

Planning
=======

```mermaid

flowchart TD
    A(START HERE Frame Number n)
    B(Ask how many pins knocked down)
    C{Is it a strike?}
    D(next frame log 'strike' in carry_1)
    E(Does this frame have a carry?)
    F(Is the carry_1 a strike or spare?)
    G(next frame log 'strike' in carry_2)
    H(Calculate score for spare in previous round)
    I((Is it a Spare?))
    J(log the score in pins_down)
    K(Next frame log 'spare' in carry_1)
    L(Does this frame have a carry_2?)
    M(Roll 1)
    N(Roll 2)
    O(Get number of pins knocked down)
    P(Not a spare)
    Q(Next Frame)
    R(Yes a spare)
    S(Yes a strike)
    T(Not a strike)
    U(Calculate score for strike two rounds ago)
    V(Does this frame have a carry?)
    W(This frame log 'strike' in carry_2)
    A --> M
    B --> O
    M --> B
    N --> B
    N --> I
    M --> C
    C -->|Yes| S
    S --> Q
    S --> D
    S --> E
    E -->|Carry 1| F
    E -->|Carry 2| U
    F -->|Strike| G
    F -->|Spare| H
    C -->|No| T
    T --> J
    I -->|No| P
    P --> J
    P --> Q
    I -->|Yes|R
    R --> K
    K --> L
    L -->|Yes|U
    R --> Q
    T --> N
    J --> V
    V -->|Spare|H
    V -->|Strike|W
    

```

Still need to think about Does this frame have a carry --> no
Next frame
Next roll
Frame 10

But it is getting there I think 

I'm a bit confused as to the carry 1's and carry 2's - are they fit for purpose? Or do we need 'internal' 1 and 2 and 'external' 1 and 2 - so one is about carrying a strike from roll 1 to roll 2 and the other is about carrying a striker from frame x to frame y to frame z?