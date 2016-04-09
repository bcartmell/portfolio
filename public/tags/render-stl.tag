<render-stl>

  <script>
    this.on('mount', function() {
      const request = new XMLHttpRequest();
      request.open('GET', '/stlModel/sphere_chopped.stl');
      request.addEventListener('load', () => {
        renderMesh.addModel(JSON.parse(request.responseText), this.root);
      });
      request.send();
    });
  </script>
</render-stl>
