<template>
  <div style="display:inline-flex;">
    <br/>
    <div>
      <baidu-map :center="center" :zoom="zoom" @ready="handler"
                  style="height:500px;width: 500px;padding-top: 20px;" :scroll-wheel-zoom='true'>
      </baidu-map>
    </div>
<div style="padding-left: 20px;;padding-top: 40px;">
    <div style="width:600px;left: 800px;display: block">
      <div class="infoText">
            人工智能与大数据体验馆于2020年创建而成,
            体验馆位于天津科技大学滨海西校区人工智能学院9号楼106，
            场馆设序厅、院史陈列厅、智能科普厅和智能体验厅四个部分，
            主要以服务专业师生日常教学和实践为主，兼具学院三个省部级和行业平台建设，
            并赋予人工智能科普与体验等相关用途。
      </div>

      <br/>

      <div class="infoText">
            人工智能学院将以高起点规划、高标准建设聚集相关资源，
            充分发挥学院学科专业优势，主动发挥在工程科技创新和产业创新方面的主体作用，
            对催生新技术和孕育新产业发挥引领作用，对滨海新区区域经济发展和产业转型升级发挥科技支撑作用，
            在天津建设国家新一代人工智能创新发展试验区上更加有所作为。
      </div>
    </div>

    <div style="display: block;padding-left: 50px;">
      <br/><br/>
      <div class="contactText">
        &emsp;&emsp;地点：天津科技大学滨海西校区
            人工智能学院9号楼106
      </div>
      <br/>
      <div class="contactText">
        &emsp;联系人：人工智能学院学生工作办公室<br/>
        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;潘旭冉&nbsp;邓庆旭
      </div>
      <br/>
      <div class="contactText">
        联系电话：022-60600990
      </div>
  </div>
  </div>
  </div>
</template>

<script>
export default {
  name: "Contact",
  data() {
    return {
      center: {lng: 117.702895, lat: 39.094105},
      zoom: 19
    }
  },
  methods: {
    handler({BMap, map}) {
      var point = new BMap.Point(117.702895, 39.094105)
      map.centerAndZoom(point, 19)
      var marker = new BMap.Marker(point)
      map.addOverlay(marker)
    }
  }
}
</script>

<style scoped>

.infoText{
  font-size: 22px;
  font-family: 微软雅黑;
  font-weight: bold;
  text-indent: 2em;
}

.contactText{
  font-size: 20px;
  font-family: "Microsoft YaHei UI Light";
}



</style>
