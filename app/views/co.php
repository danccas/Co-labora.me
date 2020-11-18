<style>
body > main {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}
body > main > .streaming {
  max-height: 100vh;
  height: 100vh;
  text-align: center;
}
body > main > .streaming > video {
  height: 100%;
}
.streaming-title {
  position: absolute;
  left: 100px;
  top: 32px;
  font-size: 1.5rem;
  font-family: 'BoingSemiBold', Helvetica, Arial, sans-serif;
  color: #fff;
  text-shadow: 1px 1px 1px black;
}
.streaming-title > p {
  font-size: 14px;
  color: #00ffbb;
  user-select: none;
}
.streaming-title > p > span {
  background: #5c5c5c;
  color: #fff;
  padding: 3px 10px;
  font-size: 14px;
  border-radius: 3px;
  cursor: pointer;
}
.streaming-title > p > span:hover {
  background: #b700ff;
}
.streaming-title > p > span.is-favorite {
  background: #b700ff;
}
.streaming-screen {
  position: absolute;
  left: 0;
  right: 0;
  bottom: 60px;
  padding: 10px 100px;
  text-align: center;
  font-size: 0.8rem;
  color: #fff;
  text-shadow: 1px 1px 1px black;
  display: none;
  background: linear-gradient(0, transparent 0%, rgba(0, 0, 0, 0.24) 10% 90%, transparent 100%);
}
.streaming-screen > h1 {
  font-size: 5rem;
  color: #ffffff;
}
.streaming-screen li {
  display: inline-block;
  font-size: 2em;
  background: #0094fd;
  padding: 0.4em;
  border-radius: 7px;
  margin: 25px 50px;
  cursor: pointer;
  transition: all 0.25s ease-out;
  user-select: none;
}
.streaming-screen li:hover {
  background: #a7a0a0;
}
.streaming-screen li:active {
  background: #000!important;
  zoom: 1.2;
}
.streaming-console {
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0px;
  padding: 10px 100px;
  text-align: center;
  font-size: 0.8rem;
  color: #fff;
  text-shadow: 1px 1px 1px black;
  background: rgba(0, 0, 0, 0.12941176470588237);
}
.streaming-tag {
  position: absolute;
  right: 10%;
  margin-top: -35px;
  padding: 5px 15px;
  font-size: 20px;
  border-radius: 6px;
}
.streaming-message {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  text-align: center;
  font-size: 1.5rem;
  font-family: 'BoingSemiBold', Helvetica, Arial, sans-serif;
  color: #fff;
  text-shadow: 1px 1px 1px black;
}
.streaming-amount {
  position: absolute;
  left: 0;
  top: 100px;
  background: #0093ff;
  font-family: 'BoingSemiBold', Helvetica, Arial, sans-serif;
  color: #ffffff;
  text-shadow: 1px 1px 1px black;
  text-align: center;
  padding: 20px 100px;
  border-radius: 0 5px 5px 0;
  font-size: 30px;
}
#StreamingVideo {
  width: 100%;
  height: 100%;
}
footer {
  display: none!important;
}
</style>
<div class="streaming-title">
  #<?= toHashtag($nombre) ?>
  <p>
    <?= $usuario_nombres ?> 
  </p>
