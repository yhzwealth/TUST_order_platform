package com.wealth.service;

import com.wealth.mapper.NewsMapper;
import com.wealth.pojo.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService{

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public List<News> getNews(Integer startRows) {
        return newsMapper.getNews(startRows);
    }

    @Override
    public List<News> getLateNews() {
        return newsMapper.getLateNews();
    }

    @Override
    public Integer getNewsCount() {
        return newsMapper.getNewsCount();
    }
}
