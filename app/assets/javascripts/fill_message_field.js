var player1 = $('.chess-holder').data('player1');
var player2 = $('.chess-holder').data('player2');
var currentUser = $('body').data('user');
$('#message-sender').val($('body').data('user'));

if (currentUser == player1) {
  $('#message-recipient').val(player2);
} else {
  $('#message-recipient').val(player1);
}
