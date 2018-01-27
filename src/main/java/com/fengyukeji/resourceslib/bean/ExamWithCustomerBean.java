package com.fengyukeji.resourceslib.bean;

import java.util.Date;

public class ExamWithCustomerBean {
	
    private Integer id;

    private Date startTime;

    private Date endTime;

    private Float score;

    private Float allScore;
    
    private Customer customer;
    
    public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }


    public Float getAllScore() {
        return allScore;
    }

    public void setAllScore(Float allScore) {
        this.allScore = allScore;
    }
}