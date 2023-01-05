// webpack.config.js
const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  mode: "production", //production, development
  entry: {
      app: ['./src/pages/_app.tsx','./src/pages/editor.tsx']
  },
  output: {filename: 'script.js',
           path: path.resolve(__dirname, 'build'),
           clean: true,
           environment: {
              arrowFunction: false,
              const: false,
              module: false,
              dynamicImport: false
           },
           libraryTarget: 'umd',
           library: 'jsonCrack',
           publicPath: ''
          },
  module: {
    rules: [
      {
        test: /\.(js|ts)x?$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ["@babel/preset-env","@babel/preset-react","@babel/preset-typescript"],
            plugins: ["@babel/plugin-transform-arrow-functions","@babel/plugin-transform-react-jsx"]
          }
        },
      },
      {
        test: /\.css$/i,
        use: ["style-loader", "css-loader"],
      },
    ],

  },
  resolve: {
    extensions: ['.tsx', '.ts', '.jsx', '.js'], // add .tsx, .ts
    modules: ['node_modules']
  },
  plugins: [new webpack.DefinePlugin({"process.env": {NODE_ENV: JSON.stringify("production")}}), //production, development
            new HtmlWebpackPlugin({title: 'JSON Crack', filename: 'index.html', template: 'src/pages/template.html'})
           ],
  target: ['web', 'es5']
}