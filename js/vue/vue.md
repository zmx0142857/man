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
        |-- components/ # 可复用的小组件
        |   `-- HelloWorld.vue # 根路由 '/' 对应的组件
        |-- views/ # 不复用的大组件（比如一个页面）
        |-- plugins/        # 单独配置各个插件，再从 main.js 引入
        |   |-- elementUI.js
        |   `-- axios.js
        |-- router/
        |   `-- index.js  # 路由配置
        |-- App.vue       # 根组件
        |-- main.js       # 入口文件
        |-- package-lock.json
        `-- package.json

## 组件传值示例

App.js

    <template>
      <div id="app">
        <home :stored-num="num"></home>
        <btn></btn>
      </div>
    </template>

    <script>
    import Home from '@/views/Home'
    import Btn from '@/components/Btn'

    export default {
      data () {
        return {
          num: 0
        }
      },
      components: {
        Home, Btn
      }
    }
    </script>

Home.js

    <template>
      <div class="home">
        <h2>Home: {{storedNum}}</h2>
      </div>
    </template>

    <script>
    export default {
      props: ['storedNum']
    }
    </script>

## 使用 vuex 管理状态

https://vuex.vuejs.org/zh/installation.html

`store/index.js`
```js
import Vue from 'vue'
import Vuex from 'vuex'

import user from './user/'

Vue.use(Vuex)

export default new Vuex.Store({
  // state 相当于全局的 data, 不需要返回函数
  state: {
    num: 0
  },
  // getters 相当于全局的 computed
  getters: {
    getNum (state) {
      return state.num
    }
  },
  // mutations 相当于全局的 methods, 不能使用异步方法
  // 提交一个 mutation 是修改状态的唯一方式
  mutations: {
    incNum (state, payload = 1) {
      state.num += payload
    }
  },
  // actions 专门处理异步，实际修改状态的仍是 mutations
  actions: {
    incNumAsync (state, payload) {
      setTimeout(() => {
        state.commit('incNum', payload)
      }, 500)
    }
  },
  // 子模块
  modules: { user }
})
```

`stoer/user/index.js`
```
export default {
  state: {
    name: 'Fran'
  }
}
```

`views/Home.vue`
```html
<template>
  <div class="home">
    <h2>Home: {{$store.getters.getNum}}</h2>
    <p>User: {{$store.state.user.name}}</p>
  </div>
</template>
```

`views/Btn.vue`
```html
<template>
  <div>
    <button @click="$store.commit('incNum')">+1</button>
    <button @click="$store.dispatch('incNumAsync', -1)">-1</button>
  </div>
</template>
```

使模板更简洁: `import { mapState, mapGetters, mapMutations, mapActions } from 'vuex'`
