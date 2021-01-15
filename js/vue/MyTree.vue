<template>
  <li>
    <span @click="toggle">
      <i v-if="hasChild" :class="[open ? 'el-icon-folder-opened': 'el-icon-folder' ]"></i>
      <i v-else class="el-icon-document"></i>
      {{data.label}}
    </span>
    <ul v-show="open" v-if="hasChild">
      <tree-menu v-for="(item,i) in data.children" :data="item" :key="i"/>
    </ul>
  </li>
</template>

<script>
export default {
  name: 'treeMenu', // 缺少这个属性将无法调用自身
  props: ['data'],
  data () {
    return { open: false }
  },
  computed: {
    hasChild () {
      return this.data.children && this.data.children.length
    }
  },
  methods: {
    toggle () {
      if (this.hasChild) {
        this.open = !this.open
      }
    }
  }
}
</script>

<style>
ul {
  list-style: none;
  margin: 10px 0;
}
li {
  padding: 3px 0;
}
li > span {
  cursor: pointer;
  font-size: 14px;
  line-height: 20px;
  user-select: none;
}
i.icon {
  display: inline-block;
  width: 20px;
  height: 20px;
  margin-right: 5px;
  background-repeat: no-repeat;
  vertical-align: middle;
}
.tree-menu li {
  line-height: 1.5;
}
</style>
