import Vue from "vue";
import VueRouter from "vue-router";
import News1 from "../views/news/News1";
import News2 from "../views/news/News2";
import News3 from "../views/news/News3";
import NewsTest from "../views/news/NewsTest";

Vue.use(VueRouter);
Vue.use(News1);
Vue.use(News2);
Vue.use(News3);
Vue.use(NewsTest);

export default[{
    path: '/news/News1',
    name: 'News1',
    component: News1
  },{
  path: '/news/News2',
  name: 'News2',
  component: News2
},{
  path: '/news/News3',
  name: 'News3',
  component: News3
},{
  path: '/news/NewsTest',
  name: 'NewsTest',
  component: NewsTest
}]
