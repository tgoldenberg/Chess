// set timer
var addedTimePerMove, formatTime, initialTime, intervalId, pad, remainingTime, switchTurn, turn, update;
initialTime = 15 * 60;
addedTimePerMove = 0;
turn = 1;
remainingTime = [initialTime, initialTime];
pad = function(x) {
 return ('0' + x).slice(-2);
};
formatTime = function(t) {
 var hours, minutes, seconds;
 seconds = t % 60;
 minutes = Math.floor(t / 60) % 60;
 hours = Math.floor(t / 3600);
 if (hours) {
   return "" + hours + ":" + (pad(minutes)) + ":" + (pad(seconds));
 } else {
   return "" + minutes + ":" + (pad(seconds));
 }
};
update = function() {
 var i;
 remainingTime[turn]--;
 for (i = 0; i < 2; i++) {
   $("#time" + i).text(formatTime(remainingTime[i]));
 }
 if (remainingTime[turn] <= 0) {
   $("#time" + turn).removeClass('turn').addClass('loser');
   alert('Game Over');
   return clearInterval(intervalId);
 }
};
switchTurn = function() {
   $("#time" + turn).removeClass('turn');
   turn = 1 - turn;
   $("#time" + turn).addClass('turn');
   return remainingTime[turn] += addedTimePerMove;
};
