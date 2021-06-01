Copy paste the following to diagram.codes to edit model image

"START Frame"
IF "Is roll 1 a strike?"
 "end frame" "apply strike bonus using  
 score of next two rolls"
ELSE
 "Ask player for roll 2 score"
IF "Roll 2 gives a spare?"
 "apply spare bonus using 
 score of first roll of next frame"
ELSE
 "Frame score = R1 + R2"