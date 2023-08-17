package com.wealth.controller;

import com.wealth.pojo.Order;
import com.wealth.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@CrossOrigin(origins = "*", maxAge = 3600)
@Controller
@RequestMapping(value = "/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/addOrder",method = RequestMethod.POST)
    @ResponseBody
    public Integer addOrder(@RequestBody Order order){
        UUID uuid = UUID.randomUUID();
        order.setID(uuid.toString());
        return orderService.addOrder(order);
    }

    @RequestMapping("/deleteOrder")
    @ResponseBody
    public Integer deleteOrder(@RequestParam(value = "id") String id){
        return orderService.deleteOrderByID(id);
    }

    @RequestMapping(value = "/updateOrder",method = RequestMethod.POST)
    @ResponseBody
    public Integer updateOrder(@RequestBody Order order){
        return orderService.updateOrder(order);
    }

    @RequestMapping(value = "/queryOrder",method = RequestMethod.POST)
    @ResponseBody
    public List<Order> queryOrder(@RequestParam(value = "leader") String leader,
                                  @RequestParam(value = "phone") Integer phone,
                                  @RequestParam(value = "page") Integer page){
        Integer pageNow = (page == null) ? 1 : page;
        Integer pageSize = 10;
        Integer startRows = pageSize*(pageNow-1);
        return orderService.queryBookByName(leader,phone,startRows);
    }

    @RequestMapping(value = "/getRowCount",method = RequestMethod.POST)
    @ResponseBody
    public Integer getRowCount(@RequestParam(value = "leader") String leader, @RequestParam(value = "phone") Integer phone){
        return orderService.getRowCount(leader,phone);
    }

    @RequestMapping(value = "/getTime",method = RequestMethod.POST)
    @ResponseBody
    public List<String> getTime(@RequestParam(value = "timeStamp") Long timeStamp){
        Date date  = new Date(timeStamp);
        return orderService.getTime(date);
    }

    @RequestMapping("/queryAll")
    @ResponseBody
    public List<Order> queryAll(){
        return orderService.queryAllOrder();
    }

}
