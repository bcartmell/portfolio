<loading-icon>
  <i class="loading fa fa-spinner fa-pulse"></i>
  <div class="message">
    <yield />
  </div>

  <style>
      loading-icon {
        color: #7A7A7A;
        display: table-cell;
        vertical-align: middle;
        font-size: 48px !important;
      }
      
      loading-icon .message {
        font-size: .3em;
        margin-top: 1em;
      }
  </style>
</loading-icon>
