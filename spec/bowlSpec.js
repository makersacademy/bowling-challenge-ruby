describe('Game', function(){
  
  var game;

  beforeEach(function(){
    game = new Game(); 
  });

 it('should return 0 for a gutter game', function() {
    rollMany(0, 20)
  expect(game.score).toEqual(0);
 });

 it('should return 20 for a singles game', function(){
   rollMany(1, 20)
   expect(game.score).toEqual(20);
 });

 function rollMany(pins, rolls) {
  for (let i = 0; i < 20; i++) {
    game.roll(pins);
 }
}
});