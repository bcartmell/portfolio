<image-reel data-images>
  <div class="image-reel-window">
    <yield/>
  </div>


  <style>
    image-reel {
      position: relative;
      margin: 2.5rem;
    }
    
    image-reel:before,
    image-reel:after {
      content: '';
      position: absolute;
      top: 0;
      width: 25px;
      height: 100%;
    }

    .image-reel-window {
      background: #EFEFEF;
      box-shadow: inset 0 0 9px -4px;
      padding: 1em 1.3em;
      overflow: auto;
      text-align: center;
    }

    image-reel img {
      display: inline-block;
      max-height: 244px;
      max-width: 100%;
      max-width: calc(100% - 1.6em);
      margin: .8em;
      box-shadow: 2px 3px 18px -6px;
    }
  </style>
</image-reel>
