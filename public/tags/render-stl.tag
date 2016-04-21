<render-stl>
  <loading-icon></loading-icon>
  <progress-indicator></progress-indicator>
  </div>

  <script>
    this.getModel = function(modelUrl) {
      var request = new XMLHttpRequest();
      request.open('GET',modelUrl);
      request.addEventListener('load', () => {
        $(this.root).find('loading-icon').remove();
        $(this.root).find('progress-indicator').remove();
        renderMesh(JSON.parse(request.responseText), $(this.root), function() {
          $(this.root).addClass('loaded');
        }.bind(this));
      });

      request.addEventListener('progress', (event) => {
        $(this.root).find('.progress-bar').width((event.loaded / event.total)*100 +'%');
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
      display: table;
      margin-bottom: 4em;
      position: relative;
      text-align: center;
      width: 100%;
    }

    render-stl canvas {
      z-index: 1;
      opacity: 0;
      transition: opacity .3s ease-in-out;
    }

    render-stl.loaded {
      display: inline-block;
    }

    render-stl.loaded canvas {
      opacity: 1;
    }
  </style>
</render-stl>
