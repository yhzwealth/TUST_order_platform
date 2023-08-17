import Vue from 'vue'
import App from './App'

import router from './router'
import axios from 'axios'
import qs from 'qs';

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import BaiduMap from 'vue-baidu-map'

Vue.use(BaiduMap, {
  ak: '你申请的key'
})
Vue.use(router);
Vue.use(ElementUI);

axios.defaults.baseURL = "http://localhost:8080/vue_ssm_war_exploded"

Vue.prototype.axios = axios;
Vue.prototype.qs = qs;
Vue.config.productionTip = false
axios.defaults.withCredentials = true
new Vue({
  el: '#app',
  router,
  render: h => h(App),
});


