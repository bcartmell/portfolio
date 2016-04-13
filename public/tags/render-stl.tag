<render-stl>

  <script>
    this.on('mount', function() {
      var request = new XMLHttpRequest();
      var self = this;
      request.open('GET', '/stlModel/UtahHR.stl');
      request.addEventListener('load', function() {
        renderMesh(JSON.parse(request.responseText), $(self.root));
      });
      request.send();
    });
  </script>

  <style>
    render-stl {
      display: block;
    }
  </style>
</render-stl>
