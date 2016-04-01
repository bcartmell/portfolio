<star-rating data-rating-value>
  <span class="star"></span>
  <span class="star"></span>
  <span class="star"></span>
  <span class="star"></span>
  <span class="star"></span>

  <script>
    this.on('mount', function() {
      var rating = this.opts.dataRatingValue;
      $('.star', this.root).each(function(index) {
        if (index < rating) $(this).addClass('lit');
      });
    });
  </script>

  <style>
    star-rating {
      display: block;
      text-align: center;
    }
    .star {
      display: inline-block;
      color: #777;
      width: 0px;
      height: 0px;
      border-right:  10px solid transparent;
      border-bottom: 7px  solid;
      border-left:   10px solid transparent;
      -moz-transform:    rotate(35deg);
      -webkit-transform: rotate(35deg);
      -ms-transform:     rotate(35deg);
      -o-transform:      rotate(35deg);
    }
    .star:before {
      border-bottom: 8px solid;
      border-left: 3px solid transparent;
      border-right: 3px solid transparent;
      position: absolute;
      height: 0;
      width: 0;
      top: -5px;
      left: -7px;
      display: block;
      content: '';
      -webkit-transform: rotate(-35deg);
      -moz-transform:    rotate(-35deg);
      -ms-transform:     rotate(-35deg);
      -o-transform:      rotate(-35deg);

    }
    .star:after {
      position: absolute;
      display: block;
      top: 1px;
      left: -11px;
      width: 0px;
      height: 0px;
      border-right: 10px solid transparent;
      border-bottom: 7px solid;
      border-left: 10px solid transparent;
      -webkit-transform: rotate(-70deg);
      -moz-transform:    rotate(-70deg);
      -ms-transform:     rotate(-70deg);
      -o-transform:      rotate(-70deg);
      content: '';
    }

    .star.lit {
      color: #FFBF00;
    }
  </style>
</star-rating>


