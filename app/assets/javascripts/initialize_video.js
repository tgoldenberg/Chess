
var videoConference = function() {
  $('.game-over').toggle().delay(2000).queue(function(next) {
    $('.captured-pieces').addClass('bounceOutDown');
    $('#board').delay(800).animate({
      "margin-left": "200px"
    }, 'easeOutBounce');
    $('#board').promise().done(function() {
      $(this).css({
        'float': 'right',
        'margin-left': '0',
        'margin-right': '10px'
      });
      $('.clock').animate({
        "margin-left":"204px"
      }, 'easeOutBounce');
      $('.clock').promise().done(function() {
        $(this).css({
          'position':'absolute',
          'bottom':'0',
        });
        $('.first-space-keeper').hide();
        $('.first-time-box').hide();
        $('.first-button-holder').hide();
        $('.second-space-keeper').fadeOut();
        $(this).animate({
          'height': '138px'
        });
        $('.video-box').delay(500).fadeIn();
        $('.video-box-self').delay(500).fadeIn();
        $('.video-box-self').promise().done(function() {
          $('.game-over').removeClass('bounceIn').addClass('bounceOut');

          var PUBLIC_KEY = '2680b2a108dc3c685fdd05cf24651182';
          var ROOM_NAME = 'example';

          CineIOPeer.init(PUBLIC_KEY);
          // start camera and microphone automatically
          // CineIOPeer.startCameraAndMicrophone();
          // CineIOPeer.startCamera();
          // join a room right away
          CineIOPeer.join(ROOM_NAME);
          // If user rejected permission to access camera / microphone
          CineIOPeer.on('media-rejected', function(data) {
            alert('Media rejected.');
          });
          // when local or remote media is added
          CineIOPeer.on('media-added', function(data) {
            var videoDOMNode = data.videoElement, domId;
            if (data.local) {
              // local video
              domId = 'myVideo';
            } else {
              // remote video
              domId = 'otherVideos';
            }
            $('#' + domId).find('video').hide();
            document.getElementById(domId).appendChild(videoDOMNode);
            $('#myVideo').find('video').css('width', '190px');
            $('#otherVideos').find('video').css('width', '370px');
          });

          $('#camera').click(function() {
            if (CineIOPeer.cameraRunning()) {
              CineIOPeer.stopCamera();
            } else {
              CineIOPeer.startCamera();
            }
          });
          // Error handler
          CineIOPeer.on('error', function(err) {
            if (typeof(err.support) != "undefined" && !err.support) {
              alert("This browser does not support WebRTC.");
            } else if (err.msg) {
              alert(err.msg);
            }
          });
        });
      });
    });
  });
};
