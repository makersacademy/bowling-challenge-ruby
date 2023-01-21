# Spare Frame to Spare Frame
```mermaid
sequenceDiagram

participant fn as Frame 1 [ f(n) ]
participant fn1 as Frame 2 [ f(n+1) ]
participant fn2 as Frame 3 [ f(n+2) ] (unplayed frame <br> here for context)

fn ->> fn1: Roll 1:  FnR1
fn ->> fn1: Roll 2: FnR1 + FnR2 + 2(F(n+1)R1)

fn1 ->> fn2: Roll 1: F(n+1)R1
fn1 ->> fn2: Roll 2: F(n+1)R1 + F(n+1)R2 + 2(F(n+2)R1)

```
## State diagram
```mermaid
stateDiagram-v2
direction LR
state "Frame n, n <= 10" as fn
state "Frame (n+1), n < 10" as fn1

state "Roll_1" as r1
state "Roll_2" as r2
[*] --> r1
r2 --> fn1
Strike --> fn1
Hit1 --> Spare
Hit1 --> Hit2
Hit1 --> Gutter2
Gutter1 --> Gutter2
Gutter1 --> Hit2
Gutter1 --> Spare
state fn{
    direction LR
    state r1{
    direction LR
    Hit1:Hit
    Gutter1:Gutter
    Strike
    }
    state r2{
    direction LR
    Hit2:Hit
    Gutter2:Gutter
    Spare
    }

}

%%    state fn1{
%% direction LR
  
%% }
 
```
# strike Frame to Spare Frame
```mermaid
sequenceDiagram

participant fn as Frame 1 [ f(n) ]
participant fn1 as Frame 2 [ f(n+1) ]
participant fn2 as Frame 3 [ f(n+2) ] (unplayed frame <br> here for context)

fn ->> fn1: Roll 1:  FnR1
fn ->> fn1: Roll 2: FnR1 + FnR2 + 2(F(n+1)R1)

fn1 ->> fn2: Roll 1: n score F(n+1)R1
fn1 ->> fn2: Roll 2: F(n+1)R1 + F(n+1)R2 + 2(F(n+2)R1)

```