<render-stl>
  <button type="button" class="load-model-button" data-source="url(/stlModel/sphere_chopped.stl)">
    load chopped sphere
  </button>
  <button type="button" class="load-model-button" data-source="url(/stlModel/UtahHR.stl)" data-url="">
    load teapot
  </button>

  <div class="model-container">
    <loading-icon>
      <p>
        parsed .stl files can be big, this may take a minute.
      </p>
    </loading-icon>
    <progress-indicator></progress-indicator>
  </div>

  <script>
    getModel(modelUrl) {
      var request = new XMLHttpRequest();
      request.open('GET',modelUrl);
      request.addEventListener('load', () => {
        renderMesh(JSON.parse(request.responseText), $(this.root).find('.model-container'));
        // $(this.root).find('loading-icon').hide();
        // $(this.root).find('progress-indicator').hide();
        $(this.root).addClass('loaded');
      });

      request.addEventListener('progress', (event) => {
        $(this.root).find('.progress-bar').width((event.loaded / event.total)*100 +'%');
      });

      request.send();
    }

    clearModel() {
      // $(this.root).find('loading-icon').show();
      // $(this.root).find('progress-indicator').show();
      $(this.root).find('canvas').remove();
      $(this.root).removeClass('loaded');
    }

    loadModel(sourceStr) {
      const source = sourceStr.split(/\(|\)/);
      switch (source[0]) {
        case 'url':
          this.getModel(source[1]);
          break;
        case 'file':
          break;
      }
    }

    calcHeight() {
      $(this.modelContainer).height($(this.modelContainer).innerWidth() / 1.618);
    }

    this.on('mount', function() {
      const self = this;
      this.modelContainer = $(this.root).find('.model-container');

      this.calcHeight();
      $(this.root).on('click', '.load-model-button', function(event) {
        self.clearModel();
        self.loadModel($(this).attr('data-source'));
      });
      this.loadModel('url(/stlModel/UtahHR.stl)');
    });
  </script>

  <style scoped>
    :scope {
      display: block;
    }

    .model-container {
      background: #474747;
      display: table;
      margin-bottom: 4em;
      position: relative;
      text-align: center;
      width: 100%;
    }

    canvas {
      z-index: 1;
      opacity: 0;
      transition: opacity .3s ease-in-out;
    }

    :scope.loaded loading-icon,
    :scope.loaded progress-indicator {
      display: none;
    }

    :scope.loaded canvas {
      opacity: 1;
    }
  </style>
</render-stl>
