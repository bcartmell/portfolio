var path = require('path');
var webpack = require('webpack');

module.exports = {
  entry: __dirname + '/public/javascripts/index.js',
  output: {
    path: __dirname + '/',
    filename: 'public/javascripts/bundle.js'
  },
  module: {
    loaders: [
      {
        loader: 'babel-loader',
        test: path.join(__dirname),
        query: {
          presets: ['es2015']
        },
      }
    ]
  },
  plugins: [
    // Avoid publishing files when compilation fails
    new webpack.NoErrorsPlugin()
  ],
  stats: {
    colors: true
  },
  // Create Sourcemaps for the bundle
  devtool: 'source-map',
};
