<template>
  <div class="tree-menu">
    <ul v-for="(menuItem,i) in treeData" :key="i">
      <my-tree :data="menuItem"></my-tree>
    </ul>
  </div>
</template>

<script>
import MyTree from './MyTree'
const treeData = [
  {
    'label': '基础管理',
    'children': [
      { 'label': '用户管理' },
      {
        'label': '角色管理',
        'children': [
          { 'label': '管理员' },
          { 'label': 'CEO' },
          { 'label': 'CFO' },
          { 'label': 'COO' },
          { 'label': '普通人' }
        ]
      },
      { 'label': '权限管理' }
    ]
  },
  { 'label': '商品管理' },
  {
    'label': '订单管理',
    'children': [
      { 'label': '订单列表' },
      {
        'label': '退货列表',
        'children': []
      }
    ]
  },
  { 'label': '商家管理', 'children': [] }
]
export default {
  components: { MyTree },
  data () {
    return { treeData }
  }
}
</script>
