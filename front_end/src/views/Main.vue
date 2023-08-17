<template>
  <div>
    <el-container style="min-width: 1500px;max-width: 1500px;margin: 0 auto">
      <el-header style="font-size: 12px;height: 100px; background: linear-gradient(to right, #1a2980, #26d0ce);">
        <el-dropdown>
          <img src="../../recourse/pic/TUSTwhite.png" height="90px" width="90px"
               style="padding-top: 5px;padding-left: 30px"/>
          <img src="../../recourse/pic/AIwhite.png" height="88px" width="88px"
               style="padding-top: 5px;padding-left: 10px"/>
          <img src="../../recourse/pic/TUSTtext.png" height="50px" width="200px"
               style="padding-bottom: 35px; padding-left: 30px"/>
          <img src="../../recourse/pic/AItext.png" height="70px" width="613px"
               style="padding-bottom: 12px; padding-left: 10px"/>

        </el-dropdown>
      </el-header>

      <el-container>
        <el-aside width="220px" style="overflow-y: hidden; min-height: 100vh">
          <el-menu
            router="router"
            style="height: 100%;"
            class="el-menu-vertical-demo"
            text-color="#fff"
            background-color="#1a2980">
            <el-menu-item index="/list/Home">
              <i class="el-icon-s-home"></i>
              首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页
            </el-menu-item>
            <el-submenu index="1">
              <template slot="title">
                <i class="el-icon-menu"></i>
                <span >展馆预约</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="/list/Order">
                  <i class="el-icon-edit-outline"></i>
                  在线预约
                </el-menu-item>
                <el-menu-item index="/list/Query">
                  <i class="el-icon-search"></i>
                  预约查询
                </el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <el-menu-item index="/list/List">
              <i class="el-icon-document"></i>
              新闻中心
            </el-menu-item>
            <el-menu-item index="/list/Contact">
              <i class="el-icon-s-opportunity"></i>
              关于我们
            </el-menu-item>
          </el-menu>
        </el-aside>

      <el-main style="min-width: 1280px;">
        <router-view/>
      </el-main>
    </el-container>
    </el-container>


  </div>
</template>

<script>
export default {
  name: "Main",
}
</script>

<style scoped lang="scss">
.el-header {
  background-color: #048bd1;
  color: #333;
  line-height: 60px;
}

.el-menu-item.is-active {
  color: #ffd04b !important;
  background: none !important;
}
</style>
