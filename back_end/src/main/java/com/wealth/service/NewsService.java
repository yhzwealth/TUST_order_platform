package com.wealth.service;

import com.wealth.pojo.News;

import java.util.List;

public interface NewsService {
    List<News> getNews(Integer startRows);

    List<News> getLateNews();

    Integer getNewsCount();
}
