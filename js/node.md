## node -- server side javascript

    $ sudo apt install nodejs
    $ node -v # version

## nvm -- version control of node (optional)

    $ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

or

    $ wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

The above command will clone the nvm repository to `~/.nvm` and add the
source line to your profile (`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or
`~/.bashrc`).

You can move the command added to `~/.bashrc` to another file like:
`nvm-init.sh`, then run `source nvm-init.sh` to start nvm.

    $ nvm ls-remote # list available nodejs
    $ nvm install node # install node:
    $ nvm install v9.3.0 # install the version you want:
    $ nvm list # view listed versions:

## npm -- node package manager

    $ sudo apt install npm

    $ sudo npm config set registry https://registry.npm.taobao.org -g # 镜像加速
    $ npm config get registry

    $ npm init -y # 初始化项目，生成 package.json

    $ npm i[nstall] package # 安装 npm 依赖到当前目录的 node_modules/ 中
    # -g          全局安装, 而不是装到当前目录
    # -S / --save 自动添加到 package.json 中
    # --save-dev  自动添加到 package.json 中的开发依赖
    # -D babel-core@^7.0.0-0 安装指定版本

    $ npm start # 运行 package.json 中的 start 命令行

    $ npm run build # 打包项目生成 dist 目录, 里面有 html, css 和 js 文件等.
    # --report 展示文件大小

## npx -- do npm jobs automatically

## yarn

    $ npm install -g yarn
    $ yarn config set registry https://registry.npm.taobao.org -g

## react

    $ npm install -g create-react-app
    $ create-react-app react-demo
    $ npx create-react-app react-demo # 前两条命令可用这条代替

    $ cd react-demo
    $ npm start # 启动
    $ npm run build # 打包

## dva

    $ npm install -g dva-cli
    $ dva -v
    $ dva new dva-demo

## umi

    $ mkdir umi-demo && cd umi-demo/
    $ yarn create @umijs/umi-app
    $ yarn [install]
    $ yarn start

## vue

    $ npm install -g vue-cli # 全局安装 vue
    $ vue init webpack vue-demo # 创建基于 webpack 模板的项目, 命名为 vue-demo
    $ cd vue-demo
    $ npm install # 安装依赖
    $ npm run dev # 走你

&gt;= vue3.0: 使用图形界面初始化项目

    $ vue ui

## node 的模块化方案

### require

hello.js

    module.exports = {
      hello() {
        console.log('hello');
      }
    }
    // 或
    // exports.hello = function() {
    //   console.log('hello');
    // }

index.js

    const hello = require('./hello');
    hello.hello();

    $ node index.js

### import

hello.mjs

    function hello() {
      console.log('hello');
    }
    export { hello }

index.mjs

    import { hello } from './hello.mjs';
    hello();

## node builtin modules

fs, path, url, http, crypto...

    const fs = require('fs');
    fs.readFile('main.js', 'utf-8', function(e, data) {
      if (e) {
        console.error(e);
      } else {
        console.log(data);
      }
    });

## webpack

修改配置文件后, 需重启 npm start

    index.html
    config/index.js
    build/
      webpack.base.conf.js
      webpack.dev.conf.js
      webpack.prod.conf.js

webpack.dev.conf.js

    const devWebpackConfig = merge(baseWebpackConfig, {
      entry: {
        app: './src/main-dev.js' // 入口文件
      },
      ...
    })

webpack.prod.conf.js

    const webpackConfig = merge(baseWebpackConfig, {
      entry: {
        app: './src/main-prod.js' // 入口文件
      },
      plugins: [
        new HtmlWebpackPlugin({
          ...
          isProd: true // 自定义参数，表示生产环境
        }),
        ...
      ],
      ...
    })

index.html

    <!-- 可以使用插件自定义参数 isProd -->
    <title><%= htmlWebpackPlugin.options.isProd ? '' : 'dev - ' %>电商后台管理系统</title>
    <!-- html-webpack-plugin >= 5.0.0 可以使用 if -->
    <% if (htmlWebpackPlugin.options.isProd) { %>
      <script src="https://cdn.staticfile.org/lodash.js/4.17.11/lodash.min.js"></script>
    <% } %>

babel.config.js

    // vue3.0 有效。2.9 下没有什么卵用，console 还在
    const prodPlugins = []
    if (process.env.NODE_ENV === 'production') {
      // 生产环境用到的插件
      prodPlugins.push('transform-remove-console')
    }

    module.exports = {
      'presets': [
        '@vue/app'
      ],
      'plugins': [
        [
          'component',
          {
            'libraryName': 'element-ui',
            'styleLibraryName': 'theme-chalk'
          }
        ],
        ...prodPlugins
      ]
    }
