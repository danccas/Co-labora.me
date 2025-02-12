function _nivelFloat() { if(typeof window.zindex === 'undefined') { window.zindex = 99; } window.zindex++; return zindex; }
var Popy = function(params) {
  var _instance = this;
  var popyNivel = _nivelFloat();
  var idPopy = 'pop_' + popyNivel;
  var overlay;
  var popup;
  var content;
  var loading;
  var is_loading;
  var pop_content;
  var metodosPrivados;
  var waitShake = false;
  var background = "#5BACFF";
  var changing = false;
  metodosPrivados = {
    positionCenter: function() {
      var w = $(pop_content)[0].scrollWidth + 120;
      w = w < 400 ? 400 : (w > 1000 ? 1000 : w);
      content.width(w);
//      console.log('recalcular', content, _instance.parametros.width, $(pop_content)[0].scrollWidth);
      return;
      var calcular_margen = function(maximo, dimension) {
        return dimension >= maximo ? 0 : (maximo - dimension) / 2;
      };
      //var top  = calcular_margen($(window).height(), popup.height());// + $('body').scrollTop();
      var top  = calcular_margen(window.screen.height, popup.height() + 300);// + $('body').scrollTop();
//      top = 25;
      var left = calcular_margen($(window).width(), _instance.parametros.width);
      popup.css({
        top:  top + 'px',
        left: left + 'px',
      });
    },
    init: function(show) {
      $(document).ready(function() {
        if(!$("#popup_" + idPopy).length) {
          _instance.parametros.title = _instance.parametros.title || "";
          _instance.parametros.width = parseInt(_instance.parametros.width) +20 || 350;
          _instance.parametros.height = parseInt(_instance.parametros.height) || 100;
          _instance.parametros.draggable = _instance.parametros.draggable || false;
          _instance.parametros.control = _instance.parametros.control || false;
          _instance.parametros.alwaysShown = typeof _instance.parametros.alwaysShown === 'undefined' ? true : _instance.parametros.alwaysShown;

          var maxHeight = $(window).height() - 80;
          overlay = "<div id=\"overlay_" + idPopy + "\" style=\"display:none;height: 100%; width: 100%; position: fixed; left: 0px; top: 0px; z-index: " + _nivelFloat() + ";background:rgba(0, 0, 0, 0.6);\"></div>";

          //popup = "<div id=\"popup_" + idPopy + "\" style=\"display:none;z-index: " + _nivelFloat() + ";position: fixed;top: 50px;bottom: 50px;left: 0;right: 0;\">";
          popup = "<div id=\"popup_" + idPopy + "\" style=\"display:none;z-index: " + _nivelFloat() + ";position: fixed;top: 0;bottom: 0;right: 0;-webkit-transform: translateX(105%);transform: translateX(105%);transition: 0.5s ease-in-out;\">";

          //popup += "<div id=\"content_" + idPopy + "\" style=\"max-height: 100%;max-width:100%;width: " + _instance.parametros.width + "px;margin: 0 auto;overflow: auto;\">";
          popup += "<div id=\"content_" + idPopy + "\" style=\"max-height: 100%;max-width:100%;width: " + _instance.parametros.width + "px;margin: 0 auto;overflow: auto;height: 100%;\">";
          popup += "<div style=\"box-shadow: rgba(51, 51, 51, 0.8) 0px 0px 15px;background: #fff;height: 100%;\">";
          popup += "<div id=\"scroll_" + idPopy + "\" style=\"max-height: 100%;display: block;overflow-y: auto;position:relative;height:100%;\">";
          if(!empty(_instance.parametros.title) || _instance.parametros.draggable || _instance.parametros.control) {
            popup += "<div id=\"popup_header_" + idPopy + "\" style=\"overflow: hidden;background: #ff5555;margin-bottom: 5px;color: #fff;display: block;font-size: 15px;line-height: 15px;padding: 15px;" + (_instance.parametros.draggable ? "cursor: move;" : "") + "\">" + _instance.parametros.title + (_instance.parametros.control ? "<div popy-close style=\"float:right;cursor:pointer;\">Cerrar</div>" : "") + "</div>";
          }
          popup += "<div data-popy-error id=\"popup_content_error_" + idPopy + "\" style=\"position:relative;text-align: left;background: #ff5454;color: #fff;padding: 5px 10px;font-size: 15px;display:none;\"></div>";
          popup += "<div style=\"position:relative;height:100%;\"><div id=\"popup_loading_" + idPopy + "\" style=\"position: absolute;background: rgba(0, 0, 0, 0.5);z-index: 1;top: -5px;left: 0;right: 0;bottom: 0;font-size: 26px;text-align: center;line-height: 10em;color: #fff;display: none;\">Cargando...</div><div id=\"popup_content_" + idPopy + "\" style=\"position:relative;padding: 15px;\">.</div></div></div></div></div>";
          $("body").prepend(popup);
          $("body").prepend(overlay);
        }
        popup       = $("#popup_" + idPopy);
        content     = $("#content_" + idPopy);
        overlay     = $("#overlay_" + idPopy);
        pop_content = $("#popup_content_" + idPopy);
        header      = $("#popup_header_" + idPopy);
        loading     = $("#popup_loading_" + idPopy);
        boxScroll   = $("#scroll_" + idPopy);

        metodosPrivados.positionCenter();
        window.onresize = function() {
          //metodosPrivados.positionCenter();
        };
        var isDragging = false;
        var positionInitial = null;

        if(_instance.parametros.draggable) {
          header
          .on('mousedown', function(e) {
            isDragging = true;
            positionInitial = {
              left: e.pageX - popup.position().left,
              top : e.pageY - popup.position().top,
            };
          })
          .on('mousemove', function(e) {
            if(isDragging) {
              var relX = e.pageX - positionInitial.left;
              var relY = e.pageY - positionInitial.top;
              $(popup).css({'left': relX, 'top': relY});
            }
          })
          .on('mouseup', function() {
            isDragging = false;
          })
          .on('mouseleave', function() {
            isDragging = false;
          });
        }
        popup.on("submit", "[popy-form]", function(e) {
          e.preventDefault();
          var formz = $(this);
          if($(this).attr("data-block") == 'true') {
            console.log("Blockeado");
            return;
          }
          metodosPrivados.loading(true);
          formz.attr("data-block", true);
          if(popup.find("[popy-form]")[0].checkValidity()) {
            var params = {};
            if(!empty(formz.attr('action'))) {
              params['url'] = formz.attr('action');
            }
            if(!empty(formz.attr('method'))) {
              params['method'] = formz.attr('method');
            }
            if(formz.serialize()) {
              params['data'] = formz.serialize();
            }
            var file = false;
            if(!empty(formz.attr('enctype'))) {
              file = formz;
            }
            metodosPrivados.refresh(params, file, function() {
              metodosPrivados.loading(false);
              formz.attr("data-block", false);
            });
          } else {
            metodosPrivados.loading(false);
            formz.attr("data-block", false);
            //popup.effect("shake", {times:2}, 80);
          }
        });
        pop_content.on("change", "[popy-form]", function(e) {
          e.preventDefault();
          changing = true;
          typeof _instance.parametros.onChange === 'function' && _instance.parametros.onChange(e, _instance);
        });
        pop_content.on("click", "[data-in-popy]", function(e) {
          console.log('data-in-popy', this);
          e.preventDefault();
          var params = {
            url: $(this).attr('href'),
            method: 'GET',
          };
          _instance.parametros['url'] = $(this).attr('href');
          metodosPrivados.loading(true);
          metodosPrivados.refresh(params, null, function() {
            metodosPrivados.loading(false);
          });
          return false;
        });
        pop_content.on("click", "[data-popy]", function(e) {
          var a = $(this);
          if(typeof a.attr('data-confirm') == 'undefined') {
            e.preventDefault();
            popyLink($(this).attr('href'), 600, _instance);
            return false;
          }
        });
        pop_content.bind('DOMNodeInserted DOMNodeRemoved', function(e) {
          e.preventDefault();
          //typeof _instance.parametros.onChange === 'function' && _instance.parametros.onChange(e, _instance);
        });
        pop_content.on("click", "[popy-close]", function(e) {
          e.stopPropagation();
          _instance.close();
        });
        content.on("click", function(e) {
          e.stopPropagation();
        });
        overlay.on("click", function(e) {
          _instance.close();
        });
        popup.on("click", function(e) {
          _instance.close();
        });
        metodosPrivados.refresh();
        if(show == true) {
          metodosPrivados.show();
        }
        typeof _instance.parametros.onInit === 'function' && _instance.parametros.onInit(_instance, content);
      });
    },
    loading: function(x) {
      if(x) {
        is_loading = true;
        loading.show();
      } else {
        is_loading = false;
        loading.slideUp();
      }
    },
    refresh: function(xx, file, callback) {
      var parame = typeof xx !== 'undefined' ? array_merge(_instance.parametros,xx) : _instance.parametros;
      parame.url = typeof parame.url === 'function' ? parame.url() : parame.url;
      if(!empty(parame.html)) {
        $("#popup_content_" + idPopy).empty().html(parame.html);
        typeof parame.onComplete === 'function' && parame.onComplete(_instance);
        typeof analyze_all === 'function' && analyze_all(content);
        metodosPrivados.positionCenter();
      } else {
        $ajax = {
          type:   parame.method,
          url:    parame.url,
          data:   (typeof parame.data === 'function' ? parame.data() : parame.data),
          beforeSend: function() {
            //$("#popup_content_" + idPopy).empty();
          },
          success: function(data) {
            if(typeof data === 'string' && data.substring(0, 5) === 'popy-') {
              var accion = data.split(' ')[0];
              if(accion == 'popy-close') {
                changing = false;
                typeof callback == 'function' && callback();
                _instance.close();
              } else if(accion == 'popy-error') {
                $("#popup_content_error_" + idPopy).slideDown();
                $("#popup_content_error_" + idPopy).html(data.substr(11));
                boxScroll.animate({
                  scrollTop: 0
                }, 500);
                setTimeout(function() {
                  $("#popup_content_error_" + idPopy).slideUp();
                }, 5000);
              } else if(accion == 'popy-ok') {
                if(typeof _instance.parametros.onSuccess == 'function') {
                  _instance.parametros.onSuccess(data.substr(8));
                } else {
                  typeof callback == 'function' && callback();
                  _instance.close();
                }
              } else if(accion == 'popy-refresh') {
                if(typeof _instance.parametros.father === 'object') {
                  changing = false;
                  typeof callback == 'function' && callback();
                  _instance.close();
                  _instance.parametros.father.refresh();
                } else {
                  window.location.reload(true);
                }
              } else if(accion == 'popy-js') {
                changing = false;
                typeof callback == 'function' && callback();
                _instance.close();
                eval(data.substr(8));
              } else if(accion == 'popy-location') {
                window.location = data.split(' ')[1];
              }
            } else {
              $("#popup_content_" + idPopy).empty();
              $("#popup_content_" + idPopy).addClass('ctx');
              $("#popup_content_" + idPopy).html(data);
            }
            metodosPrivados.positionCenter();
          },
          error: function(err) {
            console.log("Error:", err);
            alert("Popy: Ha ocurrido un error");
          },
          complete: function() {
            console.log("COMPLETE", typeof callback, callback);
            changing = false;
            typeof parame.onComplete === 'function' && parame.onComplete(_instance);
            typeof analyze_all === 'function' && analyze_all(content);
            typeof callback == 'function' && callback();
          }
        };
        if(!empty(file)) {
          $ajax.cache       = false;
          $ajax.contentType = false;
          $ajax.processData = false;
          $ajax.data        = new FormData($(file)[0]);
        }
        console.log("AJAX", $ajax, file);
        Curly($ajax, _instance);
      }
    },
    setParametros: function(x) {
      _instance.parametros = array_merge(_instance.parametros, x);
    },
    show: function() {
      overlay.fadeIn(100, function() {
        popup.show().css({
          transform: 'translateX(0)',
        });
      });
    },
    hide: function(cb) {
      popup.css({
        transform: 'translateX(105%)',
      });
      setTimeout(function() {
        overlay.fadeOut(200, function() {
          popup.slideUp(200, cb);
          typeof _instance.parametros.onClose === 'function' && _instance.parametros.onClose();
        });
      }, 500);
//      overlay.fadeOut(200, function() {
//        popup.slideUp(200, cb);
//        typeof _instance.parametros.onClose === 'function' && _instance.parametros.onClose();
//      });
    },
    close: function(x) {
      x = x || false;
      if(is_loading && !x) {
        popyAlert("No es posible cerrar esta ventana, se ha encontrado un proceso en espera.");
        return;
      } else {
        if(changing && !x) {
          popyConfirm("¿Está seguro de cerrar la ventana sin guardar los cambios?", function() {
            changing = false;
            metodosPrivados.close();
          });
          return;
        }
      }
      metodosPrivados.hide(function() {
        overlay.remove();
        popup.remove();
      });
    },
    shake: function() {
      if(waitShake === true) {
        return false;
      }
      waitShake = true;
      if(!empty(popup)) {
        //popup.effect("shake", {times:5, distance: 10}, 100);
      }
      setTimeout(function() {
        waitShake = false;
      }, 250);
      return false;
    }
  };
  metodosPrivados.setParametros(params);
  _instance.getFather = function() { return _instance.parametros.father; };
  _instance.init = function(x) { metodosPrivados.init(x); return _instance; };
  _instance.close = function(x) { metodosPrivados.close(x); return _instance; };
  _instance.hide = function() { metodosPrivados.hide(); return _instance; };
  _instance.show = function() { metodosPrivados.show(); return _instance; };
  _instance.refresh = function(x,y) { metodosPrivados.refresh(x, y); return _instance; };
  _instance.edit = function(x) { metodosPrivados.setParametros(x); return _instance; };
  _instance.getParams = function() { return _instance.parametros; };
  _instance.getElement = function() { return content; };
  _instance.shake = function() { return metodosPrivados.shake(); };
  _instance.positionCenter = function() { return metodosPrivados.positionCenter(); };
  return _instance;
};
/* Plugins */
function popyLink(url , w=600, popy_father) {
  return new Popy({
    url: url,
    width: w,
    father: popy_father,
  }).init(true);
}
function popyAlert(texto) {
  var mensaje = '<div style="padding: 5px 10px;font-size: 16px;text-align: center;color: #000;">';
  mensaje += texto;
  mensaje += '</div>';
  mensaje += '<div style="text-align:center">';
  mensaje += '<hr style="height:1px;background:#ff5555;">';
  mensaje += '<button type="button" popy-close class="button">';
  mensaje += 'Aceptar';
  mensaje += '</button>';
  mensaje += '</div>';
  var a = new Popy({
    title: 'Alerta',
    html: mensaje
  }).init(true);
  //a.getElement().find('[popy-close]').focus();
  a.shake();
}
function popyConfirm(texto, callback_yes, callback_no) {
  var mensaje = '<div style="padding: 5px 10px;font-size: 16px;text-align: center;color: #000;">';
  mensaje += texto;
  mensaje += '</div>';
  mensaje += '<div style="text-align:center">';
  mensaje += '<hr style="height: 1px;background: #d4d4d4;margin: 0.5rem 0;">';
  mensaje += '<button type="button" class="button is-success" data-type="ok" style="margin-right: 30px;">';
  mensaje += 'Si';
  mensaje += '</button>';
  mensaje += '<button type="button" class="button is-danger" data-type="cancel" style="margin-right: 30px;">';
  mensaje += 'No';
  mensaje += '</button>';
  mensaje += '</div>';
  var opcion = null;
  new Popy({
    title: 'Confirmar',
    html: mensaje,
    onComplete: function(popy) {
      popy.getElement().find("button[data-type]").on('click', function() {
        opcion = $(this).attr('data-type');
        popy.close();
      });
    },
    onClose: function() {
      if(opcion == 'ok') {
        typeof callback_yes === 'function' && callback_yes();
      } else {
        typeof callback_no === 'function' && callback_no();
      }
    }
  }).init(true).shake();
}
function popyConfirmOptions(texto, options) {
  var mensaje = '<div style="padding: 5px 10px;font-size: 16px;text-align: center;color: #002F4E;">';
  mensaje += texto;
  mensaje += '</div>';
  mensaje += '<hr style="height:1px;background:#ff5555;">';
  var bloque = $("<div>").html(mensaje);
  var bloke  = $("<div>").css({'text-align':'center'});
  var xxx = null;
  $.each(options, function(index,fn) {
    bloke.append($("<button>").attr('type','button').addClass('button is-info').text(index).css({
      'width': '100%',
      'margin-bottom': '5px',
    }).on('click', function() {
      typeof fn === 'function' && fn();
      xxx.close();
    }));
  });
  bloque.append(bloke);
  xxx = new Popy({
    title: 'Seleccione una opción',
    html: bloque,
    width: 450,
  }).init(true);
  xxx.shake();
}
