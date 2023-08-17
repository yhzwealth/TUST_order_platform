package com.wealth.service;

import com.wealth.pojo.Order;

import java.util.Date;
import java.util.List;


public interface OrderService {

    //增加一个预约
    Integer addOrder(Order order);

    //根据id删除预约
    Integer deleteOrderByID( String id);

    //更新预约信息
    Integer updateOrder(Order order);

    //根据姓名和手机号查询预约信息
    List<Order> queryBookByName ( String leader, Integer phone, Integer startRows);

    Integer getRowCount( String leader, Integer phone);

    List<String> getTime( Date date);

    //查看全部的预约
    List<Order> queryAllOrder();

}
