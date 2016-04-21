<progress-indicator>
  <div class="progress-bar"></div>

  <script>
    this.on('mount', function() {
    });
  </script>

  <style>
    progress-indicator {
      background: #000;
      height: .1em;
      position: absolute;
        top: 80%;
        left: 20%;
      width: 60%;
    }

    progress-indicator .progress-bar {
      background: #00B6DE;
      box-shadow: 0 0 8px 1px #00839F;
      width: 0;
      height: 100%;
    }
  </style>
</progress-indicator>
