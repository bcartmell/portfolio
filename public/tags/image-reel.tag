<image-reel data-images>
  <div class="image-reel-window">
    <yield/>
  </div>

  <script>
    this.on('mount', function() {
      var reel = this.root;

      // create on object to keep track of the container element and each image.
      var reelObj =  {
        element: reel,
        images: [].filter.call(reel.childNodes[0].childNodes, function(node) {
          return node instanceof Element;
        })
      };

      // use okiePub to make our new object a publisher
      okiePub.makePublisher(reelObj);

      // on click event fire an 'imgClick' event via okiePub functionality
      // the event will include the index of the of thumbnail that was clicked.
      reel.addEventListener('click', function(event) {
        reelObj.fire('imgClick', [].indexOf.call(reelObj.images, event.target));
      });

      // create the okieShow object and save it in our tracking object
      reelObj.targetShow = new OkieShow();

      // Clone the thumbnail into a new slide on the OkieShow instance.
      reelObj.images.forEach(function(image) {
        var slideContent = image.cloneNode(false);
        reelObj.targetShow.addSlide(slideContent);
      });

      // the slideshow can be loaded in a modal
      reelObj.modal = okieModal.newModal({
        content: reelObj.targetShow
      });

      // add subscriptions to to the 'imgClick' event
      // which is fired when a thumbnail is clicked.  
      // one subcription to navigate the slideshow to the correct image.
      // and onother to open the modal.
      reelObj.on('imgClick', reelObj.targetShow.toSlide, reelObj.targetShow);
      reelObj.on('imgClick', reelObj.modal.show, reelObj.modal);
    });
  </script>


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
      cursor: pointer;
      display: inline-block;
      max-height: 244px;
      max-width: 100%;
      max-width: calc(100% - 1.6em);
      margin: .8em;
      box-shadow: 2px 3px 18px -6px;
    }
  </style>
</image-reel>
