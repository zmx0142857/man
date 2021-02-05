# webpack

## install

    $ mkdir webpack-demo && cd webpack-demo
    $ npm init -y
    $ npm i webpack webpack-cli@3 -D # 高版本 webpack-cli 不兼容 devserver

## setup

    $ npm i lodash

`package.json`
```
+ "private": true,
- "main": "index.js",
  "scripts": {
+   "build": "webpack"
  }
```

`src/index.js`
```
import _ from 'lodash'
console.log(_)
```

`webpack.config.js`
```javascript
const path = require('path')

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist')
  }
}
```
    $ tree -I node_modules
    .
    ├── package.json
    ├── package-lock.json
    ├── src
    │   └── index.js
    └── webpack.config.js

    1 directory, 5 files

走你

    $ npm run build

## html webpack plugin

    $ npm i html-webpack-plugin clean-webpack-plugin -D

`webpack.config.js`
```
+ const HtmlWebpackPlugin = require('html-webpack-plugin')
+ const { CleanWebpackPlugin } = require('clean-webpack-plugin')

+   plugins: [
+     new CleanWebpackPlugin(),
+     new HtmlWebpackPlugin({
+       title: 'dev - webpack demo'
+     })
+   ],
```

## dev server

    $ npm i webpack-dev-server@2.9.7 -D

`package.json`
```
  "scripts": {
+   "serve": "webpack-dev-server --open",
  }
```

`webpack.config.js`
```
+   devtool: 'inline-source-map',
+   devServer: {
+     contentBase: './dist'
+   },
```
走你

    $ npm run serve

## style loader

    $ npm i style-loader css-loader -D

`webpack.config.js`
```
+   module: {
+     rules: [
+       {
+         test: /\.css$/,
+         use: [
+           'style-loader',
+           'css-loader'
+         ]
+       }
+     ]
+   }
```

`src/style.css`
```
随便写点
```

`src/index.js`
```
+ import './style.css'
```

## copy webpack plugin

    $ npm i copy-webpack-plugin -D

`webpack.config.js`
```
+ const CopyWebpackPlugin = require('copy-webpack-plugin')

+   // 原样输出目录
+   new CopyWebpackPlugin({
+     patterns: [{
+       from: path.resolve(__dirname, 'src/fonts'),
+       to: path.resolve(__dirname, 'dist/fonts')
+     }]
+   })
```
