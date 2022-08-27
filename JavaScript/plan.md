roll = 0
roll = 0
frame = [0,0]
score = 0
Scored: 0

gutter game:
game = [[0,0][0,0]...]
total = 0

spare
roll = 5
roll = 5
score = 10
Scored: Spare

strike
roll = 10

score = 10
Scored: Strike

10th frame:
if frame 10 score = 10
+roll
[]

```JavaScript
  // frameScore(frame) {
  //   this.isSpare(frame);
  //   console.log("You scored a Spare");

  //   console.log(`You scored: ${parseInt(frame[0]) + parseInt(frame[1])}`);
  //   this.scoreCard.push(parseInt(frame[0]) + parseInt(frame[1]));
  // }

  // rolls(roll1, roll2) {
  //   this.frames.push([roll1, roll2]);
  // }
  // makeFrames() {
  //   let frame = 1;
  //   while (frame <= 10) {
  //     console.log(`Frame ${frame}`);

  //     let roll1 = prompt("First roll: ");

  //     if (parseInt(roll1) === 10) {
  //       // strike
  //       this.rolls(roll1, 0);
  //     } else {
  //       let roll2 = prompt("Second roll: ");

  //       if (parseInt(roll1) + parseInt(roll2) === 10) {
  //         // spare
  //       }

  //       this.rolls(roll1, roll2);

  //       // console.log(`frames ${this.frames[frame - 1]}`);

  //       this.frameScore(this.frames[frame - 1]);
  //     }

  //     console.log(" ");
  //     frame++;
  //   }
  // }
```
