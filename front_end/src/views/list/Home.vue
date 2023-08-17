<template>
  <div style="overflow: hidden">
    <div style="display: block;overflow: hidden">
      <el-carousel trigger="click" height="300px" style="overflow: inherit">
        <el-carousel-item>
          <img src="../../../recourse/pic/Carousel-4.jpg" @click="gotoLink('/news/NewsTest')">
        </el-carousel-item>
        <el-carousel-item>
          <img src="../../../recourse/pic/Carousel-1.jpg" @click="gotoLink('/news/News1')"/>
        </el-carousel-item>
        <el-carousel-item>
          <img src="../../../recourse/pic/Carousel-3.jpg" @click="gotoLink('/news/News3')"/>
        </el-carousel-item><el-carousel-item>
          <img src="../../../recourse/pic/Carousel-2.jpg" @click="gotoLink('/news/News1')"/>
        </el-carousel-item>
      </el-carousel>
    </div>

    <br>

    <div style="display: inline-flex;width: 1280px;height: 370px;overflow-y:hidden;margin: 0 auto">

      <div style="width: 475px;display: inline-block;padding-left: 5px">
        <div class="title" style="margin-left: 20px;display: block">展馆日历</div>
        <br/>
        <div style="margin-bottom: 8px">
          <el-tag type="success" style="width: 55px;text-align: center;margin-left: 10px">周一</el-tag>
          <el-tag type="success" style="width: 55px;text-align: center;margin-left: 5px">
            周二
          </el-tag>
          <el-tag type="success" style="width: 55px;text-align: center;margin-left: 5px">
            周三
          </el-tag>
          <el-tag type="success" style="width: 55px;text-align: center;margin-left: 5px">
            周四
          </el-tag>
          <el-tag type="success" style="width: 55px;text-align: center;margin-left: 5px">
            周五
          </el-tag>
          <el-tag type="success" style="width: 55px;text-align: center;margin-left: 5px">
            周六
          </el-tag>
          <el-tag type="success" style="width: 55px;text-align: center;margin-left: 5px">
            周日
          </el-tag>
        </div>
        <div v-for="i in 5">
          <div style="display: inline-flex;padding-bottom: 10px" v-for="j in 7">
            <el-button v-if="endDate>=timeFormat(i,j)" type="info" plain size="small"
                       style="width: 55px;margin-left: 10px" slot="reference"
                       @click="timeChoice(i,j-1)">
            {{getMonth(timeFormat(i,j).split('-').slice(1)[0])}}<br/>
            {{timeFormat(i,j).split('-').slice(1)[1]}}
            </el-button>
            <el-popover
              placement="right-start"
              width="250"
              trigger="click">
              <el-table :data="timeResult">
                <el-table-column width="250px" prop="time" label="剩余可预约时间段"></el-table-column>
              </el-table>
                <el-button v-if="endDate<timeFormat(i,j)" type="primary" plain size="small"
                           style="width: 55px;margin-left: 10px" slot="reference"
                           @click="timeChoice(i,j-1)">
                  {{getMonth(timeFormat(i,j).split('-').slice(1)[0])}}<br/>
                  {{timeFormat(i,j).split('-').slice(1)[1]}}
              </el-button>
            </el-popover>
          </div>
          <br/>
        </div>
      </div>

      <div style="width:auto;display: inline-flex">
        <div style="display: inline-block;width: 470px">
          <div class="title" style="margin-left: 10px;margin-bottom:15px;display: block">展馆新闻</div>
          <div v-for="i in 8">
            <el-button type="text" @click="gotoLink(tableData[i-1].route)"
                       style="width: 430px;display: block;overflow-x: hidden;
                        text-align: left;font-size: 18px;font-weight: bold;text-overflow:ellipsis;
                        padding-left: 20px;padding-top: 8px;padding-bottom: 8px">
              {{tableData[i-1].title}}
            </el-button>
            <hr style="width: 430px;margin-left: 10px;margin-top: 0px;margin-bottom: 0px"></hr>
          </div>
        </div>

        <div style="display: inline-block;width: 290px">
          <div class="title" style="display: block">关于展馆</div>
          <br>
          <ul style="display: block">
            <li>地点：天津科技大学滨海西校区<br/>&emsp;&emsp;&emsp;人工智能学院9号楼106</li>
            <br/>
            <li>联系人：人工智能学院<br/>&emsp;&emsp;&emsp;&emsp;学生工作办公室<br/>&emsp;&emsp;&emsp;&emsp;潘旭冉&nbsp;邓庆旭</li>
            <br/>
            <li>联系电话：022-60600990</li>
          </ul>
        </div>

      </div>
    </div>
  </div>
