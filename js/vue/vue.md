# vue3.x 目录结构

    .
    |-- node_modules/ # node 依赖库
    |-- public/
    |   `-- index.html # 首页
    `-- src/
        |-- assets/
        |   |-- css/
        |   |   `-- global.css # 全局样式表
        |   `-- fonts/ # 阿里图标库
        |       |-- iconfont.css
        |       |-- iconfont.svg
        |       |-- iconfont.eot
        |       `-- iconfont.ttf
        |-- components/
        |   `-- HelloWorld.vue # 根路由 '/' 对应的组件
        |-- plugins/        # 单独配置各个插件，再从 main.js 引入
        |   |-- elementUI.js
        |   `-- axios.js
        |-- router/
        |   `-- index.js  # 路由配置
        |-- App.vue       # 根组件
        |-- main.js       # 入口文件
        |-- package-lock.json
        `-- package.json
