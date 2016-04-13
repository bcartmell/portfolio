<render-stl>
  <loading-icon></loading-icon>
  <script>
    this.getModel = function(modelUrl) {
      var request = new XMLHttpRequest();
      request.open('GET',modelUrl);
      request.addEventListener('load', () => {
        $(this.root).find('loading-icon').remove();
        renderMesh(JSON.parse(request.responseText), $(this.root));
      });
      request.send();
    };

    this.calcHeight = function() {
      $(this.root).height($(this.root).innerWidth() / 1.618);
    }

    this.on('mount', function() {
      this.calcHeight();
      this.getModel('/stlModel/UtahHR.stl');
    });
  </script>

  <style>
    render-stl {
      background: #474747;
      display: block;
    }

    render-stl canvas {
      z-index: 1;
    }

    render-stl loading-icon {
      display: block;
      height: 100%;
      width: 100%;
      z-index: 0;
    }

    render-stl loading-icon i {
      top: 55%;
    }
  </style>
</render-stl>
