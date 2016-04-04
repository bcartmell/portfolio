<main-nav>
  <nav class="u-full-width">
    <a href="/" id="logo">
      <img src="/images/logo.png" alt="Brady Cartmell">
    </a>
    <button id="show-nav-button">
      <i class="fa fa-navicon"></i>
    </button>
    <ul class="nav-menu u-cf u-full-width">
      <li><a href="/">Home</a></li>
      <li><a href="/project-details">Past Work</a></li>
      <li><a href="http://resume.bcartmell.online" target="_blank">Resume</a></li>
      <li><a href="/contact">Contact</a></li>
    </ul>
  </nav>
  <div class="nav-spacer">
  </div>

  <script>
    function matchHeight($target, $reference) {
      // set height of .nav-spacer
      $target.height( $reference.height() );
    }

    this.on('mount', function() {
      matchHeight($('.nav-spacer'), $('nav'));
      $(window).on('resize', function() {
        matchHeight($('.nav-spacer'), $('nav'));
      });

      // setup #show-nav-button
      var $menu = $('ul', this.root);
      $('#show-nav-button', this.root).on('click', function() {
        $menu.slideToggle(300);
      });
    });
  </script>

  <style>
    main-nav nav {
      background: #2C2C2C;
      box-shadow: 0 2px 3px -1px #000;
      position: fixed;
        top: 0;

      overflow: hidden;
      vertical-align: middle;
      z-index: 10;
    }
    
    main-nav .nav-spacer {
      display: block;
      height: 3.8em;
    } 

    main-nav #logo {
      display: inline-block;
      margin: 1em 0 0 1em;
    }

    main-nav .nav-menu {
      display: none;
      text-align: center;
      margin-bottom: 0;
    }

    .nav-menu li {
      display: block;
      margin: 0;
    }

    .nav-menu li:hover {
      background: #222;
      box-shadow: inset 0 0 6px -3px #cccccc;
    }

    .nav-menu li a {
      display: block;
      padding: 1.3em 1.6em;
    }

    .nav-menu .toggle-nav-menu {
      float: right;
      margin: .7rem;
    }

    main-nav #show-nav-button {
      color: #fff;
      float: right;
      font-size: 1.3em;
      padding: 0 .6em;
      margin: .65em;
    }

    @media screen and (min-width: 768px) {
      main-nav .nav-menu {
        display: block !important;
        flot: right;
      }

      .nav-menu li {
        display: inline-block;
      }

      main-nav #show-nav-button {
        display: none;
      }
    }
  </style>
</main-nav>