</template>

<script>

import {formatTimeToStr} from "../../assets/date"

export default {
  name: "Home",
  data(){
    return{
      tableData: [{
        title: null,
        date: null,
        route: null
      }],
      week:null,
      startDate:null,
      endDate:null,
      timeData:[],
      timeSet:[
        "09:00-10:00",
        "10:00-11:00",
        "11:00-12:00",
        "14:00-15:00",
        "15:00-16:00",
        "16:00-17:00",
      ],timeResult:[{
        time:null
      },{
        time:null
      },{
        time:null
      }]
    }
  },
  filters: {
    formatDate: function(time) {
      if(time!=null&&time!="")
      {
        var date = new Date(time);
        return formatTimeToStr(date, "yyyy-MM-dd");
      }else{
        return "";
      }
    }
  },
  created() {
    this.handlePageNews();
    this.getTime();
  },
  methods:{
    gotoLink(route){
      this.$router.push(route)
    },handlePageNews() {
      this.axios.post('/news/getLateNews')
        .then(response => {
          this.tableData = response.data;
        }).catch(error => {
        console.log(error);
      });
    },getTime(){
      let nowTime=new Date().getTime()+28800000;

      nowTime=parseInt(nowTime/1000);
      nowTime=parseInt(nowTime/60);
      nowTime=parseInt(nowTime/60);
      nowTime=parseInt(nowTime/24);
      this.week=(4+nowTime%7-1)%7+1;

      this.startDate = nowTime*24*60*60*1000-(this.week-1)*86400000-28800000;
      this.endDate = formatTimeToStr(nowTime*24*60*60*1000+3*86400000-28800000,'yyyy-MM-dd');

    },timeFormat(i,j){
      return formatTimeToStr(this.startDate+((i-1)*7+(j-1))*86400000,'yyyy-MM-dd');
    },getMonth(month){
      switch (month){
        case "01":return "Jan.";break;
        case "02":return "Feb.";break;
        case "03":return "Mar.";break;
        case "04":return "Apr.";break;
        case "05":return "May.";break;
        case "06":return "Jun.";break;
        case "07":return "Jul.";break;
        case "08":return "Aug.";break;
        case "09":return "Sept.";break;
        case "10":return "Oct";break;
        case "11":return "Nov.";break;
        case "12":return "Dec.";break;
      }
    },timeChoice(i,j){
      this.timeResult=[{
        time:null
      },{
        time:null
      },{
        time:null
      }]
      let postData = this.qs.stringify({
        timeStamp: Number(this.startDate+((i-1)*7+j)*86400000+28800000),
      });
      this.axios.post('/order/getTime',postData)
        .then(response => {
          this.timeData = response.data;
          let m=0;
          for(let i=0;i<this.timeSet.length;i++){
            let temp = 1;
            for(let j=0;j<this.timeData.length;j++){
              if(this.timeSet[i]===this.timeData[j]){
                temp = 0 ;
                break;
              }
            }
            if(temp===1){
              if(m%2===0){
                this.timeResult[m/2].time=this.timeSet[i];
              }else{
                this.timeResult[parseInt(m/2)].time=this.timeResult[parseInt(m/2)].time+"\xa0\xa0\xa0\xa0\xa0\xa0\xa0\xa0"+this.timeSet[i];
              }
              m++;
            }
          }
          this.timeResult.splice(m,6-m);

          this.timeData = [];
        }).catch(error => {
        console.log(error);
      });
    }
  }
}
</script>

<style scoped lang="scss">

.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
}

.is-selected {
  color: #1989FA;
  height: min-content;
}

.calendar-day{
  text-align: center;
}

.el-divider--vertical{
  display:inline-block;
  width:1px;
  height:350px;		//更改竖向分割线长度
  margin:0 8px;
  vertical-align:middle;
  position: relative;

}

.el-divider--horizontal{
  display:block;
  width:480px;
  height:1px;		//更改竖向分割线长度
  margin:0 8px;
  vertical-align: central;
  position:relative;
}

.title{
  width: 150px;
  font-size: 30px;
  font-family: '黑体',serif;
  font-weight: bold;
  text-align: center;
  background-color: #132e65;
  color: #FFF;
  padding-top:3px;
  padding-bottom:3px;
  border-radius: 5px;
}

.el-button:hover{
  color: #a71010;
}

</style>
