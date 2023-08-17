<template>
  <div style="overflow-x: hidden">
    <div style=" width:200px;font-family: 黑体 ;font-size: 40px;text-align: center;
                 background: linear-gradient(to right, #4e54c8, #8f94fb);color: #FFF;padding-top:10px;
                padding-bottom:10px;border-radius: 5px;margin: 0 50px 20px;display: inline-block">
      新闻中心
    </div>

    <div v-for="i in tableData.length">
      <el-button type="text" @click="gotoLink(tableData[i-1].route)"
                  style="padding-top: 0px;padding-bottom: 0px">
        <div style="width: 870px;display: inline-block;overflow-x: hidden;overflow-y: hidden;
                    text-align: left;font-size: 20px;font-weight: bold;text-overflow:ellipsis;
                    padding-top: 8px;padding-bottom: 0px">
          &nbsp;&emsp;<i class="el-icon-caret-right"></i>&emsp;&emsp;
          {{tableData[i-1].title}}
        </div>
        <div style="width: 300px;display: inline-block;overflow-x: hidden;text-align: left;
                    font-size: 20px;font-weight: bold;padding-left: 150px;padding-top: 8px;padding-bottom: 8px">
          {{tableData[i-1].date}}
        </div>
      </el-button>
      <hr style="width: 1100px;margin-left: 70px"></hr>
    </div>

    <el-pagination
      background
      :disabled="disablePage"
      :current-page.sync="currentPage"
      small
      layout="prev, pager, next"
      :page-size="pageSize"
      :total="total"
      @current-change="handlePageNews">
    </el-pagination>
  </div>
</template>

<script>
export default {
  name: "List",
  data(){
    return{
      pageSize: 12,
      currentPage: 1,
      tableData: [{
        title: null,
        date: null,
        route: null
      }],
      total: 0,
      disablePage: false
    }
  },

  created() {
    this.handlePageNews();
  },

  methods:{
    handlePageNews() {
      let postData = this.qs.stringify({
        page:  Number(this.currentPage)
      });

      this.axios.post('/news/getNews',postData)
        .then(response => {
          this.tableData = response.data;
          this.getNewsCount();
          console.log(this.tableData);
        }).catch(error => {
        console.log(error);
      });
    },

    getNewsCount() {
      this.axios.post('/news/getNewsCount')
        .then(response => {
          this.total = response.data;

        }).catch(error => {
        console.log(error);
      });
    },

    gotoLink(route){
      this.$router.push(route);
    }
  }
}
</script>

<style scoped>
.el-button:hover{
  color: #a71010;
}
</style>
