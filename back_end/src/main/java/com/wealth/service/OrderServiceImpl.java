package com.wealth.service;

import com.wealth.mapper.OrderMapper;
import com.wealth.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public Integer addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    @Override
    public Integer deleteOrderByID(String id) {
        return orderMapper.deleteOrderByID(id);
    }

    @Override
    public Integer updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    @Override
    public List<Order> queryBookByName( String leader, Integer phone, Integer startRows) {
        return orderMapper.queryBookByName(leader, phone, startRows);
    }

    @Override
    public Integer getRowCount(String leader, Integer phone) {
        return orderMapper.getRowCount(leader,phone);
    }

    @Override
    public List<String> getTime(Date date) {
        return orderMapper.getTime(date);
    }

    @Override
    public List<Order> queryAllOrder() {
        return orderMapper.queryAllOrder();
    }
}
