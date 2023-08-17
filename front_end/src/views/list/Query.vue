<template>
  <div>
    <el-form :inline="true">
      <el-form-item>
        <el-input v-model="searchLeader" placeholder="输入负责人姓名" style="margin-left: 260px;width: 230px"></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="searchPhone" placeholder="输入联系方式"style="margin-left: 20px;width: 230px"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="handlePageQuery" style="margin-left: 20px">查询预约</el-button>
      </el-form-item>

    </el-form>

    <el-table
      ref="multipleTable"
      :data="tableData"
      border
      highlight-current-row
      style="width: 100%">
      <el-table-column
        label="预约场馆">
        <template slot-scope="scope">
          <span v-if="scope.row.place===0">人工智能教育科普基地</span>
          <span v-if="scope.row.place===1">人工智能与大数据体验馆</span>
        </template>
      </el-table-column>
      <el-table-column
        label="团体名称">
        <template slot-scope="scope">
          <span>{{ scope.row.name }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="负责人姓名">
        <template slot-scope="scope">
          <span>{{ scope.row.leader }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="联系方式">
        <template slot-scope="scope">
          <span>{{ scope.row.phone }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="预约日期">
        <template slot-scope="scope">
          <span>{{ scope.row.date}}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="预约时间">
        <template slot-scope="scope">
          <span>{{ scope.row.time }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作">
        <template slot-scope="scope">
          <el-button
            type="text"
            icon="el-icon-edit"
            @click="handleEdit(scope.$index, scope.row)">编辑
          </el-button>
          <el-button
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="125px" class="demo-ruleForm" size="medium" >
      <el-dialog
        title="编辑"
        :append-to-body='true'
        :visible.sync="dialogUpdate"
        :show-close = false
        :close-on-click-modal = false
        width="65%" >

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
            <el-radio-group v-model="ruleForm.person" @change="this.identifyToDisabled">
              <el-radio label="0">校内人员</el-radio>
              <el-radio label="1">校外人员</el-radio>
            </el-radio-group>
          </el-form-item>

          <el-form-item label="人员身份" prop="identify">
            <el-select v-model="ruleForm.identify" placeholder="请选择参观人员身份" style="width: 800px">
              <el-option label="学校各学院、各单位、机关各部门全体教职工和离退休人员" value="1" :disabled=studentAble></el-option>
              <el-option label="各学院在校全日制普通本科生、硕士研究生和博士研究生" value="2" :disabled=studentAble></el-option>
              <el-option label="由学校统一接待的来校检查工作、参观、访问、考察、交流、洽谈项目等活动的各级领导、会议代表和外宾" value="3" :disabled=otherAble></el-option>
              <el-option label="学校各职能部门、各学院及其它单位组织或承办的各种会议的会议代表" value="4" :disabled=otherAble></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="参观人数" prop="number">
            <el-input-number v-model="ruleForm.number" :min="1" :max="30"></el-input-number>
          </el-form-item>

            <el-form-item label="是否有重要嘉宾" prop="guest">
              <el-radio-group v-model="ruleForm.guest">
                <el-radio label="0">是</el-radio>
                <el-radio label="1">否</el-radio>
              </el-radio-group>
            </el-form-item>

            <el-form-item label="是否需要解说员" prop="commentary">
              <el-radio-group v-model="ruleForm.commentary">
                <el-radio label="0">是</el-radio>
                <el-radio label="1">否</el-radio>
              </el-radio-group>
            </el-form-item>

            <el-form-item label="负责人姓名" prop="leader">
              <el-input v-model="ruleForm.leader" placeholder="请输入负责人姓名" style="width: 200px"></el-input>
            </el-form-item>

            <el-form-item label="联系方式" prop="phone">
              <el-input v-model="ruleForm.phone" placeholder="请输入联系方式" style="width: 200px"></el-input>
            </el-form-item>

          <el-form-item label="邮箱" prop="email">
            <el-input v-model="ruleForm.email" placeholder="请输入电子邮箱地址" style="width: 400px " ></el-input>
          </el-form-item>

          <el-form-item label="预约日期" prop="date">
            <el-date-picker type="date" placeholder="选择参观日期"
                            v-model="ruleForm.date" style="width: 300px;"
                            @change="timeToDisabled" :picker-options="pickerOptions">
            </el-date-picker>
          </el-form-item>

          <el-form-item label="预约时间" prop="time">
            <el-select v-model="ruleForm.time" placeholder="请选择参观时间" style="width: 200px">
              <el-option value="09:00-10:00" :disabled=timeContent.time1></el-option>
              <el-option value="10:00-11:00" :disabled=timeContent.time2></el-option>
              <el-option value="11:00-12:00" :disabled=timeContent.time3></el-option>
              <el-option value="14:00-15:00" :disabled=timeContent.time4></el-option>
              <el-option value="15:00-16:00" :disabled=timeContent.time5></el-option>
              <el-option value="16:00-17:00" :disabled=timeContent.time6></el-option>
            </el-select>
          </el-form-item>

        <span slot="footer" class="dialog-footer">
            <el-button @click="emptyOrderData(thisRow)" size="medium">取 消</el-button>
            <el-button @click="updateOrder('ruleForm')" type="primary" size="medium">确 定</el-button>
          </span>
      </el-dialog>
    </el-form>

    <br/>
    <el-pagination
      background
      :disabled="disablePage"
      :current-page.sync="currentPage"
      small
      layout="prev, pager, next"
      :page-size="pageSize"
      :total="total"
      @current-change="handlePageQuery">
    </el-pagination>

  </div>
</template>

<script>
export default {
  name: "Query",
  data() {
    return {
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
        time:null
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
          {required: true, message: '请选择日期', trigger: 'change' }
        ],time: [
          { required: true, message: '请选择预约时间', trigger: 'change'}
        ]
      },
      tableData: [],
      searchLeader: null,
      searchPhone: null,
      dialogUpdate: false,
      pageSize: 10,
      currentPage: 1,
      total: 0,
      disablePage: false,
      studentAble: true,
      otherAble: true,
      thisRow:null,
      timeData: [],
      timeContent:{
        time1:false,
        time2:false,
        time3:false,
        time4:false,
        time5:false,
        time6:false,
      },week:null,
      startDate:null,
      endDate:null,
      pickerOptions: {
        disabledDate: (time) => {
          return time.getTime() <= this.startDate
            || time.getTime() >= this.endDate;
        },
      }
    };
  },

  mounted() {
    this.getTime()
  },

  methods:{
    handlePageQuery() {
      let postData = this.qs.stringify({
        leader: this.searchLeader,
        phone: Number(this.searchPhone),
        page:  Number(this.currentPage)
      });

      this.axios.post('/order/queryOrder',postData)
        .then(response => {
          this.tableData = response.data;
          this.getRowCount();
        }).catch(error => {
        console.log(error);
      });
    },

    getRowCount() {
      let postData = this.qs.stringify({
        leader: this.searchLeader,
        phone: Number(this.searchPhone)
      });
      this.axios.post('/order/getRowCount',postData)
        .then(response => {
        this.total = response.data;
      }).catch(error => {
        console.log(error);
      });
    },

    handleDelete(row) {
      this.$confirm('删除该条预约信息？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        callback: action => {
          if (action === 'confirm') {
            let postData = this.qs.stringify({
              id: row.id,
            });
            this.axios.post('/order/deleteOrder',postData)
              .then(() => {
                this.getRowCount();
                if (this.total % 10 === 1 && this.currentPage >= 1) {
                  if (this.total / 10 < this.currentPage) {
                    this.currentPage = this.currentPage - 1;
                  }
                }
                this.handlePageQuery();
                this.$message({
                  type: 'success',
                  message: '删除成功!'
                });

              }).catch(error => {
              console.log(error);
            });
          }
          else {
            this.$message({
              type: 'info',
              message: '已取消删除'
            })
          }
        }
      })
    },

    handleEdit(index, row) {
      this.dialogUpdate = true;
      this.thisRow=row;
      row.place = String(row.place);
      row.person = String(row.person);
      row.identify = String(row.identify);
      row.guest = String(row.guest);
      row.commentary = String(row.commentary);
      this.ruleForm = Object.assign({}, row, index); //这句是关键！！！
      this.timeChoice(0);
    },

    emptyOrderData(row) {
      this.dialogUpdate = false;
      row.place = Number(row.place);
      row.person = Number(row.person);
      row.identify = Number(row.identify);
      row.guest = Number(row.guest);
      row.commentary = Number(row.commentary);
      this.thisRow = null;
      this.timeData = [];
      this.timeContent.time1=false;
      this.timeContent.time2=false;
      this.timeContent.time3=false;
      this.timeContent.time4=false;
      this.timeContent.time5=false;
      this.timeContent.time6=false;
      this.ruleForm = {
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
        time:null
      };
    },

    identifyToDisabled() {
        this.ruleForm.identify=null;
        if(this.ruleForm.person === '0'){
          this.studentAble = false;
          this.otherAble = true;
        }else{
          this.studentAble = true;
          this.otherAble = false;
        }
    },

    updateOrder(formName){
        this.$refs[formName].validate((valid) => {
          if (valid) {
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
            this.axios.post('/order/updateOrder',postData)
              .then(() => {
                this.open3();
                this.handlePageQuery();
              }).catch(error => {
              console.log(error);
            });
          } else {
            return false;
          }
        });
    }, open3() {
    this.$message({
      message: '修改成功',
      type: 'success'
    });
    this.dialogUpdate = false;
  },timeToDisabled() {
      this.timeAble = this.ruleForm.date === '';
      this.ruleForm.time=null;
      this.timeData = [];
      this.timeContent.time1=false;
      this.timeContent.time2=false;
      this.timeContent.time3=false;
      this.timeContent.time4=false;
      this.timeContent.time5=false;
      this.timeContent.time6=false;

      this.timeChoice(28800000);
    },timeChoice(stamp){
      let postData = this.qs.stringify({
        timeStamp: Number(Date.parse(this.ruleForm.date)+stamp),
      });
      this.axios.post('/order/getTime',postData)
        .then(response => {
          this.timeData = response.data;
          for(let i=0;i<this.timeData.length;i++){
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

<style scoped>

</style>
