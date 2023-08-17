package com.wealth.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    private String ID;
    private int place;
    private String name;
    private int person;
    private int identify;
    private int number;
    private int guest;
    private int commentary;
    private String leader;
    private int phone;
    private String email;

    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;

    private String time;

}
