
var setCapturedPieces = function(data) {
  // variables for number of each piece on the board
  var numBlackPawns = (data.fen.split(" ")[0].match(/p/g) || []).length;
  var numWhitePawns = (data.fen.split(" ")[0].match(/P/g) || []).length;
  var numBlackRooks = (data.fen.split(" ")[0].match(/r/g) || []).length;
  var numWhiteRooks = (data.fen.split(" ")[0].match(/R/g) || []).length;
  var numBlackKnights = (data.fen.split(" ")[0].match(/n/g) || []).length;
  var numWhiteKnights = (data.fen.split(" ")[0].match(/N/g) || []).length;
  var numBlackBishops = (data.fen.split(" ")[0].match(/b/g) || []).length;
  var numWhiteBishops = (data.fen.split(" ")[0].match(/B/g) || []).length;
  var numBlackQueens = (data.fen.split(" ")[0].match(/q/g) || []).length;
  var numWhiteQueens = (data.fen.split(" ")[0].match(/Q/g) || []).length;

  // display captured pieces  - bp, wP, bk, wK, bb, wB, bq, wQ, br, wR

  // pawns
  var bPawnDiff = 8 - numBlackPawns;
  var numWindowBlackPawns = $('.black-pieces').find('img[src*=bP]').length;
  if (bPawnDiff > numWindowBlackPawns) {
    $('.black-pieces').append('<img src="/assets/bP.png" class="small-icons">');
  }
  var wPawnDiff = 8 - numWhitePawns;
  var numWindowWhitePawns = $('.white-pieces').find('img[src*=wP]').length;
  if (wPawnDiff > numWindowWhitePawns) {
    $('.white-pieces').append('<img src="/assets/wP.png" class="small-icons">');
  }

  // rooks
  var bRookDiff = 2 - numBlackRooks;
  var numWindowBlackRooks = $('.black-pieces').find('img[src*=bR]').length;
  if (bRookDiff > numWindowBlackRooks) {
    $('.black-pieces').append('<img src="/assets/bR.png" class="small-icons">');
  }
  var wRookDiff = 2 - numWhiteRooks;
  var numWindowWhiteRooks = $('.white-pieces').find('img[src*=wR]').length;
  if (wRookDiff > numWindowWhiteRooks) {
    $('.white-pieces').append('<img src="/assets/wR.png" class="small-icons">');
  }

  // knights
  var bKnightDiff = 2 - numBlackKnights;
  var numWindowBlackKnights = $('.black-pieces').find('img[src*=bN]').length;
  if (bKnightDiff > numWindowBlackKnights) {
    $('.black-pieces').append('<img src="/assets/bN.png" class="small-icons">');
  }
  var wKnightDiff = 2 - numWhiteKnights;
  var numWindowWhiteKnights = $('.white-pieces').find('img[src*=wN]').length;
  if (wKnightDiff > numWindowWhiteKnights) {
    $('.white-pieces').append('<img src="/assets/wN.png" class="small-icons">');
  }

  // bishops
  var bBishopDiff = 2 - numBlackBishops;
  var numWindowBlackBishops = $('.black-pieces').find('img[src*=bB]').length;
  if (bBishopDiff > numWindowBlackBishops) {
    $('.black-pieces').append('<img src="/assets/bB.png" class="small-icons">');
  }
  var wBishopDiff = 2 - numWhiteBishops;
  var numWindowWhiteBishops = $('.white-pieces').find('img[src*=wB]').length;
  if (wBishopDiff > numWindowWhiteBishops) {
    $('.white-pieces').append('<img src="/assets/wB.png" class="small-icons">');
  }

  // queens
  var bQueenDiff = 1 - numBlackQueens;
  var numWindowBlackQueens = $('.black-pieces').find('img[src*=bQ]').length;
  if (bQueenDiff > numWindowBlackQueens) {
    $('.black-pieces').append('<img src="/assets/bQ.png" class="small-icons">');
  }
  var wQueenDiff = 1 - numWhiteQueens;
  var numWindowWhiteQueens = $('.white-pieces').find('img[src*=wQ]').length;
  if (wQueenDiff > numWindowWhiteQueens) {
    $('.white-pieces').append('<img src="/assets/wQ.png" class="small-icons">');
  }
};
