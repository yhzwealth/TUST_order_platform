import Vue from "vue";
import VueRouter from "vue-router";
import Main from '../views/Main'

import Order from "../views/list/Order";
import List from "../views/list/List";
import Contact from "../views/list/Contact";
import Home from "../views/list/Home";
import Query from "../views/list/Query";
import news from "./news"

Vue.use(VueRouter);
Vue.use(Order);
Vue.use(List);
Vue.use(Home);
Vue.use(Contact);
Vue.use(Main);
Vue.use(Query)

export default new VueRouter({
  mode: 'history',
  routes:[{
    path: '/main',
    component: Main,
    children:[{
      path: '/list/Order',
      name: 'Order',
      component: Order
    },{
      path: '/list/Query',
      name: 'Query',
      component: Query
    },{
      path: '/list/List',
      name: 'List',
      component: List
    },{
      path: '/list/Contact',
      name: 'Contact',
      component: Contact
    },{
      path: '/list/Home',
      name: 'Home',
      component: Home
    },...news],
    redirect:'/list/Home'
  }]
});
