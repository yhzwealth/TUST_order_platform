package com.wealth.mapper;

import com.wealth.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface OrderMapper {

    //增加一个预约
    Integer addOrder(Order order);

    //根据id删除预约
    Integer deleteOrderByID(@Param("ID") String id);

    //更新预约信息
    Integer updateOrder(Order order);

    //根据姓名和手机号查询预约信息
    List<Order> queryBookByName(@Param("leader") String leader, @Param("phone") Integer phone,@Param("startRows") Integer startRows);

    Integer getRowCount(@Param("leader") String leader, @Param("phone") Integer phone);

    List<String> getTime(@Param("date") Date date);

    //查看全部的预约
    List<Order> queryAllOrder();

}
