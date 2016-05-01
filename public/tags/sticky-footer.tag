<sticky-footer id="sticky-footer" class="u-cf u-full-width">
  <div class="message">
    <yield/>
  </div>

  <script>

    this.on('mount', function() {
      function stickyFooterCalc() {
        if (okieHelpers.getViewHeight() > $('body').height()) {
          $('sticky-footer')
            .css('position', 'absolute')
            .css('top', okieHelpers.getViewHeight() - $('sticky-footer').outerHeight());
        } else {
          $('sticky-footer')
            .css('position', '')
            .css('top', '');
        }
      }
      stickyFooterCalc();
      $('img').load(stickyFooterCalc);
      $(window).resize(stickyFooterCalc);
    });
  </script>

  <style>
    sticky-footer {
      background: #222;
    }

    .sticky-footer .message {
      font-size: 12px;
    }
  </style>
</sticky-footer>
