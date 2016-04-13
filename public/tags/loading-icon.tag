<loading-icon>
  <i class="loading fa fa-spinner transition-opacity"></i>

  <style>
      /*
      * Animations
      */
      @-webkit-keyframes spin {
        from { -webkit-transform: rotate(0deg); }
        to { -webkit-transform: rotate(360deg); }
      }
      @-moz-keyframes spin {
        from { -moz-transform: rotate(0deg); }
        to { -moz-transform: rotate(360deg); }
      }
      @-o-keyframes spin {
        from { -o-transform: rotate(0deg); }
        to { -o-transform: rotate(360deg); }
      }
      @-ms-keyframes spin {
        from { -ms-transform: rotate(0deg); }
        to { -ms-transform: rotate(360deg); }
      }
      keyframes spin from {
        -transform: rotate(0deg);
      }
      keyframes spin to {
        -transform: rotate(360deg);
      }

      loading-icon i {
        color: #7A7A7A;
        font-size: 48px !important;
        position: absolute;

        -webkit-animation: spin 0.6s steps(8) infinite;
        -moz-animation: spin 0.6s steps(8) infinite;
        -ms-animation: spin 0.6s steps(8) infinite;
        animation: spin 0.6s steps(8) infinite;

        -webkit-transform-origin: 24.5px 22.5px;
        -moz-transform-origin: 24.5px 22.5px;
        -ms-transform-origin: 24.5px 22.5px;
        -o-transform-origin: 24.5px 22.5px;

        transform-origin: 24.5px 22.5px;
        left: 40%;
        left: -webkit-calc(50% - 24px);
        left: -moz-calc(50% - 24px);
        left: calc(50% - 24px);
        top: 40%;
        top: -webkit-calc(50% - 24px);
        top: -moz-calc(50% - 24px);
        top: calc(50% - 24px);
      }
  </style>
</loading-icon>
