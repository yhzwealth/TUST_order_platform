<template>
  <div>
    <div style=" width:200px;font-family: 黑体 ;font-size: 40px;text-align: center;
                background: linear-gradient(to right, #00b4db, #0083b0);color: #FFF;padding-top:10px;
                padding-bottom:10px;border-radius: 5px;margin: 0 50px -5px;display: inline-block">
      在线预约
    </div>
    <div style="display: inline-block;">
      <el-button type="text" @click="open" style="font-size: 20px;font-weight: bold">查看参观制度</el-button>
    </div>
    <el-divider/>

    <div>

      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="140px" class="demo-ruleForm">

        <el-form-item label="参观场所" prop="place">
          <el-radio-group v-model="ruleForm.place">
            <el-radio label="0">人工智能教育科普基地</el-radio>
            <el-radio label="1">人工智能与大数据体验馆</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="团体名称" prop="name">
          <el-input v-model="ruleForm.name" placeholder="请输入团体名字" style="width: 400px"></el-input>
        </el-form-item>

        <el-form-item label="人员类别" prop="person">
          <el-radio-group v-model="ruleForm.person" @change="identifyToDisabled">
            <el-radio label="0">校内人员</el-radio>
            <el-radio label="1">校外人员</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="人员身份" prop="identify">
          <el-select v-model="ruleForm.identify" placeholder="请选择参观人员身份" :disabled=selectAble style="width: 800px">
            <el-option label="学校各学院、各单位、机关各部门全体教职工和离退休人员" value="1" :disabled=studentAble></el-option>
            <el-option label="各学院在校全日制普通本科生、硕士研究生和博士研究生" value="2" :disabled=studentAble></el-option>
            <el-option label="由学校统一接待的来校检查工作、参观、访问、考察、交流、洽谈项目等活动的各级领导、会议代表和外宾" value="3" :disabled=otherAble></el-option>
            <el-option label="学校各职能部门、各学院及其它单位组织或承办的各种会议的会议代表" value="4" :disabled=otherAble></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="参观人数" prop="number">
          <el-input-number v-model="ruleForm.number" :min="1" :max="30"></el-input-number>
        </el-form-item>

        <div style="display: inline-block">
          <el-form-item label="是否有重要嘉宾" prop="guest">
            <el-radio-group v-model="ruleForm.guest">
              <el-radio label="0">是</el-radio>
              <el-radio label="1">否</el-radio>
            </el-radio-group>
          </el-form-item>
        </div>

        <div style="display: inline-block;padding-left: 200px">
          <el-form-item label="是否需要解说员" prop="commentary">
            <el-radio-group v-model="ruleForm.commentary">
              <el-radio label="0">是</el-radio>
              <el-radio label="1">否</el-radio>
            </el-radio-group>
          </el-form-item>
        </div>

        <br/>

        <div style="display: inline-block">
          <el-form-item label="负责人姓名" prop="leader">
            <el-input v-model="ruleForm.leader" placeholder="请输入负责人姓名" style="width: 200px"></el-input>
          </el-form-item>
        </div>

        <div style="display: inline-block;padding-left: 100px">
          <el-form-item label="联系方式" prop="phone">
            <el-input v-model="ruleForm.phone" placeholder="请输入联系方式" style="width: 200px"></el-input>
          </el-form-item>
        </div>

        <el-form-item label="邮箱" prop="email">
          <el-input v-model="ruleForm.email" placeholder="请输入电子邮箱地址" style="width: 400px"></el-input>
        </el-form-item>

        <el-form-item label="预约日期" prop="date">
          <el-date-picker type="date" placeholder="选择参观日期"
                          v-model="ruleForm.date" style="width: 300px;"
                          @change="timeToDisabled"
                          :picker-options="pickerOptions"></el-date-picker>
        </el-form-item>

        <el-form-item label="预约时间" prop="time">
          <el-select v-model="ruleForm.time" placeholder="请选择参观时间" :disabled=timeAble style="width: 200px">
            <el-option value="09:00-10:00" :disabled=timeContent.time1></el-option>
            <el-option value="10:00-11:00" :disabled=timeContent.time2></el-option>
            <el-option value="11:00-12:00" :disabled=timeContent.time3></el-option>
            <el-option value="14:00-15:00" :disabled=timeContent.time4></el-option>
            <el-option value="15:00-16:00" :disabled=timeContent.time5></el-option>
            <el-option value="16:00-17:00" :disabled=timeContent.time6></el-option>
          </el-select>
        </el-form-item>

        <el-form-item prop="prerequisites">
          <a>我已阅读并接受</a>
          <el-button type="text" @click="open3" >人工智能教育科普基地及人工智能与大数据体验馆参观须知&nbsp</el-button>
          <el-switch v-model="ruleForm.accept"></el-switch>
          <a style="color: #F56C6C; font-size: 12px">
            &nbsp&nbsp&nbsp&nbsp{{this.tip}}
          </a>
        </el-form-item>

        <el-form-item>

          <el-button type="primary" @click="submitForm('ruleForm')">预约申请</el-button>
          <el-button @click="resetForm('ruleForm')">重置表单</el-button>
        </el-form-item>



      </el-form>

    </div>
  </div>
</template>

<script>
import {struction} from "../../../recourse/uniform";
import {struction_2} from "../../../recourse/prerequisites";
import {formatTimeToStr} from "../../assets/date";

export default {
  name: 'Order',

  data() {
    return {
      selectAble: true,
      studentAble: true,
      otherAble: true,
      timeAble: true,
      week:null,
      startDate:null,
      endDate:null,
      timeContent:{
        time1:false,
        time2:false,
        time3:false,
        time4:false,
        time5:false,
        time6:false,
      },
      tip:'',
      timeData: [],
      ruleForm: {
        id: null,
        place: null,
        name: null,
        person:null,
        identify: null,
        number:10,
        guest:null,
        commentary:null,
        leader:null,
        phone:null,
        email:null,
        date: null,
        time:null,
        accept: false
      },
      rules: {
        place: [
          { required: true, message: '请选择需要参观的场馆', trigger: 'change' }
        ],name: [
          { required: true, message: '请输入团体名称', trigger: 'blur' },
        ],person: [
          { required: true, message: '请选择参观人员类别', trigger: 'change'}
        ],identify: [
          { required: true, message: '请选择参观人员身份', trigger: 'change'}
        ],number:[
          { required: true, message: '请输入参观人数', trigger: 'blur' }
        ],guest: [
          { required: true, message: '请选择是否有嘉宾', trigger: 'change'}
        ],commentary:[
          { required: true, message: '请选择是否需要', trigger: 'change'}
        ],leader:[
          { required: true, message: '请输入负责人姓名', trigger: 'blur' },
        ],phone:[
          { required: true, message: '请输入联系方式', trigger: 'blur' },
        ],email:[
          { required: true, message: '请输入邮箱', trigger: 'blur' },
        ], date: [
          { type: 'date', required: true, message: '请选择日期', trigger: 'change' },
        ],time: [
          { required: true, message: '请选择预约时间', trigger: 'change'}
        ]
      },pickerOptions: {
        disabledDate: (time) => {
          return time.getTime() <= this.startDate
            || time.getTime() >= this.endDate;
        },
      }
    };
  },mounted() {
    this.open();
    this.getTime();
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid && !this.check()) {
          let postData = ({
            id: this.ruleForm.id,
            place: Number(this.ruleForm.place),
            name: this.ruleForm.name,
            person: Number(this.ruleForm.person),
            identify: Number(this.ruleForm.identify),
            number: Number(this.ruleForm.number),
            guest: Number(this.ruleForm.guest),
            commentary: Number(this.ruleForm.commentary),
            leader: this.ruleForm.leader,
            phone: Number(this.ruleForm.phone),
            email: this.ruleForm.email,
            date: new Date(Date.parse(this.ruleForm.date)+115200000),
            time: this.ruleForm.time
          });

          this.axios.post('/order/addOrder',postData)
            .then(() => {
            this.open2();
            this.resetForm(formName);
          }).catch(error => {
            console.log(error);
          });
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    identifyToDisabled() {
      this.ruleForm.identify=null;
      if (this.ruleForm.person === '') {
        this.selectAble = true;
      } else{
        this.selectAble = false;
        if(this.ruleForm.person === '0'){
          this.studentAble = false;
          this.otherAble = true;
        }else{
          this.studentAble = true;
          this.otherAble = false;
        }
      }
    },timeToDisabled() {
      this.timeAble = this.ruleForm.date === '';
      this.ruleForm.time=null;
      console.log(this.ruleForm.date);
      this.timeContent.time1=false;
      this.timeContent.time2=false;
      this.timeContent.time3=false;
      this.timeContent.time4=false;
      this.timeContent.time5=false;
      this.timeContent.time6=false;

      this.timeChoice();
    },open() {
      this.$alert(struction.Content.toString(), {
        confirmButtonText: '我已知悉相关制度',
        dangerouslyUseHTMLString: true,
        showClose:false,
      })
    }, open2() {
      this.$message({
        message: '预约成功',
        type: 'success'
      });
    },open3() {
      this.$alert(struction_2.Content.toString(), {
        dangerouslyUseHTMLString: true,
        showConfirmButton:false
      })
    },check(){
      if(this.ruleForm.accept===false){
        this.tip='请确认须知';
        return true;
      }else{
        this.tip='';
        return false;
      }
    },timeChoice(){
      let postData = this.qs.stringify({
        timeStamp: Number(Date.parse(this.ruleForm.date)+28800000),
      });
      this.axios.post('/order/getTime',postData)
        .then(response => {
          this.timeData = response.data;
          console.log(this.timeData);
          for(let i=0;i<this.timeData.length;i++){
            console.log(this.timeData[i]);
            if(this.timeData[i]==="09:00-10:00"){
              this.timeContent.time1=true;
            } else if(this.timeData[i]==="10:00-11:00"){
              this.timeContent.time2=true;
            }else if(this.timeData[i]==="11:00-12:00"){
              this.timeContent.time3=true;
            }else if(this.timeData[i]==="14:00-15:00"){
              this.timeContent.time4=true;
            }else if(this.timeData[i]==="15:00-16:00"){
              this.timeContent.time5=true;
            }else if(this.timeData[i]==="16:00-17:00"){
              this.timeContent.time6=true;
            }
          }
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

      this.startDate = nowTime*24*60*60*1000+3*86400000-28800000;
      this.endDate = nowTime*24*60*60*1000+(1-this.week+5*7)*86400000-28800000;
    }
  }
}
</script>

<style>
.el-message-box{
  width: 1200px;
  height: 600px;
}
</style>
