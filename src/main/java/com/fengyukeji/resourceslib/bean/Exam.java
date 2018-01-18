package com.fengyukeji.resourceslib.bean;

import java.util.Date;

public class Exam {
    private Integer id;

    private Integer customerId;

    private Date startTime;

    private Date endTime;

    private Float score;

    private Integer examSubjectId;

    private Float allScore;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
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

    public Integer getExamSubjectId() {
        return examSubjectId;
    }

    public void setExamSubjectId(Integer examSubjectId) {
        this.examSubjectId = examSubjectId;
    }

    public Float getAllScore() {
        return allScore;
    }

    public void setAllScore(Float allScore) {
        this.allScore = allScore;
    }
}