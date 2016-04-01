<sticky-footer class="u-cf u-full-width">
  <yield/>

  <script>
    var stickyFooter = {
      init: function(element, callback) {
        if ($('#body-wrap').length === 0) {
          $('body').children().not('.modal').wrapAll('<div id="body-wrap"></div>');
        }

        $(element).before('<div id="sticky-footer-spacer"></div>');
        stickyFooter.calc(element, $('#sticky-footer-spacer'));
        $(window).resize(function() {
          stickyFooter.calc(element, $('#sticky-footer-spacer'));
        });
        if (callback) callback();
      },
      calc: function(footer, spacer) {
        if ($('#body-wrap').height() < $(window).height()) {
          $('#body-wrap').height($(window).height());
        }
        $(spacer).css('height', $(footer).outerHeight() + parseInt($(footer).css('margin-top')));
      }
    };

    this.on('mount', function() {
      stickyFooter.init('sticky-footer')
      $(window).resize(function() {
        stickyFooter.calc('sticky-footer', '#sticky-footer-spacer');
      });
    });
  </script>

  <style>
    sticky-footer {
      background: #222;
      position: absolute;
        bottom: 0;
    }

    #sticky-footer-spacer {
      clear: both;
      width: 100%;
    }

    #body-wrap {
      /* #body-wrap must be 100% height and width and relatively positioned */
      /* the sticky-footer will be absolutely positioned at the bottom */ 
      min-height: 100%;
      position: relative;

      /* Can't remember why this is here. */
      /* If something breaks, uncomment the line bellow */
      /* Maybe it will help */
      z-index: 1;  
    }
  </style>
</sticky-footer>
