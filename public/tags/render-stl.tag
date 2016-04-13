<render-stl>

  <script>
    this.on('mount', function() {
      var request = new XMLHttpRequest();
      request.open('GET', '/stlModel/UtahHR.stl');
      request.addEventListener('load', () => {
        renderMesh(JSON.parse(request.responseText), $(this.root));
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
