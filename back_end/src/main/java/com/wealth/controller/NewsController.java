package com.wealth.controller;

import com.wealth.pojo.News;
import com.wealth.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@Controller
@RequestMapping(value = "/news")
public class NewsController {

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/getNews",method = RequestMethod.POST)
    @ResponseBody
    public List<News> getNews(Integer page){
        Integer pageNow = (page == null) ? 1 : page;
        Integer pageSize = 12;
        Integer startRows = pageSize*(pageNow-1);
        return newsService.getNews(startRows);
    }

    @RequestMapping(value = "/getLateNews",method = RequestMethod.POST)
    @ResponseBody
    public List<News> getLateNews(){
        return newsService.getLateNews();
    }

    @RequestMapping(value = "/getNewsCount",method = RequestMethod.POST)
    @ResponseBody
    public Integer getNewsCount(){
        return newsService.getNewsCount();
    }
}
