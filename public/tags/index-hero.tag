<index-hero>
  <div class="container">
    <img class="profile-pic" src="/images/profile_pic_155.png" alt="">
    <div class="inline-block">
      <h1>Brady Cartmell</h1>
      <h2>Front-end Web Developer</h2>
    </div>
    <p>
      I&#39;m an experienced front-end web developer with a strong work ethic
      and a passion for building and fine-tuning accessible, user-friendly,
      and performant interfaces.  I love learning and applying new technologies
      and techniques to solve hard and interesting problems.  I also have a solid
      understanding of business concerns and know when optimization provides 
      real benefits and when it becomes an exersize in theory.
    </p>

  </div>

  <script>
    this.on('mount', function() {
      window.addEventListener('scroll', function(event) {
        $(this.root).css(
          'background-position',
          'center ' + -(window.pageYOffset*.2) + 'px'
        );
      }.bind(this), false);
    });
  </script>

  <style>
    index-hero {
      background: url(/images/coding-screenshot.jpg) center top #252525 no-repeat;
      color: #fff;
      display: block;
      min-height: 24rem;
      padding: 2em 0;
      text-shadow: #000 1px 1px 8px;
    }

    .parallax-container {
      width: 100%;
    }

    .profile-pic {
      display: inline-block;
      margin-right: 2em;
    }
  </style>
</index-hero>
