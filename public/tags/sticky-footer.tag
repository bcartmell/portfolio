<sticky-footer id="sticky-footer" class="u-cf u-full-width">
  <yield/>

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
      $(window).resize(stickyFooterCalc);
    });
  </script>

  <style>
    sticky-footer {
      background: #222;
    }
  </style>
</sticky-footer>