</div>
<?php if($estado == RECAUDACION_FINALIZADO) { ?>
<div class="streaming-message">
  <div class="content-vertical-center">
    <h1>La recaudación ha finalizado</h1>
  </div>
</div>
<div class="streaming-console">
  Terminó el <?= fecha_larga($fecha_hasta, true) ?>
</div>
<?php } else {  ?>
<div class="streaming-amount">
  S/. <?= $monto_recaudado ?>
</div>
<div class="streaming">
  <div id="StreamingVideo"></div>
</div>
<div class="streaming-screen">
  <span class="streaming-tag"></span>
  <h1></h1>
  <ul></ul>
</div>
<script>
var IDENTIDAD = {
  tipo: 'ax',
  id: <?= Identify::g()->id ?>,
  room_id: <?= $id ?>,
  nick: '<?= Identify::g()->user ?>',
};
</script>
<script src="https://meet.jit.si/external_api.js"></script>
<script>
var api = null;
var domain = 'meet.jit.si';
var options = {
  roomName: "<?= $codigo_streaming ?>",
  width: '100%',
  height: '100%',
  parentNode: document.getElementById('StreamingVideo'),
  configOverwrite: {
    enableNoAudioDetection: false,
    enableNoisyMicDetection: false,
    startWithVideoMuted: true,
    startWithAudioMuted: true,
    enableTalkWhileMuted: false,
  },
  interfaceConfigOverwrite: {
    MOBILE_APP_PROMO: false,
    LANG_DETECTION: true,
    filmStripOnly: false,
    SHOW_JITSI_WATERMARK: false,
    SHOW_WATERMARK_FOR_GUESTS: false,
    DEFAULT_BACKGROUND: '#1A73E8',
    GENERATE_ROOMNAMES_ON_WELCOME_PAGE: false,
    SHOW_CHROME_EXTENSION_BANNER: false,
    SHOW_PROMOTIONAL_CLOSE_PAGE: false,
    DEFAULT_REMOTE_DISPLAY_NAME: 'Espectador',
    TOOLBAR_BUTTONS: [
        'microphone', 'camera','tileview','raisehand','fodeviceselection','chat'
    ],
  },
  userInfo: {
    displayName: '@<?= Identify::g()->user ?>',
  },
}

function iniciar_streaming() {
  api = new JitsiMeetExternalAPI(domain, options);
  api.executeCommand('subject', 'En linea');
  api.addEventListener('readyToClose',  function() {
    detener_streaming();
  });
  $(".resize-drag").slideDown();
}
function detener_streaming() {
  api.dispose();
  $(".resize-drag").slideUp();
}
<?php if($streaming == 1) { ?>
  iniciar_streaming();
<?php } ?>
</script>
<script src="/js/socket-client.js"></script>
<script>
function refresh_followers() {
  var tz = $("#count_viewer");
  Curly({
    url: '<?= Route::link('markFavorite') ?>',
    type: 'POST',
    data: { type: 'refresh' },
    dataType: 'json',
    complete: function(xhr) {
      if(xhr.status == 200) {
        if(xhr.responseJSON.message.count != tz.text()) {
          tz.slideUp(700, function() {
            if(xhr.responseJSON.message.me) {
              tz.addClass('is-favorite');
            } else {
              tz.removeClass('is-favorite');
            }
            tz.text(xhr.responseJSON.message.count).slideDown();
          });
        }
      }
    },
  });
}
setInterval(refresh_followers, 15000);
$("#count_viewer").on('click', function() {
  var tz = this;
  if(typeof tz.bloqueado !== 'undefined' && tz.bloqueado) {
    return;
  }
  $(tz).slideUp();
  tz.bloqueado = true;
  Curly({
    url: '<?= Route::link('markFavorite') ?>',
    type: 'POST',
    data: { type: 'button' },
    dataType: 'json',
    complete: function(xhr) {
      if(xhr.status == 200) {
        $(tz).text(xhr.responseJSON.message.count).slideDown();
        if(xhr.responseJSON.message.me) {
          $(tz).addClass('is-favorite');
        } else {
          $(tz).removeClass('is-favorite');
        }
        tz.bloqueado = false;
      }
    },
  });
});
$(".streaming-screen").on('click', 'li', function() {
  if(typeof this.bloqueado !== 'undefined') {
    return;
  }
  this.bloqueado = true;
  var cid = $(".streaming-screen").attr('data-cid');
  var oid = $(this).attr('data-id');
  Curly({
    url: '<?= Route::link('registerMark') ?>',
    type: 'POST',
    data: { cid: cid, oid: oid },
    dataType: 'json',
    success: function(xhr) {
      $(".streaming-screen").slideUp();
    },
  });
});
$(document).on('socket-message', function(event, data) {
  if(typeof data.action !== 'undefined') {
    if(data.action == 'iniciar') {
      $(".streaming-message").slideUp();
    } else if(data.action == 'detener') {
      location.reload();
    } else if(data.action == 'video') {
      if(data.video) {
        iniciar_streaming();
      } else {
        detener_streaming();
      }
    }
  }
  if(typeof data.screen !== 'undefined') {
    var box = $(".streaming-screen");
    box.slideUp();
    if(data.screen !== null && !empty(data.screen.id)) {
      Curly({
        url: '<?= Route::link('getInfo') ?>',
        type: 'POST',
        data: { cid: data.screen.id },
        dataType: 'json',
        success: function(xhr) {
          if(xhr.code === 200) {
            var x = xhr.message;
            box.attr('data-cid', x.cid);
            box.find('h1').text(x.texto);
            if(!empty(x.imagen)) {
              box.find('img').attr('src', x.imagen).show();
              box.find('h1').hide();
            } else {
              box.find('img').hide();
              box.find('h1').show().text(x.texto);
            }
            box.find('span').text(x.dificultad).css({ background: x.dificultad_color });
            box.find('ul').html('');
            $.each(x.opciones, function(k, v) {
              box.find('ul').append($('<li>').attr('data-id', v.id).text(v.texto));
            });
            box.slideDown();
          }
        }
      });
    }
  }
});
</script>
<?php } ?>
