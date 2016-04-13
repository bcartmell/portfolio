<grid-panel data-img-src data-project-name data-project-url data-project-description data-bg-color data-font-color>
  <div class="panel-card">
    <div class="card-face card-front">
      <img src={this.opts.dataImgSrc} alt={this.opts.dataProjectName}>
    </div>
    <div class="card-face card-back" style="background: {this.opts.dataBgColor}; color: {this.opts.dataFontColor}">
      <p>{this.opts.dataProjectDescription}</p>
      <p>{this.opts.dataTech}</p>
      <a href="{this.opts.dataProjectUrl}" class="button" style="background: {this.opts.dataLinkColor}; color:#fff;">Details</a>
    </div>
  </div>

  <script>
    function activatePanel(event) {
      var $currentlyActive = $(this.root).find('.active');
      $active.removeClass('.active');
      if ($(event.target).parents('grid-panel') !== $currentlyActive) {
        $(event.target).parents('grid-panel').addClass('active');
      }
    }

    this.on('mount', function() {
      if ('ontouchstart' in window) {
        $(this.root).on('click', '.panel-card', activatePanel);
      }

      function toggleBackface($element) {
        var transDuration = okieHelpers.getTransDuration($element[0]);
        var $face = $element.find('.card-face');
        setTimeout(function() {
          if ($element.is(':hover')) $face.addClass('backface-visible');
          else $face.removeClass('backface-visible');
        }, transDuration);
      }

      // For benefit of IE
      $(this.root).hover(function() {
        toggleBackface($(this));
      });
    })
  </script>
  
  <style>
    grid-panel {
      display: inline-block;
      height: 256px;
      line-height: 1.3em;
      width: 256px;
      margin: 0;
      perspective: 500;
      position: relative;
      vertical-align: top;
      transition: all .3s ease-in-out;
      z-index: 0;
    }

    grid-panel p {
      margin: 1em 0;
    }

    grid-panel p {
      margin: 1em 0;
    }

    grid-panel .panel-card {
      width: 100%;
      height: 100%;
      position: absolute;
      transform-style: preserve-3d;
      transition: transform .6s ease-in-out;
      will-change: transform;
    }

    grid-panel .card-face {
      box-sizing: border-box;
      margin: 0;
      display: block;
      position: absolute;
      width: 100%;
      height: 100%;
      z-index: 0;

      -webkit-backface-visibility: hidden;
      backface-visibility: hidden;
    }

    grid-panel .card-face.backface-visible {
      -webkit-backface-visibility: visible;
      backface-visibility: visible;
    }

    grid-panel .card-back {
      background: #ccc;
      box-shadow: 2px 0 12px 0 #000;
      padding: 1em;
      transform: rotateY(180deg);
      z-index: 1;
    }

    grid-panel:hover,
    grid-panel.active {
      z-index: 3;
      transform: translateZ(5px);
    }

    grid-panel:hover>.panel-card,
    grid-panel.active>.panel-card {
      transform: rotateY(180deg) scale(1.2);
    }
  </style>

</grid-panel>

<work-grid>
  <grid-panel data-img-src="/images/grid-panel-nest-certified.png" data-project-name="Nest Certified" data-project-description="Professional Services Portal for Nest Certified Installers" data-bg-color="#EAF1F4" data-font-color="#555" data-tech="eCommerce, services scheduling, custom currency, Signup approval process" data-link-color="#00AFD8" data-project-url="/project-details/nest-certified">
  </grid-panel><!--

  --><grid-panel data-img-src="/images/grid-panel-astro.png" data-project-name="Astro Gaming" data-bg-color="#000" data-font-color="#fff" data-project-description="Product Registration Portal and Private store" data-tech="Product Registration, Persistent Portal, eCommerce" data-link-color="#FF3300" data-project-url="/project-details/astro">
  </grid-panel><!--

  --><grid-panel data-img-src="/images/grid-panel-motili.png" data-project-name="Motili" data-project-description="Professional Services Portal for Motili Contractors" data-project-url="/project-details/motili" data-bg-color="#3b2416" data-font-color="#F6F6F6" data-link-color="#3794D8" data-tech="Services Scheduling, eCommerce, Persistent Portal, Dynamic Data Tables, Work-order management, Responsive Layout">
  </grid-panel><!--

  --><grid-panel data-img-src="/images/grid-panel-backtrack.png" data-project-name="BackTrack GPS" data-tech="Product registration, support portal" data-bg-color="#2C2C2C" data-font-color="#fff" data-link-color="#b52025" data-project-url="/project-details/dtour" data-project-description="User support portal for BackTrack DTOUR GPS">
  </grid-panel><!--

  --><grid-panel data-img-src="/images/grid-panel-swash.png" data-project-name="Whirlpool Swash" data-project-description="Registriation portal for Whirlpool Swash products" data-tech="Product registration, Photoregister" data-project-url="/project-details/swash" data-bg-color="#ff6a00" data-font-color="#fff" data-link-color="#2B2B28">
  </grid-panel><!--

  --><grid-panel data-img-src="/images/grid-panel-bushnell.png" data-project-name="Bushnell" data-bg-color="#cd5a13" data-font-color="#fff" data-link-color="#3F2F16" data-project-description="Bushnell Outdoor Products registration portal" data-tech="Product registration, support portal, eCommerce" data-project-url="/project-details/bushnell">
  </grid-panel><!--
  
  --><grid-panel data-img-src="/images/grid-panel-ferguson-crest.png" data-project-name="Ferguson Crest" data-bg-color="#B29E6B" data-font-color="#000" data-link-color="#000" data-project-description="Ferguson Crest Wine Shop" data-project-url="/project-details/ferguson" data-tech="Marketing, persistent portal, wine club, promotions, ecommerce">
  </grid-panel><!--

  --><grid-panel data-img-src="/images/grid-panel-icon.png" data-project-name="Icon Fitness" data-bg-color="#ED1B2D" data-font-color="#fff" data-link-color="#0f0f0f" data-project-description="Mult-brand registration portal for Icon Fitness products" data-tech="Multi-theme, eCommerce, Persistent portal, marketing promotions" data-project-url="/project-details/icon">
  </grid-panel>

</work-grid>
