// set new board //
var currentUser = $('.chess-holder').data('user');
var board,
  game = new Chess(),
  statusEl = $('#status'),
  fenEl = $('#fen'),
  pgnEl = $('#pgn');

// do not pick up pieces if the game is over
// only pick up pieces for the side to move
var onDragStart = function(source, piece, position, orientation) {
  if (game.game_over() === true ||
      (game.turn() === 'w' && "<%= current_user.id %>" === "<%= @room.player2_id %>") ||
      (game.turn() === 'b' && "<%= current_user.id %>" === "<%= @room.player1_id %>") ||
      (game.turn() === 'w' && piece.search(/^b/) !== -1) ||
      (game.turn() === 'b' && piece.search(/^w/) !== -1)) {
    return false;
  }
};

var onDrop = function(source, target) {
  // see if the move is legal
  var move = game.move({
    from: source,
    to: target,
    promotion: 'q' // NOTE: always promote to a queen for example simplicity
  });

  // illegal move
  if (move === null) return 'snapback';
  var trNum = $('tbody').children().length + 1;
  $('.text-list').append('<tr><th><b>' + trNum + '</b> <div class="pipe">|</div> ' + move.from + "-" + move.to + '</th></tr>');

  updateStatus(source, target);
};

// update the board position after the piece snap
// for castling, en passant, pawn promotion
var onSnapEnd = function() {
  board.position(game.fen());
};

var updateStatus = function(source, target) {
  var status = '';

  var moveColor = 'White';
  if (game.turn() === 'b') {
    moveColor = 'Black';
  }

  // checkmate?
  if (game.in_checkmate() === true) {
    status = 'Game over, ' + moveColor + ' is in checkmate.';
  }

  // draw?
  else if (game.in_draw() === true) {
    status = 'Game over, drawn position';
  }

  // game still on
  else {
    status = moveColor + ' to move';

    // check?
    if (game.in_check() === true) {
      status += ', ' + moveColor + ' is in check';
    }
  }

  statusEl.html(status);
  fenEl.html(game.fen());
  pgnEl.html(game.pgn());
  $('#move-notation').val(source + '-' + target);
  $('#move-piece').val(game.fen());
  $('#move-user').val(currentUser)
  $('#move-submit').submit();
};

var cfg = {
  draggable: true,
  showNotation: false,
  position: 'start',
  snapSpeed: 100,
  snapbackSpeed: 400,
  moveSpeed: 'slow',
  pieceTheme: "/assets/{piece}.png",
  onDragStart: onDragStart,
  onDrop: onDrop,
  onSnapEnd: onSnapEnd
};
board = new ChessBoard('board', cfg);

updateStatus();
