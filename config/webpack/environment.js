const webpack = require(‘webpack’)
environment.plugins.append(‘Provide’, new webpack.ProvidePlugin({
  $: 'jquery',
  jquery: 'jQuery',
  Popper: ['popper.js', 'default']
})
