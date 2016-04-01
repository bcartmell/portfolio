<skill-icon data-rating-value data-img-src data-name>
  <img src="{opts.dataImgSrc}" alt="{opts.dataName}">
  <span class="skill-name">{opts.dataName}</span>
  <star-rating data-rating-value='{opts.dataRatingValue}'><star-rating>

  <style>
    skill-icon {
      display: inline-block;
      margin: 1.6em 3em;
      max-width: 128px;
    }

    .skill-name {
      display: block;
      font-size: 1.6em;
      font-weight: bold;
      margin: .6em 0;
      text-align: center;
    }

    img {
      height: 128px;
      width: 128px;
    }
  </style>
</skill-icon>

