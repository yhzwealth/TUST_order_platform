package com.wealth.mapper;

import com.wealth.pojo.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {
    List<News> getNews(@Param("startRows") Integer startRows);

    List<News> getLateNews();

    Integer getNewsCount();
}